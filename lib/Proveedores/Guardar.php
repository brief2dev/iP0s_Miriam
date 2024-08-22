<?php
include_once "../conexion.php";

//// Checa si hay foto y lo guarda de lo contrario pone img prediseñada
if ($_FILES['fotoprove']['name'] != null) {
	$rot = "lib/Proveedores/";
	$uploadDir = "img/"; 
	$fileName1 = basename($_FILES['fotoprove']['name']); 
	$uploadFilePath1 = $uploadDir.$fileName1;
	$rutacompleta1 = $rot.$uploadFilePath1;
	move_uploaded_file($_FILES['fotoprove']['tmp_name'], $uploadFilePath1);
}else{
	$rutacompleta1 = "lib/Productos/img/blitz_SN.png";
//echo "No hay datos";
}
//// Checa si hay foto y lo guarda de lo contrario pone img prediseñada
if ($_FILES['logoempre']['name'] != null) {
	$rot = "lib/Proveedores/";
	$uploadDir = "img/"; 
	$fileName2 = basename($_FILES['logoempre']['name']); 
	$uploadFilePath2 = $uploadDir.$fileName2;
	$rutacompleta2 = $rot.$uploadFilePath2;
	move_uploaded_file($_FILES['logoempre']['tmp_name'], $uploadFilePath2);
}else{
	$rutacompleta2 = "lib/Productos/img/blitz_SN.png";
//echo "No hay datos";
}

//$fotoprove = base64_encode(file_get_contents($_FILES['fotoprove']['tmp_name'])); FOTO EN BASE 64	

$nomprove = $_POST["nomprove"];
$telprove = $_POST["telefonoprove"];
$correoprove = $_POST["correoprove"];
$nomempre = $_POST["nomempre"];
$dirempre = $_POST["dirempre"];
$correoempre = $_POST["correoempre"];
$bene = $_POST["beneficiario"];
$clabe = $_POST["clabe"];
$banco = $_POST["banco"];
$telempre = $_POST["telempre"];
$ciudadempre = $_POST["ciudadempre"];
$cpempre = $_POST["cpempre"];

$fecha= date("Y-m-d");


//echo $nombre.$apellido.$correo.$pass.$telefono.$sucursal.$puesto.$fecha;
try{
	$sentencia = $base_de_datos->prepare("INSERT INTO Proveedores (Nombre, Correo, Telefono, Foto, NEmpresa, NCorreo, NDireccion, NTel, NCiudad, NCP, NLogo, Fecha_Registro, Beneficiario, Clabe, Banco) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");
	$resultado = $sentencia->execute([$nomprove, $correoprove, $telprove, $rutacompleta1, $nomempre, $correoempre, $dirempre, $telempre, $ciudadempre, $cpempre, $rutacompleta2, $fecha, $bene, $clabe, $banco]);
}
catch(Exception $exeption){
	echo $exeption;
}

if($resultado === TRUE){
	header("Location: ./../../Proveedor_N.php?code=1");
	exit;
}
else echo "Algo salió mal. Por favor verifica que la tabla  exista";


?>