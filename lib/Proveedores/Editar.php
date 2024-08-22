<?php
include_once "../conexion.php";
$id = $_POST["id"];
$idfotoruta = $_POST['idfoto'];
if ($_FILES['perfoto']['name'] != null) {
	$rot = "lib/Proveedores/";
	$uploadDir = "img/"; 
	$fileName1 = basename($_FILES['perfoto']['name']); 
	$uploadFilePath1 = $uploadDir.$fileName1;
	$rutacompleta1 = $rot.$uploadFilePath1;
	move_uploaded_file($_FILES['perfoto']['tmp_name'], $uploadFilePath1);
}else{
	$rutacompleta1 = $idfotoruta;
//echo "No hay datos";
}

$telefono = $_POST["pertelefono"];
$correo = $_POST["percorreo"];
$bio = $_POST["perbio"];
//$foto = base64_encode(file_get_contents($_FILES['perfoto']['tmp_name']));
try{
	$sentencia = $base_de_datos->prepare("UPDATE Proveedores SET Bio = ?, Correo = ?, Telefono = ?, Foto = ? WHERE ID_Proveedor = ?;");
	$resultado = $sentencia->execute([$bio, $correo, $telefono, $rutacompleta1, $id]);

	if($resultado === TRUE){
		header("Location: ./../../Proveedor.php?code=1&id=".$id);
		exit;
	}
	else echo "Algo salió mal. Por favor verifica que la tabla exista, así como el ID del producto";
}catch(Exception $exeption){
	echo $exeption;
}

