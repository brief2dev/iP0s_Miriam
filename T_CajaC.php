<?php

error_reporting(E_ALL);
ini_set('display_errors', '1');

$idventa = $_GET['id'];
$vend;
$appe; 

include_once "lib/cnx.php";
include_once "lib/conexion.php";
$sqlabo = "SELECT * FROM Caja WHERE ID_Caja = ".$idventa;
$queryabo = $conexion -> query($sqlabo);
$abono = mysqli_fetch_array($queryabo);
//Obtiene datos de la venta------------------------------------------------------------

    //obtiene datos del vendedor-------------------------------------------------------
    
        //obtiene datos de la sucursal-------------------------------------------------
        
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
            $pdf = new PDF('P','mm',array(70,110));
            //
            #Establecemos los márgenes del texto izquierda, arriba y derecha: 
            $pdf->SetMargins(5, 0 , 2); 
            #Establecemos el margen inferior: 
            $pdf->SetAutoPageBreak(true,1); 
            define('Pesos',chr(36));
            $pdf->AddPage();

            // CABECERA----------------------------------
            $pdf->SetFont('Helvetica','',9);
            
            $pdf->Cell(0,3,'CORTE DEL DIA',0,1,'C');//Correo
        //End Sucursal------------------------------------------------------------------

    //END Vendedor----------------------------------------------------------------------

    // DATOS FACTURA        

$efe = 0;
$spe = 0;
$sqlabs = "SELECT * FROM Caja WHERE ID_Caja_T = 1 AND Saldo_Inicial = 0 AND Cort = 1 AND idcorte = ".$idventa;
$queryabs = $conexion -> query($sqlabs);
while ($abos = mysqli_fetch_array($queryabs)) {
    if ($abos['Tip'] == 1) {
        $efe = $efe + $abos['Monto'];
    }else{
        if ($abos['Tip'] == 2) {
            $spe = $spe + $abos['Monto'];
        }
    }
}

    $total = $efe + $spe + $abono['Efectivo'] + $abono['Tarjeta'];
    $pdf->Ln(2);
    $pdf->Cell(0,3,'Fecha: '.date("d-m-Y", strtotime($abono['Fecha'])),0,2,'L');
    $sqlad = "SELECT * FROM Personal WHERE ID_Personal = ".$abono['ID_Personal'];
    $queryad = $conexion -> query($sqlad);
    $personal = mysqli_fetch_array($queryad);
    $pdf->Cell(0,3,'Realizo: '.$personal['Nombre'].' '.$personal['Apellido'],0,1,'L');
    $pdf->Ln(3);
    $pdf->Cell(0,0,' Ventas: '.$abono['T_Ventas'],0,1,'C');
    $pdf->Ln(2);
    $pdf->Cell(25, 10, 'Ventas Totales:', 0);    
    $pdf->Cell(20, 10, '', 0);
    $pdf->Cell(0, 10, '$ '.number_format($total, 2),0,0,'R');
    $pdf->Ln(3);
    $pdf->Cell(25, 10, 'Total en Caja:', 0);    
    $pdf->Cell(20, 10, '', 0);
    //$ganacia = $total - $abono['Gastos'];
    $pdf->Cell(0, 10, '$ '.number_format($abono['Saldo'], 2),0,0,'R');
    $pdf->Cell(20, 10, '', 0);
    $pdf->Ln(7); 
    
    //$pdf->Cell(0, 10, 'IVA YA INCLUIDO', 0,0,'C');  
    $pdf->Ln(4);
$pdf->Cell(0,3,'== VENTAS ==',0,1,'C');//Correo

$pdf->Cell(25, 10, 'EFECTIVO:', 0);    
    $pdf->Cell(20, 10, '', 0);
    $pdf->Cell(0, 10, '$ '.number_format($abono['Efectivo'], 2),0,0,'R');
    $pdf->Ln(3); 
    $pdf->Cell(25, 10, 'TARJETA', 0);    
    $pdf->Cell(20, 10, '', 0);
    $pdf->Cell(0, 10, '$ '.number_format($abono['Tarjeta'], 2) ,0,0,'R'); 
    $pdf->Cell(20, 10, '', 0);
    $pdf->Ln(3); 
    $pdf->Cell(0, 10, '------------------------------------------',0,0,'C'); 
    $pdf->Ln(3);
    $pdf->Cell(25, 10, 'Total', 0);    
    $pdf->Cell(20, 10, '', 0);
    $totalventa = $abono['Tarjeta'] + $abono['Efectivo'];
    $pdf->Cell(0, 10, '$ '.number_format($totalventa, 2) ,0,0,'R'); 
    $pdf->Cell(20, 10, '', 0); 
    $pdf->Ln(12);

$pdf->Cell(0,3,'== ENTRADAS ==',0,1,'C');//Correo
$pdf->Cell(25, 10, 'EFECTIVO:', 0);    
    $pdf->Cell(20, 10, '', 0);
    $pdf->Cell(0, 10, '+ $ '.number_format($efe,2),0,0,'R');
    $pdf->Ln(3); 
    $pdf->Cell(25, 10, 'TARJETAS:', 0);    
    $pdf->Cell(20, 10, '', 0);
    $pdf->Cell(0, 10, '+ $ '.number_format($spe,2),0,0,'R');
    $pdf->Ln(3); 
    $pdf->Cell(0, 10, '------------------------------------------',0,0,'C'); 
    $pdf->Ln(3); 
    $pdf->Cell(25, 10, 'Total', 0);    
    $pdf->Cell(20, 10, '', 0);
    $tin = $efe + $spe;
    $pdf->Cell(0, 10, '$ '.number_format($tin, 2) ,0,0,'R'); 

    $pdf->Ln(12);

$pdf->Cell(0,3,'== SALIDAS ==',0,1,'C');//Correo
$pdf->Cell(25, 10, 'GASTOS:', 0);    
    $pdf->Cell(20, 10, '', 0);
    $pdf->Cell(0, 10, '- $ '.number_format($abono['Gastos'], 2),0,0,'R');
    $pdf->Ln(15); 
$pdf->Cell(0,0,'_________________',0,1,'C');
$pdf->Ln(4); 
$pdf->Cell(0,0,'AUTORIZO ',0,1,'C');
//$pdf->Ln(3);
//$pdf->Cell(0,0,'El Cambio es por defecto de fabrica.',0,1,'C');
//$pdf->Ln(3);

 
$pdf->Output('ticket.pdf','i');
?>
