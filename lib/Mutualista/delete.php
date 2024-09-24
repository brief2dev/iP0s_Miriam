<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');

session_start();
include_once "../conexion.php";
include_once "../cnx.php";


$idd = $_GET['id'];

$sentencia = $base_de_datos->prepare("DELETE FROM M_Mutualista WHERE ID_Mutualista = ?;");
$resultado = $sentencia->execute([$idd]);

if ($resultado === TRUE) {
    header("Location: ./../../MTH.php?code=1");
    exit;
}
