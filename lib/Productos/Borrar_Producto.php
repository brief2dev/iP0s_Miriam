<?php
if(!isset($_GET["id"])) exit();
$id = $_GET["id"];
include_once "../conexion.php";
$sentencia = $base_de_datos->prepare("DELETE FROM Productos WHERE ID_Producto = ?;");
$resultado = $sentencia->execute([$id]);




if($resultado ){
	header("Location: ./../../PRt.php?code=3");
	//exit;
}
else {
	//echo "Algo salió mal";
}
?>