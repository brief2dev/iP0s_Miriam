<?php
include_once "../conexion.php";
$id = $_POST["id"];

if ($_FILES['perfoto']['name'] != null) {
	$rot = "lib/Empresa/";
	$uploadDir = "img/"; 
	$fileName1 = basename($_FILES['perfoto']['name']); 
	$uploadFilePath1 = $uploadDir.$fileName1;
	$rutacompleta1 = $rot.$uploadFilePath1;
	move_uploaded_file($_FILES['perfoto']['tmp_name'], $uploadFilePath1);
}else{
	$rutacompleta1 = "lib/Empresa/img/blitz_SN.jpg";
//echo "No hay datos";
}

$nombre = $_POST["pernom"];
$whats = $_POST["perwhats"];
$propie = $_POST["propie"];
$muni = $_POST["muni"];

$telefono = $_POST["pertelefono"];
$correo = $_POST["percorreo"];
$direcc = $_POST["perdirecc"];
$colonia = $_POST["percol"];
$cp = $_POST["percp"];
$pass = $_POST["perpass"];

$clab = $_POST["clabe"];
$banc = $_POST["banco"];
$ben = $_POST["ben"];

//$foto = base64_encode(file_get_contents($_FILES['perfoto']['tmp_name']));



try{
	$sentencia = $base_de_datos->prepare("UPDATE Sucursales SET Nombre = ?, Whats = ?, Gerente = ?, Municipio = ?, Direccion = ?, Colonia = ?, Cp = ?, Correo = ?, Telefono = ?, Logo = ?, Clabe = ?, Banco = ?, Beneficiario = ? WHERE ID_Sucursal = ?;");
	$resultado = $sentencia->execute([$nombre, $whats, $propie, $muni, $direcc, $colonia, $cp, $correo, $telefono, $rutacompleta1, $clab, $banc, $ben, $id]);

		if($resultado === TRUE){
			header("Location: ./../../Empresa.php?code=1&id=".$id);
			exit;
		}
		else echo "Algo salió mal. Por favor verifica que la tabla exista, así como el ID del producto";
}catch(Exception $exeption){
	echo $exeption;
} 

