<?php
include_once "../conexion.php";
$id = $_POST["ide"];
$ifit = $_POST['idfotologo'];
if ($_FILES['nlogo']['name'] != null) {
	$rot = "lib/Proveedores/";
	$uploadDir = "img/"; 
	$fileName1 = basename($_FILES['nlogo']['name']); 
	$uploadFilePath1 = $uploadDir.$fileName1;
	$rutacompleta1 = $rot.$uploadFilePath1;
	move_uploaded_file($_FILES['nlogo']['tmp_name'], $uploadFilePath1);
}else{
	$rutacompleta1 = $ifit;
//echo "No hay datos";
}

$telefono = $_POST["ntel"];
$correo = $_POST["ncorreo"];
$bio = $_POST["nbio"];
$direcc = $_POST["ndireccion"];
$ciudad = $_POST["nciudad"];
$cp = $_POST["ncp"];

$bene = $_POST["beneficiario"];
$clabe = $_POST["clabe"];
$banco = $_POST["banco"];
//$foto = base64_encode(file_get_contents($_FILES['nlogo']['tmp_name']));



try{
	$sentencia = $base_de_datos->prepare("UPDATE Proveedores SET NBio = ?, NDireccion = ?, NCiudad = ?, NCP = ?, NCorreo = ?, NTel = ?, NLogo = ?, Beneficiario = ?, Clabe = ?, Banco = ? WHERE ID_Proveedor = ?;");
		$resultado = $sentencia->execute([$bio, $direcc, $ciudad, $cp, $correo, $telefono, $rutacompleta1, $bene, $clabe, $banco, $id]);
		if($resultado === TRUE){
			header("Location: ./../../Proveedor.php?id=".$id);
			exit;
		}
	

}catch(Exception $exeption){
	echo $exeption;
} 

