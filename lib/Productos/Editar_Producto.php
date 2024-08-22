<?php
include_once "../conexion.php";

$foto = $_FILES["profotos"];
if ($_FILES['profotos']['name'] != null) {
	$rot = "lib/Productos/";
	$uploadDir = "img/"; 
	$fileName1 = basename($_FILES['profotos']['name']); 
	$uploadFilePath1 = $uploadDir.$fileName1;
	$rutacompleta1 = $rot.$uploadFilePath1;
	move_uploaded_file($_FILES['profotos']['tmp_name'], $uploadFilePath1);
}else{
	$fotoactual = $_POST['rutafoto'];
	$rutacompleta1 = $fotoactual;
//echo "No hay datos";
}

$id = $_POST["id"]; 
$vend = $_POST["ven"]; 
$codigo = $_POST["codigo"]; 
$descripcion = $_POST["descripcion"];
$precioCompra = $_POST["precioCompra"];
$precioVenta = $_POST["precioVenta"];
$existencia = $_POST["existencia"]; 
$nombre = $_POST["nombrep"];
$suc = $_POST["sucursal"]; 
$cat = $_POST["categoria"];
$fecha = date("Y-m-d H:i:s");
//echo $id.$codigo.$descripcion.$precioCompra.$precioVenta.$existencia;


$sentencia = $base_de_datos->prepare("UPDATE Productos SET Nombre = ?, Descripcion = ?, Foto = ?, PrecioVenta = ?, PrecioCompra = ?, ID_Sucursal = ?, ID_Categoria = ?, Existencia = ?, Fecha_Ingreso = ? WHERE ID_Producto = ?;");
$resultado = $sentencia->execute([$nombre, $descripcion, $rutacompleta1, $precioVenta, $precioCompra, $suc, $cat, $existencia, $fecha, $id]);



if($resultado === TRUE){
	if($vend == 1){
		header("Location: ./../../PR.php?code=1");
			exit;
	}else{
		header("Location: ./../../PRt.php?code=1");
	exit;
	}
}
//header("Location: ./../../Producto_Resurtir.php?code=2");
else echo "Algo salió mal. Por favor verifica que la tabla exista, así como el ID del producto";
?>
