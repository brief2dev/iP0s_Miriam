<?php
include_once "../conexion.php";

$id = $_POST["idp"]; 
$cant = $_POST["cantidad"]; 
$fecha = date("Y-m-d H:i:s");
$vis = 0;


$sentencia = $base_de_datos->prepare("UPDATE Productos SET Existencia =  Existencia + ?, Fecha_Ingreso = ?, visto = ?, can = ? WHERE ID_Producto= ?;");
$resultado = $sentencia->execute([$cant, $fecha, $vis, $cant, $id]);



if($resultado === TRUE){
	header("Location: ./../../PR.php?code=1");
	exit;
}
header("Location: ./../../PR.php?code=2");
//else echo "Algo salió mal. Por favor verifica que la tabla exista, así como el ID del producto";
?>
