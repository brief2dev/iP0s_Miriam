<?php
include_once "../conexion.php";
include_once "../cnx.php";

if ($_FILES['fotop']['name'] != null) {
	$rot = "lib/Productos/";
	$uploadDir = "img/"; 
	$fileName1 = basename($_FILES['fotop']['name']); 
	$uploadFilePath1 = $uploadDir.$fileName1;
	$rutacompleta1 = $rot.$uploadFilePath1;
	move_uploaded_file($_FILES['fotop']['tmp_name'], $uploadFilePath1);
}else{
	$rutacompleta1 = "lib/Productos/img/blitz_SN.png";
//echo "No hay datos";
}



$codigo = $_POST["codigop"];
$nombre = $_POST["nombrep"];
$sucu = $_POST["sucursal"];
$cat = $_POST["categoria"];
$descr = $_POST["descrip"];
$marca = $_POST["marcap"];
$preciov = $_POST["preciovp"];
$precioc = $_POST["presiocp"];
$stock = $_POST["stockp"];
$provedor = $_POST["provedor"];
$fecha= date("Y-m-d H:i:s");

//verifica si ya existe
$sqlex = "SELECT * FROM Productos WHERE Codigo = '".$codigo."'";
$queryex = $conexion -> query($sqlex);
$existe = mysqli_num_rows($queryex);
if($existe == 1){
header("Location: ./../../PAdd.php?code=4");
	exit;
}

//echo $codigo.$nombre.$descr.$marca.$stock.$precioc.$preciov,$foto;
try{
	$sentencia = $base_de_datos->prepare("INSERT INTO Productos (Codigo, Nombre, Descripcion, Marca, Foto, PrecioVenta, PrecioCompra, Existencia, ID_Sucursal, ID_Categoria, ID_Proveedor, Fecha_Ingreso) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");
	$resultado = $sentencia->execute([$codigo, $nombre, $descr, $marca, $rutacompleta1, $preciov, $precioc, $stock, $sucu, $cat, $provedor, $fecha]);
}catch(Exception $exeption){
	echo $exeption;
}


if($resultado === TRUE){
	header("Location: ./../../PAdd.php?code=1");
	exit;
}
else echo "Algo salió mal. Por favor verifica que la tabla exista";


?>