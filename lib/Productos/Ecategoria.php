<?php
include_once "../conexion.php";

$id = $_POST["id"]; 
$nombre = $_POST["nombre"]; 
$descripcion = $_POST["descripcion"];


$sentencia = $base_de_datos->prepare("UPDATE Categorias SET Nombre = ?, Descripcion = ? WHERE ID_Categoria = ?;");
$resultado = $sentencia->execute([$nombre, $descripcion, $id]);



if($resultado === TRUE){
	header("Location: ./../../CatN.php?code=1");
	exit;
}
header("Location: ./../../CatN.php?code=2");
//else echo "Algo salió mal. Por favor verifica que la tabla exista, así como el ID del producto";
?>
