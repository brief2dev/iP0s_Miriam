<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');
include_once "../conexion.php";
include_once "../cnx.php";
if(!isset($_GET["idv"])) exit();
$idv = $_GET["idv"];
//Posible bug que se aumente el credito ya que suma el saldo pendiente lo cual contendra igual el interes 
$sqlven = "SELECT * FROM Venta_Detalle WHERE ID_Venta = ".$idv;
$queryven = $conexion -> query($sqlven);
while ($ventaDetalle = mysqli_fetch_array($queryven)) {
    $sentenciaExistencia = $base_de_datos->prepare("UPDATE Productos SET Existencia = Existencia + ? WHERE ID_Producto = ?;");
	$rs = $sentenciaExistencia->execute([$ventaDetalle['Cantidad'], $ventaDetalle['ID_Producto']]);
}

$sentencia = $base_de_datos->prepare("DELETE FROM Venta_Detalle WHERE ID_Venta = ?;");
$resultado = $sentencia->execute([$idv]);
if($resultado === TRUE){
    $sabo = "SELECT ID_Abono, Saldo_Ant, Saldo_Pend, ID_Cliente FROM Abonos WHERE ID_Venta = ".$idv;
    $qabo = $conexion -> query($sabo);
    $abo = mysqli_fetch_array($qabo);

    $sqlcre = $base_de_datos->prepare("UPDATE Clientes SET Credito = Credito + ? WHERE ID_Cliente = ?;");
	$rscr = $sqlcre->execute([$abo['Saldo_Pend'], $abo['ID_Cliente']]);
	if ($rscr === TRUE) {
        $sqlade = $base_de_datos->prepare("UPDATE Abonos SET Saldo_Ant = ?, Abono = ?, Saldo_Pend = ?, Estatus = ? WHERE ID_Abono = ?;");
		$rsade = $sqlade->execute([0, 0, 0, 1, $abo['ID_Abono']]);
		if ($rsade === TRUE) {
            $sendeleteventa = $base_de_datos->prepare("DELETE FROM Ventas WHERE ID_Venta = ?");
            $releteventa = $sendeleteventa->execute([$idv]);
            if ($releteventa === TRUE) {
                header("Location: ./../../VCredito.php?status=1"); 
				exit;
            }
        }
	}
}
?>