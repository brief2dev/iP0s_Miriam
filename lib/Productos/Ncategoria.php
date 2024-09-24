<?php
session_start(); 
include_once "../conexion.php";

$dnombre = $_POST['ncat'];
$descri = $_POST['descr'];

$sentencia = $base_de_datos->prepare("INSERT INTO Categorias(Nombre, Descripcion) VALUES (?, ?);");
$resultado = $sentencia->execute([$dnombre, $descri]); 

if($resultado ){
	header("Location: ./../../CatN.php?code=1");
	//exit;
}
else {
	//echo "Algo salió mal";
}

//header("Location: ./../../vender.php?status=1"); 

?>