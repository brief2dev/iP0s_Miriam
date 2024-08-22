<?php
session_start();
include_once "../conexion.php";

$personal = $_SESSION['ids'];
$motivo = 2;
$descr = $_POST['descr'];
$fecha= date("Y-m-d H:i:s");
$monto = $_POST['monto'];
//$compro =  'ewe';

$saldo = 0.0;
$tip = 0;

//echo $personal.$motivo.$descr.$fecha.$monto.$compro. $saldo; 
//echo $caja.$cantidad.$descuento.$subtotal.$iva;

$sentencia = $base_de_datos->prepare("INSERT INTO Caja(ID_Personal, ID_Caja_T, Descripcion, Fecha, Monto, Saldo, Tip) VALUES (?, ?, ?, ?, ?, ?, ?);");
$resultado = $sentencia->execute([$personal, $motivo, $descr, $fecha, $monto, $saldo, $tip]); 

if($resultado ){
	
	header("Location: ./../../Mov_Retiro.php?code=1");
	//exit;
}
else {
	//echo "Algo salió mal";
}
//header("Location: ./../../vender.php?status=1"); 

?>