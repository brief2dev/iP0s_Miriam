<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
if(!isset($_GET["id"])) exit();
$id = $_GET["id"];
include_once "../conexion.php";


$sentencia = $base_de_datos->prepare("UPDATE Clientes SET visible = ? WHERE ID_Cliente = ?;");
$resultado = $sentencia->execute([0, $id]);


//$sentencia = $base_de_datos->prepare("DELETE FROM Clientes WHERE ID_Cliente = ?;");
//$resultado = $sentencia->execute([$id]);




if($resultado ){
	header("Location: ./../../Cliente_List.php?code=1&id=".$id);
	exit;

}
else {
	header("Location: ./../../Cliente_List.php?code=2&id=".$id);
	exit;
}
?>