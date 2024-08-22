<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');

session_start();
$idventa = $_GET['id'];
$per_id = $_SESSION['ids'];
$vend;
$appe; 

include_once "lib/cnx.php";
include_once "lib/conexion.php";
//Abonos
$sqlabo = "SELECT * FROM Ventas WHERE ID_Venta = ".$idventa;
//echo $sqlabo;
$queryabo = $conexion -> query($sqlabo);
$abono = mysqli_fetch_array($queryabo);

    //obtiene datos del vendedor-------------------------------------------------------
    $sql = $base_de_datos->query("SELECT * FROM Personal WHERE ID_Personal = ".$per_id);
    $personal = $sql->fetchAll(PDO::FETCH_OBJ);
    foreach($personal as $vendedor){
        $vend = $vendedor->Nombre;
        $appe = $vendedor->Apellido;
        //obtiene datos de la sucursal-------------------------------------------------
        $sql1 = $base_de_datos->query("SELECT * FROM Sucursales WHERE ID_Sucursal = ".$vendedor->ID_Sucursal);
        $sucursales = $sql1->fetchAll(PDO::FETCH_OBJ);
        foreach($sucursales as $sucursal){
            // CONFIGURACIÓN PREVIA
            require('lib/APIs/fpdf/fpdf.php');
            class PDF extends FPDF{
            // Cabecera de página
                function Header(){
                // Logo
                        //$this->Image('lib/Empresa/img/blitzc0de.jpg', 15,-1,15);
                        //$this->Image($sucursal->Logo, 15, -1 ,15);// file, w, h, size
                        $this->Ln(7);   
                    }
                }
            #Creamos el objeto pdf (con medidas en milímetros): 
            //$pdf = new FPDF('P', 'mm', 'A4'); 
            //$pdf = new FPDF('P','mm',array(80,150));
            $pdf = new PDF('P','mm',array(70,75));
            //
            #Establecemos los márgenes del texto izquierda, arriba y derecha: 
            $pdf->SetMargins(5, -1 , 2); 
            #Establecemos el margen inferior: 
            $pdf->SetAutoPageBreak(true,1); 
            define('Pesos',chr(36));
            $pdf->AddPage();

            // CABECERA----------------------------------
            $pdf->SetFont('Helvetica','',9);
            
            //$pdf->MultiCell(190,40, $pdf->Image($sucursal->Logo, $pdf->GetX()+40, $pdf->GetY()+3, 100) ,0,"C");
            //$pdf->Image($sucursal->Logo, 17, 2,15);
            $pdf->Cell(0,4,$sucursal->Nombre,0,1,'C');//Nombre Empresa
            $pdf->SetFont('Helvetica','',7);
            $pdf->Cell(0,3,'RFC: '.$sucursal->RFC,0,1,'C');//RFC

            //$pdf->Cell(60,4,,0,1,'C'); w, h, string, border, ln, allign
            $pdf->Cell(0,3,$sucursal->Direccion.' Col. '.$sucursal->Colonia,0,1,'C');//Direccion
            $pdf->Cell(0,3,' C.P. '.$sucursal->Cp.' '.$sucursal->Municipio,0,1,'C');//Ubicacion
            $pdf->Cell(0,3,'Tel: '.$sucursal->Telefono,0,1,'C');//Tel
            $pdf->Cell(0,3,'Propietario: '.$sucursal->Gerente,0,1,'C');//ger
            $pdf->Cell(0,3,$sucursal->Correo,0,1,'C');//Correo
        }//End Sucursal------------------------------------------------------------------

    }//END Vendedor----------------------------------------------------------------------

    // DATOS FACTURA        
    $pdf->Ln(4);
     $sql0 = $base_de_datos->query("SELECT Nombres, Apellidos FROM Clientes WHERE ID_Cliente = ".$abono['ID_Cliente']);
    $clientes = $sql0->fetchAll(PDO::FETCH_OBJ);
    foreach($clientes as $cliente){
        $pdf->Cell(0,3,'Cliente: '.$cliente->Nombres.' '.$cliente->Apellidos,0,1,'L');
    }
    $pdf->Cell(0,3,'Venta/Cambio # 0'.$abono['ID_Venta'],0,1,'L');
    if ($abono['Total'] < 0) {
        $pdf->Cell(0,3,'Valido hasta: '.date('d-m-Y', strtotime ($abono['Fecha_Fin'])),0,1,'L');
    }else{
        $pdf->Cell(0,3,'Fecha: '.date('d-m-Y', strtotime ($abono['Fecha'])),0,1,'L');
    }
    //Obtiene al cliente por el id conseguido en ventas-----------------------------------
   //End Cliente------------------------------------------------------------------------
    
    //Obtiene el medio de pago por el id conseguido en ventas------------------------------
    /* $sql02 = $base_de_datos->query("SELECT * FROM Medio_Pago WHERE ID_Medio = ".$venta->ID_Medio);
    $medio = $sql02->fetchAll(PDO::FETCH_OBJ);
    foreach($medio as $pago){
        
    } */
    /* switch ($abono['ID_Medio']) {
        case 1:
            # code...
             $pdf->Cell(0,3,'Metodo de pago: Efectivo',0,1,'L');
            break;
        case 2:
            # code...
             $pdf->Cell(0,3,'Metodo de pago: SPEI/TARJETA',0,1,'L');
            break;
        
        default:
            # code...
            break;
    } */
    //$pdf->Cell(0,3,'Metodo de pago: Credito',0,1,'L');
  //END Venta Detalles--------------------------------------------------------------------------

    // SUMATORIO DE LOS PRODUCTOS Y EL IVA
   
   // $sqlant = "SELECT MAX(ID_Abono) as ida, Saldo_Pend FROM Abonos GROUP BY ID_Venta ORDER BY ID_Venta DESC";
   if ($abono['Total'] < 0) {

        $pdf->Cell(25, 10, 'Vale Por :', 0);    
        $pdf->Cell(20, 10, '$ '.abs($abono['Total']), 0);
        $pdf->Ln(6);    
   }else{
        $pdf->Ln(1);
        $pdf->Cell(47,0,'','T');
        $pdf->Ln(1);    
        $pdf->Cell(0, 10, 'Subtotal:', 0,0, 'L');    
        $pdf->Cell(20, 10, '', 0);
        $pdf->Cell(0, 10, '$ '.$abono['Subtotal'] ,0,0,'R');
        $pdf->Ln(3);    
        $pdf->Cell(25, 10, 'Descuento:', 0);    
        $pdf->Cell(20, 10, '', 0);
        $pdf->Cell(0, 10, '('.$abono['Descuento_porcent'].'%) '.'$ '.$abono['Descuento_efect'] ,0,0,'R');
        $pdf->Ln(3);  
        $pdf->Cell(25, 10, 'Total:', 0);    
        $pdf->Cell(20, 10, '', 0);
        $pdf->Cell(0, 10, '$ '.$abono['Total'],0,0,'R');
        $pdf->Ln(3); 
        $pdf->Cell(25, 10, 'Su Pago: ', 0);    
        $pdf->Cell(20, 10, '', 0);
        $pdf->Cell(0, 10, '$ '.$abono['Efectivo'] ,0,0,'R');
        $pdf->Ln(3);    
        $pdf->Cell(25, 10, 'Su Cambio:', 0);    
        $pdf->Cell(20, 10, '', 0);
        $pdf->Cell(0, 10, '$ '.$abono['Cambio'] ,0,0,'R');
        $pdf->Ln(6);    
    //$pdf->Cell(0, 10, 'IVA YA INCLUIDO', 0,0,'C');  
   }
    //$pdf->Cell(0, 10, 'IVA YA INCLUIDO', 0,0,'C');  

//END Venta-----------------------------------------------------------------------------
 
// PIE DE PAGINA
$pdf->Ln(1);
$pdf->Ln(4);
$pdf->Cell(0,0,'Verifique su comprobante ',0,1,'C');
$pdf->Output('abono.pdf','i');
?>
