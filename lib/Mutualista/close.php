<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');

session_start();
include_once "../conexion.php";
include_once "../cnx.php";


$idd = $_GET['id'];

$sentencia = $base_de_datos->prepare("UPDATE M_Mutualista SET Finalizado = ? WHERE ID_Mutualista = ?;");
$resultado = $sentencia->execute([1, $idd]);

if($resultado === TRUE){
	header("Location: ./../../MT.php?code=1");
	exit;
}




?>