<?php
include_once "../conexion.php";
$id = $_POST["id"];

$nombre = $_POST["pernom"];
$ape = $_POST["perape"];
$telefono = $_POST["pertelefono"];
$correo = $_POST["percorreo"];
$direcc = $_POST["perdirecc"];
$cp = $_POST["percre"];
$checkp = $_POST["checkp"]; 
if (empty($checkp)) {
	$checkp = 0;
}

//$foto = base64_encode(file_get_contents($_FILES['perfoto']['tmp_name']));


 try{
	$sentencia = $base_de_datos->prepare("UPDATE Clientes SET Nombres = ?, Apellidos = ?, Direccion = ?, Credito = ?, Correo = ?, Telefono = ?, Premium = ? WHERE ID_Cliente = ?;");
	$resultado = $sentencia->execute([$nombre, $ape, $direcc, $cp, $correo, $telefono, $checkp, $id]);

	if($resultado === TRUE){
		header("Location: ./../../Cliente.php?code=1&id=".$id);
		exit;
	}else echo "Algo salió mal. Por favor verifica que la tabla exista, así como el ID del producto";
}catch(Exception $exeption){
	echo $exeption;
} 


