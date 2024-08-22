<?php

include_once "../conexion.php";

if ($_FILES['fotous']['name'] != null) {
	$rot = "lib/Personal/";
	$uploadDir = "img/"; 
	$fileName1 = basename($_FILES['fotous']['name']); 
	$uploadFilePath1 = $uploadDir.$fileName1;
	$rutacompleta1 = $rot.$uploadFilePath1;
	move_uploaded_file($_FILES['fotous']['tmp_name'], $uploadFilePath1);
}else{
	$rutacompleta1 = "lib/Personal/img/blitz_SN.png";
//echo "No hay datos";
}
$permitted_chars = '0123456789';
$pass = substr(str_shuffle($permitted_chars), 0, 4);

$nombre = $_POST["nombreus"];
$apellido = $_POST["apellidous"];
$mailuser = $_POST["correous"];
//$pass = $_POST["passus"];
$telefono = $_POST["telefonous"];
$sucu = $_POST["sucus"];
$puest = $_POST["puesus"];
$fecha= date("Y-m-d");
$die = $_POST["dir"];
$baja = 0;
$visible = 1;
//echo $nombre.$apellido.$correo.$pass.$telefono.$sucursal.$puesto.$fecha;
try{
	$sentencia = $base_de_datos->prepare("INSERT INTO Personal (Nombre, Apellido, Correo, Pass, Telefono, ID_Sucursal, ID_Puesto, Fecha_Registro, Foto, Direccion, Baja, visible) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");
	$resultado = $sentencia->execute([$nombre, $apellido, $mailuser, $pass, $telefono, $sucu, $puest, $fecha, $rutacompleta1, $die, $baja, $visible]);
}
catch(Exception $exeption){
	echo $exeption;
}

if($resultado === TRUE){
	$nombre = "Moda Miriam"; //Nombre
    $correo = "no-reply@modamiriam.com"; //Remitente
    $asunto = "Usuario y Contraseña del Sistema"; 
    $mjs = "Tu usuario y contraseña para acceder al sitema Usuario:( ".$usuario."  ), contraseña:( ".$pass.")"; //MS

    //$to = "yahaira132@hotmail.com";
	$to = $mailuser;
    $headers = "From:" . $correo;
    mail($to,$asunto,$mjs, $headers);

-	$message = $mjs;
	$phone = '+52'.$telefono;
	//require $_SERVER['DOCUMENT_ROOT']."/APIs/aws-SNS.php";
	header("Location: ./../../Personal_New.php?code=1");
	exit;
}
else echo "Algo salió mal. Por favor verifica que la tabla  exista";


?>