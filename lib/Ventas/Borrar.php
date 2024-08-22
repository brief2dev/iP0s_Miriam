<?php

$id = $_GET['idb'];
//echo $id;

include_once "../conexion.php";
include_once "../cnx.php";


$sqlvd = "SELECT * FROM Venta_Detalle WHERE ID_Venta = ".$id ;
$quevd = $conexion -> query($sqlvd );
	while($vd = mysqli_fetch_array($quevd)){
		$sen = $base_de_datos->prepare("UPDATE Productos SET Existencia = Existencia + ? WHERE ID_Producto = ?;");
		$re = $sen->execute([$vd['Cantidad'], $vd['ID_Producto']]);
	}


$sentencia = $base_de_datos->prepare("DELETE FROM Ventas WHERE ID_Venta = ?;");
$resultado = $sentencia->execute([$id]);
if($resultado === TRUE){

	
	header("Location: ./../../Vint.php?code=1");
	exit;
}

?>