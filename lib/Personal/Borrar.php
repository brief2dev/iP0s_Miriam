<?php
if(!isset($_GET["id"])) exit();
$id = $_GET["id"];
include_once "../conexion.php";
$sentencia = $base_de_datos->prepare("DELETE FROM Personal WHERE ID_Personal = ?;");
$resultado = $sentencia->execute([$id]);




if($resultado ){
	$response['status']  = 'success';
	$response['message'] = 'Product Deleted Successfully ...';
	header("Location: ./../../Personal_List.php?code=3");
	//exit;
}
else {
	$response['status']  = 'error';
	$response['message'] = 'Unable to delete product ...';
	//echo "Algo salió mal";
}
?>