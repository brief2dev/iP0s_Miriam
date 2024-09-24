<?php
include_once "../conexion.php";
$id = $_POST["id"];
$rutafoto = $_POST['idfoto'];
if ($_FILES['perfoto']['name'] != null) {
	$rot = "lib/Personal/";
	$uploadDir = "img/"; 
	$fileName1 = basename($_FILES['perfoto']['name']); 
	$uploadFilePath1 = $uploadDir.$fileName1;
	$rutacompleta1 = $rot.$uploadFilePath1;
	move_uploaded_file($_FILES['perfoto']['tmp_name'], $uploadFilePath1);
}else{
	$rutacompleta1 = $rutafoto;
//echo "No hay datos";
}

$telefono = $_POST["pertelefono"];
$correo = $_POST["percorreo"];
$direcc = $_POST["perdirecc"];
$colonia = $_POST["percol"];
//$foto = base64_encode(file_get_contents($_FILES['perfoto']['tmp_name']));



try{
	
	$sentencia = $base_de_datos->prepare("UPDATE Personal SET Direccion = ?, Colonia = ?, Telefono = ?, Correo = ?, Foto = ? WHERE ID_Personal = ?;");
	$resultado = $sentencia->execute([$direcc, $colonia, $telefono, $correo, $rutacompleta1, $id]);

			if($resultado === TRUE){
				header("Location: ./../../Perfil.php?code=1&id=".$id);
				exit;
			}

}catch(Exception $exeption){
	echo $exeption;
} 


