<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');
include_once "../conexion.php";
include_once "../cnx.php";
if(!isset($_GET["idv"])) exit();
$idv = $_GET["idv"];
$idp = $_GET["idp"];
$cantorg = $_GET['cantorg']; 		//catidad original del producto

$sqlpro = "SELECT * FROM Productos WHERE ID_Producto = ".$idp;
$querypro = $conexion -> query($sqlpro);
$precio = mysqli_fetch_array($querypro);
$preciopr = $precio['PrecioVenta'];

$sqlven = "SELECT * FROM Ventas WHERE ID_Venta = ".$idv;
$queryven = $conexion -> query($sqlven);
$vent = mysqli_fetch_array($queryven);
$clien = $vent['ID_Cliente'];
//echo $preciopr;

if ($cantorg == 1) {
	$sentencia = $base_de_datos->prepare("DELETE FROM Venta_Detalle WHERE ID_Producto = ? AND ID_Venta = ?;");
	$resultado = $sentencia->execute([$idp, $idv]);
	if($resultado === TRUE){
		$sentenciaExistencia = $base_de_datos->prepare("UPDATE Productos SET Existencia = Existencia + ? WHERE ID_Producto = ?;");
		$rs = $sentenciaExistencia->execute([1, $idp]);
		if ($rs === TRUE) {
			$sqlade = $base_de_datos->prepare("UPDATE Abonos SET Saldo_Pend = Saldo_Pend - ? WHERE ID_Venta = ?;");
			$rsade = $sqlade->execute([$preciopr, $idv]);
			if ($rsade === TRUE) {
				$sqlcre = $base_de_datos->prepare("UPDATE Clientes SET Credito = Credito + ? WHERE ID_Cliente = ?;");
				$rscr = $sqlcre->execute([$preciopr, $clien]);
				if ($rscr === TRUE) {
					header("Location: ./../../VCredito.php?status=1"); 
					exit;
				}
			}
		}
	}
}
else{
	$sentencia = $base_de_datos->prepare("UPDATE Productos SET Existencia = Existencia + ? WHERE ID_Producto = ?;");
	$rs = $sentencia->execute([1, $idp]);
	if ($rs === TRUE) {
		$sqlvd = $base_de_datos->prepare("UPDATE Venta_Detalle SET Cantidad = Cantidad - ? WHERE ID_Venta = ? AND ID_Producto = ?;");
		$rs1 = $sqlvd->execute([1, $idv, $idp]);
		if ($rs1 === TRUE) {
			$sqlade = $base_de_datos->prepare("UPDATE Abonos SET Saldo_Pend = Saldo_Pend - ? WHERE ID_Venta = ?;");
			$rsade = $sqlade->execute([$preciopr, $idv]);
			if ($rsade === TRUE) {
				$sqlcre = $base_de_datos->prepare("UPDATE Clientes SET Credito = Credito + ? WHERE ID_Cliente = ?;");
				$rscr = $sqlcre->execute([$preciopr, $clien]);
				if ($rscr === TRUE) {
					header("Location: ./../../VCredito.php?status=1"); 
					exit;
				}
			}
		}
	}
}
?>