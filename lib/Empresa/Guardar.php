<?php
include_once "../conexion.php";

if ($_FILES['logo']['name'] != null) {
	$rot = "lib/Empresa/";
	$uploadDir = "img/"; 
	$fileName1 = basename($_FILES['logo']['name']); 
	$uploadFilePath1 = $uploadDir.$fileName1;
	$rutacompleta1 = $rot.$uploadFilePath1;
	move_uploaded_file($_FILES['logo']['tmp_name'], $uploadFilePath1);
}else{
	$rutacompleta1 = "lib/Empresa/img/blitz_SN.jpg";
//echo "No hay datos";
}

$nombre = $_POST["nombre"];
//$rfc = $_POST["rfc"];
$rfc = strtoupper($_POST["rfc"]);
$rfc = $_POST["rfc"];
$muni = $_POST["muni"];
$dire = $_POST["direccion"];
$correo = $_POST["correo"];
$col = $_POST["colonia"];
$cp = $_POST["cp"];
$tel = $_POST["telefono"];
$gerent = $_POST["gerente"];
$clabe = $_POST["clabe"];
$bonco = $_POST["banco"];
$bene = $_POST["bene"];

//$foto = base64_encode(file_get_contents($_FILES['fotous']['tmp_name']));
//echo $nombre.$apellido.$correo.$pass.$telefono.$sucursal.$puesto.$fecha;
try{
	$sentencia = $base_de_datos->prepare("INSERT INTO Sucursales (Nombre, RFC, Municipio, Direccion, Correo, Colonia, Cp, Telefono, Logo, Gerente, Clabe, Banco, Beneficiario, visible) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");
	$resultado = $sentencia->execute([$nombre, $rfc, $muni, $dire, $correo, $col, $cp, $tel, $rutacompleta1, $gerent, $clabe, $bonco, $bene, 1]);
	if($resultado === TRUE){
		header("Location: ./../../EN.php?code=1");
	exit;
}
}
catch(Exception $exeption){
	echo $exeption;
}


?>