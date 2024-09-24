<?php
//if(!isset($_POST["total"])) exit;
error_reporting(E_ALL);
ini_set('display_errors', '1');
session_start(); 

//$total = $_POST["total"];
include_once "../conexion.php";
$personal = $_SESSION['ids'];
$inica = $_POST['inicia'];
if(empty($inica)){
	$si = 0;
}else{
	$si = 1;
	$tp = 1;
}
$motivo = 1;
$descr = $_POST['descr'];
$fecha= date("Y-m-d H:i:s");
$monto = $_POST['monto'];
//$compro =  'ewe';
$tp = 1;

$saldo = 0.0;

$sentencia = $base_de_datos->prepare("INSERT INTO Caja(ID_Personal, ID_Caja_T, Descripcion, Fecha, Monto, Saldo, Saldo_Inicial, Tip) VALUES (?, ?, ?, ?, ?, ?, ?, ?);");
$resultado = $sentencia->execute([$personal, $motivo, $descr, $fecha, $monto, $saldo, $si, $tp]); 

if($resultado ){
	header("Location: ./../../Mov_Ingreso.php?code=1");
	//exit;
}
else {
	//echo "Algo salió mal";
}

//header("Location: ./../../vender.php?status=1"); 

?>