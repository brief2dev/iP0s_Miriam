<?php

header("Access-Control-Allow-Origin: *");
include_once "../conexion.php";

$permitted_chars = '0123456789';
$pass = substr(str_shuffle($permitted_chars), 0, 4);
$usu = substr(str_shuffle($permitted_chars), 0, 2);
$us = "MDM-";
$usuario = $us.$usu;


$nombres = $_POST["nomclie"];
$apellido = $_POST["apellidoclie"];
$correo = $_POST["correoclie"];
$telefono = $_POST["telclie"];
$direccion = $_POST["dirclie"];

$check = $_POST["checkp"];
$mcredito = $_POST["montocredito"];
$fecha = date("Y-m-d");

//echo $nombre.$apellido.$correo.$pass.$telefono.$sucursal.$puesto.$fecha;
if ($check == '1') { //USUARIO PREMIUM
		try{
		$sentencia = $base_de_datos->prepare("INSERT INTO Clientes (Nombres, Apellidos, Correo, Telefono, Direccion, Fecha_Registro, Credito, Premium) VALUES (?, ?, ?, ?, ?, ?, ?, ?);");
		$resultado = $sentencia->execute([$nombres, $apellido, $correo, $telefono, $direccion, $fecha, $mcredito, $check]);
		if($resultado === TRUE){
			$mjs ='Gracias por Registrarte en Modas Miriam.';
			
			$message = $mjs;
			$phone = '+52'.$telefono;
			//require $_SERVER['DOCUMENT_ROOT']."/APIs/aws-SNS.php";
			header("Location: ./../../Cliente_N.php?code=1");
			exit;
		}
	}
	catch(Exception $exeption){
		echo $exeption;
	}
}else{ //USUARIO NORMAL
	try{
		$sentencia = $base_de_datos->prepare("INSERT INTO Clientes (Nombres, Apellidos, Correo, Telefono, Direccion, Fecha_Registro, Credito, Premium) VALUES (?, ?, ?, ?, ?, ?, ?, ?);");
		$resultado = $sentencia->execute([$nombres, $apellido, $correo, $telefono, $direccion, $fecha, 0, 0]);
		if($resultado === TRUE){
			$mjs ='Gracias por Registrarte en Modas Miriam.';
		
			$message = $mjs;
			$phone = '+52'.$telefono;
			//require $_SERVER['DOCUMENT_ROOT']."/APIs/aws-SNS.php";
			header("Location: ./../../Cliente_N.php?code=1");
			exit;
		}
	}
	catch(Exception $exeption){
		echo $exeption;
	}
}
?>