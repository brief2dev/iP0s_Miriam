<?php
$idventa = $_GET['id'];
$vend;
$appe; 

include_once "lib/cnx.php";
include_once "lib/conexion.php";
//Obtiene datos de la venta------------------------------------------------------------
$sentencia = $base_de_datos->query("SELECT * FROM Ventas WHERE ID_Venta = ".$idventa);
$ventas = $sentencia->fetchAll(PDO::FETCH_OBJ); 
foreach($ventas as $venta){
    //obtiene datos del vendedor-------------------------------------------------------
    $sql = $base_de_datos->query("SELECT * FROM Personal WHERE ID_Personal = ".$venta->ID_Personal);
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
            $pdf = new PDF('P','mm',array(70,130));
            //
            #Establecemos los márgenes del texto izquierda, arriba y derecha: 
            $pdf->SetMargins(5, 1 , 2); 
            #Establecemos el margen inferior: 
            $pdf->SetAutoPageBreak(true,1); 
            define('Pesos',chr(36));
            $pdf->AddPage();

            // CABECERA----------------------------------
            $pdf->SetFont('Helvetica','',9);
            
            //$pdf->MultiCell(190,40, $pdf->Image($sucursal->Logo, $pdf->GetX()+40, $pdf->GetY()+3, 100) ,0,"C");
            $pdf->Image($sucursal->Logo, 28, 1,15);
            $pdf->Cell(0,4,$sucursal->Nombre,0,1,'C');//Nombre Empresa
            $pdf->SetFont('Helvetica','',9);
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
    $pdf->Cell(0,3,'Ticket # 0'.$venta->ID_Venta,0,1,'L');
    $pdf->Cell(0,3,'Fecha: '.date('d-m-Y', strtotime($venta->Fecha)),0,1,'L');
    //$pdf->Cell(0,3,'Destino: '.$venta->ID_Destino,0,1,'L');

    //Obtiene al cliente por el id conseguido en ventas-----------------------------------
    $sql0 = $base_de_datos->query("SELECT Nombres, Apellidos FROM Clientes WHERE ID_Cliente = ".$venta->ID_Cliente);
    $clientes = $sql0->fetchAll(PDO::FETCH_OBJ);
    foreach($clientes as $cliente){
        $pdf->Cell(0,3,'Cliente: '.$cliente->Nombres.' '.$cliente->Apellidos,0,1,'L');
    }//End Cliente------------------------------------------------------------------------
    
    //Obtiene el medio de pago por el id conseguido en ventas------------------------------
    $sql02 = $base_de_datos->query("SELECT * FROM Medio_Pago WHERE ID_Medio = ".$venta->ID_Medio);
    $medio = $sql02->fetchAll(PDO::FETCH_OBJ);
    foreach($medio as $pago){
        $pdf->Cell(0,3,'Metodo de pago: '.$pago->Tipo,0,1,'L');
    }
    

    // COLUMNAS
    $pdf->SetFont('Helvetica', 'B', 7);
    $pdf->Cell(0, 10, 'Articulo',0,0,'L');
    $pdf->Cell(-18, 10, 'Cant.',0,0,'R');
    $pdf->Cell(10, 10, 'Precio',0,0,'R');
    $pdf->Cell(0, 10, 'Total',0,0,'R');
    $pdf->Ln(8);
    $pdf->Cell(60,0,'','T');//pinta Linea__________________
    $pdf->Ln(2);

    //Obtiene datos de Venta Detalles-----------------------------------------------------------------
    $sql2 = "SELECT * FROM Venta_Detalle WHERE ID_Venta = ".$idventa;
    $query2 = $conexion -> query ($sql2);
    while ($detalles = mysqli_fetch_array($query2)){
         // PRODUCTOS
         $pdf->SetFont('Helvetica', '', 8);
         //Obtiene los producto con el id guardados en venta detalle-------------
         $sql3 = "SELECT * FROM Productos WHERE ID_Producto = ".$detalles['ID_Producto'];
         $query3 = $conexion -> query ($sql3);
         while ($produc = mysqli_fetch_array($query3)){
            $pdf->MultiCell(300,2,$produc['Nombre'],0,'L'); //nombre de producto
            $pdf->Cell(43, -2, $detalles['Cantidad'],0,0,'R'); // cantidad del producto
            $pdf->Cell(10, -2, '$'.$produc['PrecioVenta'],0,0,'R'); //Precio unitario
            $precio = floatval($produc['PrecioVenta']);
            $cant = intval($detalles['Cantidad']);
            $pdf->Cell(10, -2, '$'.number_format(round($cant*$precio,2), 2, $dec_point, ''),0,0,'R');//Total
            $pdf->Ln(1);
         }//END Productos

    }    //END Venta Detalles--------------------------------------------------------------------------

    // SUMATORIO DE LOS PRODUCTOS Y EL IVA
    $pdf->Ln(1);
    $pdf->Cell(60,0,'','T');
    $pdf->Ln(1);    
    $pdf->Cell(0, 10, 'Subtotal:', 0,0, 'L');    
    $pdf->Cell(20, 10, '', 0);
    $pdf->Cell(0, 10, '$ '.$venta->Subtotal ,0,0,'R');
    $pdf->Ln(3);    
    $pdf->Cell(25, 10, 'Descuento:', 0);    
    $pdf->Cell(20, 10, '', 0);
    $pdf->Cell(0, 10, '('.$venta->Descuento_porcent.'%) '.'$ '.$venta->Descuento_efect ,0,0,'R');
    $pdf->Ln(3);  
    $pdf->Cell(25, 10, 'Total:', 0);    
    $pdf->Cell(20, 10, '', 0);
    $pdf->Cell(0, 10, '$ '.$venta->Total,0,0,'R');
    $pdf->Ln(3); 
    if ($venta->ID_Destino == 1) {
        $pdf->Cell(25, 10, 'Su Pago: ', 0);    
        $pdf->Cell(20, 10, '', 0);
        $pdf->Cell(0, 10, '$ '.$venta->Efectivo ,0,0,'R');
        $pdf->Ln(3);    
        $pdf->Cell(25, 10, 'Su Cambio:', 0);    
        $pdf->Cell(20, 10, '', 0);
        $pdf->Cell(0, 10, '$ '.$venta->Cambio ,0,0,'R');
        $pdf->Ln(6);    
    }
    
    //$pdf->Cell(0, 10, 'IVA YA INCLUIDO', 0,0,'C');  

}//END Venta-----------------------------------------------------------------------------
 
// PIE DE PAGINA
$pdf->Ln(10);
$pdf->Cell(0,0,'Atendio: '.$vend.' '.$appe,0,1,'R');
$pdf->Ln(4);
$pdf->Cell(0,0,'Conserva tu Ticket de Compra para aclaraciones',0,1,'C');
//$pdf->Ln(3);
//$pdf->Cell(0,0,'El Cambio es por defecto de fabrica.',0,1,'C');
//$pdf->Ln(3);
switch ($venta->ID_Destino) {
    case 1:
         $pdf->Ln(4);
        $pdf->Cell(0,0,'***VENTA***',0,1,'C');
        break;
    case 2:
        # code...
         $pdf->Ln(4);
        $pdf->Cell(0,0,'***CREDITO***',0,1,'C');
        break;
    case 3:
        # code...
         $pdf->Ln(4);
        $pdf->Cell(0,0,'***APARTADO***',0,1,'C');
        break;
    default:
        # code...
        break;
}

$pdf->Output('ticket.pdf','i');
?>
