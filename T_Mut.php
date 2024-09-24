<?php

session_start();
$idventa = $_GET['id']; //ID_Deuda(Abono)
$per_id = $_SESSION['ids'];

$idmt = $_GET['mt'];
$vend;
$appe;

include_once "lib/cnx.php";
include_once "lib/conexion.php";
//Abonos
$sqlabo = "SELECT * FROM M_Abonos WHERE ID_Abono = " . $idventa;
//echo $sqlabo;
$queryabo = $conexion->query($sqlabo);
$abono = mysqli_fetch_array($queryabo);

//obtiene datos del vendedor-------------------------------------------------------
$sql = $base_de_datos->query("SELECT * FROM Personal WHERE ID_Personal = " . $per_id);
$personal = $sql->fetchAll(PDO::FETCH_OBJ);
foreach ($personal as $vendedor) {
    $vend = $vendedor->Nombre;
    $appe = $vendedor->Apellido;
    //obtiene datos de la sucursal-------------------------------------------------
    $sql1 = $base_de_datos->query("SELECT * FROM Sucursales WHERE ID_Sucursal = " . $vendedor->ID_Sucursal);
    $sucursales = $sql1->fetchAll(PDO::FETCH_OBJ);
    foreach ($sucursales as $sucursal) {
        // CONFIGURACIÓN PREVIA
        require('lib/APIs/fpdf/fpdf.php');
        class PDF extends FPDF
        {
            // Cabecera de página
            function Header()
            {
                // Logo
                //$this->Image('lib/Empresa/img/blitzc0de.jpg', 15,-1,15);
                //$this->Image($sucursal->Logo, 15, -1 ,15);// file, w, h, size
                $this->Ln(7);
            }
        }
        #Creamos el objeto pdf (con medidas en milímetros): 
        //$pdf = new FPDF('P', 'mm', 'A4'); 
        //$pdf = new FPDF('P','mm',array(80,150));
        $pdf = new PDF('P', 'mm', array(70, 75));
        //
        #Establecemos los márgenes del texto izquierda, arriba y derecha: 
        $pdf->SetMargins(5, -1, 2);
        #Establecemos el margen inferior: 
        $pdf->SetAutoPageBreak(true, 1);
        define('Pesos', chr(36));
        $pdf->AddPage();

        // CABECERA----------------------------------
        $pdf->SetFont('Helvetica', '', 9);

        //$pdf->MultiCell(190,40, $pdf->Image($sucursal->Logo, $pdf->GetX()+40, $pdf->GetY()+3, 100) ,0,"C");
        //$pdf->Image($sucursal->Logo, 17, 2,15);
        $pdf->Cell(0, 4, $sucursal->Nombre, 0, 1, 'C'); //Nombre Empresa
        $pdf->SetFont('Helvetica', '', 7);
        $pdf->Cell(0, 3, 'RFC: ' . $sucursal->RFC, 0, 1, 'C'); //RFC

        //$pdf->Cell(60,4,,0,1,'C'); w, h, string, border, ln, allign
        $pdf->Cell(0, 3, $sucursal->Direccion . ' Col. ' . $sucursal->Colonia, 0, 1, 'C'); //Direccion
        $pdf->Cell(0, 3, ' C.P. ' . $sucursal->Cp . ' ' . $sucursal->Municipio, 0, 1, 'C'); //Ubicacion
        $pdf->Cell(0, 3, 'Tel: ' . $sucursal->Telefono, 0, 1, 'C'); //Tel
        $pdf->Cell(0, 3, 'Propietario: ' . $sucursal->Gerente, 0, 1, 'C'); //ger
        $pdf->Cell(0, 3, $sucursal->Correo, 0, 1, 'C'); //Correo
    } //End Sucursal------------------------------------------------------------------

} //END Vendedor----------------------------------------------------------------------

// DATOS FACTURA        
$pdf->Ln(4);
$pdf->Cell(0, 3, 'Abono # 0' . $abono['ID_Abono'], 0, 1, 'L');

$sqlfl = "SELECT * FROM M_MDetalles WHERE ID_Detalle = " . $abono['ID_Mutualista'];
$queryfl = $conexion->query($sqlfl);
$fel = mysqli_fetch_array($queryfl);

$pdf->Cell(0, 3, 'Mutualista # 0' . $fel['ID_Detalle'], 0, 1, 'L');
$pdf->Cell(0, 3, 'Fecha: ' . date('d/m/Y', strtotime($abono['Fecha'])), 0, 1, 'L');
switch ($fel['Tiempo_Pago']) {
    case '7':
        # code...
        $pdf->Cell(0, 3, 'Tipo de pago: Semanal', 0, 1, 'L');
        break;
    case '14':
        # code...
        $pdf->Cell(0, 3, 'Tipo de pago: Catorsenal', 0, 1, 'L');
        break;
    case '30':
        # code...
        $pdf->Cell(0, 3, 'Tipo de pago: Mensual', 0, 1, 'L');
        break;

    default:
        # code...
        break;
}

//$pdf->Cell(0, 3, '' . $abono['ID_Cliente'], 0, 1, 'L');


//Obtiene al cliente por el id conseguido en ventas-----------------------------------
$sql0 = $base_de_datos->query("SELECT Nombres, Apellidos FROM Clientes WHERE ID_Cliente = " . $abono['ID_Cliente']);
$clientes = $sql0->fetchAll(PDO::FETCH_OBJ);
foreach ($clientes as $cliente) {
    $pdf->Cell(0, 3, 'Cliente: ' . $cliente->Nombres . ' ' . $cliente->Apellidos, 0, 1, 'L');
} //End Cliente------------------------------------------------------------------------

//Obtiene el medio de pago por el id conseguido en ventas------------------------------
/* $sql02 = $base_de_datos->query("SELECT * FROM Medio_Pago WHERE ID_Medio = ".$venta->ID_Medio);
    $medio = $sql02->fetchAll(PDO::FETCH_OBJ);
    foreach($medio as $pago){
        
    } */
/* switch ($abono['ID_Medio']) {
    case 1:
        # code...
        $pdf->Cell(0, 3, 'Metodo de pago: Efectivo', 0, 1, 'L');
        break;
    case 2:
        # code...
        $pdf->Cell(0, 3, 'Metodo de pago: SPEI/TARJETA', 0, 1, 'L');
        break;

    default:
        # code...
        break;
} */
//$pdf->Cell(0,3,'Metodo de pago: Credito',0,1,'L');
//END Venta Detalles--------------------------------------------------------------------------

// SUMATORIO DE LOS PRODUCTOS Y EL IVA

// $sqlant = "SELECT MAX(ID_Abono) as ida, Saldo_Pend FROM Abonos GROUP BY ID_Venta ORDER BY ID_Venta DESC";

$pdf->Cell(25, 10, 'Su Abono:', 0);
$pdf->Cell(20, 10, '', 0);
$pdf->Cell(0, 10, '$ ' . number_format($abono['Monto'], 2), 0, 0, 'R');
$pdf->Ln(3);
$pdf->Cell(25, 10, 'Total Abonado:', 0);
$pdf->Cell(20, 10, '', 0);
$sab = "SELECT SUM(Monto) AS tot FROM M_Abonos WHERE ID_Cliente = " . $abono['ID_Cliente'] . " AND ID_Mutualista = " . $abono['ID_Mutualista'];
$qsab = $conexion->query($sab);
$abonado = mysqli_fetch_array($qsab);
$pdf->Cell(0, 10, '$' . number_format($abonado['tot'], 2) . ' / $' . number_format($fel['Cantidad'], 2), 0, 0, 'R');
$pdf->Ln(3);
$pdf->Cell(25, 10, 'Mutualista por:', 0);
$pdf->Cell(20, 10, '', 0);
$pdf->Cell(0, 10, '$ ' . number_format($fel['Cantidad'], 2), 0, 0, 'R');
$pdf->Ln(6);
//$pdf->Cell(0, 10, 'IVA YA INCLUIDO', 0,0,'C');  

//END Venta-----------------------------------------------------------------------------

// PIE DE PAGINA
$pdf->Ln(1);
$pdf->Ln(4);
$pdf->Cell(0, 0, 'Verifique su comprobante ', 0, 1, 'C');
$pdf->Ln(4);
$pdf->Cell(0, 0, '***MUTUALISTA***', 0, 1, 'C');

$pdf->Output('abonoMT.pdf', 'i');
