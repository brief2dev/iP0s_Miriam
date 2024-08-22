<?php
if(!isset($_GET["id"])) exit();
$id = $_GET["id"];
$baja = $_GET["bp"];
include_once "../conexion.php";

$sentencia = $base_de_datos->prepare("UPDATE Personal SET Baja = ? WHERE ID_Personal = ?;");
$resultado = $sentencia->execute([$baja , $id]);

			if($resultado === TRUE){
				header("Location: ./../../Personal_List.php?code=1");
				exit;
			}
?>