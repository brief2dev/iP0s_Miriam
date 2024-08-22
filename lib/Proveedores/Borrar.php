<?php
if(!isset($_GET["id"])) exit();
$id = $_GET["id"];
include_once "../conexion.php";
$sentencia = $base_de_datos->prepare("DELETE FROM Proveedores WHERE ID_Proveedor = ?;");
$resultado = $sentencia->execute([$id]);

if($resultado ){
	header("Location: ./../../Proveedor_List.php?code=2");
	//exit;
}
?>