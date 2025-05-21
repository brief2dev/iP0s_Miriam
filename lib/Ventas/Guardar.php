<?php
session_start();
$subtotal = $_POST['Subtotal'];
include_once "../conexion.php";
include_once "../cnx.php";
if(!isset($_POST["Subtotal"])) exit;

if ($subtotal == 0){
	header("Location: ./../../vender.php?status=6"); 	
}else{
	if(isset($_POST["descueporcentaje"]) == 0 || isset($_POST["descueporcentaje"]) == 0.0){
		$descuento_pesos = 0.0;
		$descuento_porce = 0.0;
		$total = $_POST["Subtotal"];	
	}
	else{
		$descuento_pesos = $_POST["descuentoss"];
		$descuento_porce = $_POST["descueporcentaje"];
		$total = $_POST["totall"];
	}

	$vendedor = $_POST['vendedor'];
	$comprador = $_POST['cliente'];
	$caja = $_SESSION['ids'];
	$tipo = $_POST['mediopago'];
	$cantidad =  $_POST['articulos'];
	$fecha = date("Y-m-d");
	$hora = date("H:i:s");
	$fechaabono = date("Y-m-d H:i:s");
	//Subtotal ya uzado arriba


	$efectivo = $_POST['efectivo'];
	$cambio = $_POST['fcambio'];
	$destino = $_POST['destino'];
	$comentario = $_POST['coment']; 
	$idcupon = $_POST['idcupon']; 
	$pendiente = $total - $efectivo;
	$cort = 0;
	$iva = (($total*16)/100);

	if (!isset($_POST['venta_token']) || $_POST['venta_token'] !== $_SESSION['venta_token']) {
		header("Location: ./../../vender.php?status=duplicado");
		exit;
	}
	// Eliminar token para que no se reutilice
	unset($_SESSION['venta_token']);

	switch ($destino) {
		case 1:
			# code...VENTA
			try {
				$sentencia = $base_de_datos->prepare("INSERT INTO Ventas(ID_Personal, ID_Cliente, Caja, ID_Medio, Cantidad, Fecha, Hora, Descuento_efect, Descuento_porcent, Subtotal, IVA, Total, Efectivo, Cambio, ID_Destino, Comentarios, Cort) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,? ,?);");
				$sentencia->execute([$vendedor, $comprador, $caja, $tipo, $cantidad, $fecha, $hora, $descuento_pesos, $descuento_porce, $subtotal, $iva, $total, $efectivo, $cambio, $destino, $comentario, $cort]);
				
				$sentencia = $base_de_datos->prepare("SELECT ID_Venta FROM Ventas ORDER BY ID_Venta DESC LIMIT 1;");
				$sentencia->execute();
				$resultado = $sentencia->fetch(PDO::FETCH_OBJ);

				$idVenta = $resultado === false ? 1 : $resultado->ID_Venta;

				$base_de_datos->beginTransaction();
				$sentencia = $base_de_datos->prepare("INSERT INTO Venta_Detalle(ID_Producto, Cantidad, ID_Venta) VALUES (?, ?, ?);");
				$sentenciaExistencia = $base_de_datos->prepare("UPDATE Productos SET Existencia = Existencia - ? WHERE ID_Producto = ?;");
				foreach ($_SESSION["carrito"] as $producto) {
					$total += $producto->total;
					$sentencia->execute([$producto->ID_Producto, $producto->Cantidad, $idVenta]);
					$sentenciaExistencia->execute([$producto->Cantidad, $producto->ID_Producto]);
				}  
				//echo 'ewe'.$idVenta;
				$base_de_datos->commit();
				unset($_SESSION["carrito"]);
				$_SESSION["carrito"] = [];
				if (!empty($idcupon)) {
					$sentencia1 = $base_de_datos->prepare("UPDATE Cupon SET Usado = ? WHERE ID_Cupon = ?;");
					$resultado1 = $sentencia1->execute([1, $idcupon]);
					if($resultado1 === TRUE){
						header("Location: ./../../vender.php?status=1&venta=1&idv=".$idVenta); 
						exit;
					}
				}else {
					header("Location: ./../../vender.php?status=1&venta=1&idv=".$idVenta); 
						exit;
				}
				
			}catch(Exception $exeption){
				echo $exeption;
				//echo 'fallo en la consulta';
			}
			break;
		case 2:
			# code... CREDITO
			try {
				//$hoy = date("d-m-Y");
				//sumo días
				$fecfinal = date("Y-m-d",strtotime($fecha."+ 34 days")); 
				/// Inserta la Venta
				$sentencia = $base_de_datos->prepare("INSERT INTO Ventas(ID_Personal, ID_Cliente, Caja, ID_Medio, Cantidad, Fecha, Hora, Descuento_efect, Descuento_porcent, Subtotal, IVA, Total, Efectivo, Cambio, ID_Destino, Comentarios, Cort, Fecha_Fin) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,? ,?);");
				$sentencia->execute([$vendedor, $comprador, $caja, $tipo, $cantidad, $fecha, $hora, $descuento_pesos, $descuento_porce, $subtotal, $iva, $total, $efectivo, $cambio, $destino, $comentario, $cort, $fecfinal]);
				//Obtiene el ultimo ID de venta 
				$sentencia = $base_de_datos->prepare("SELECT ID_Venta FROM Ventas ORDER BY ID_Venta DESC LIMIT 1;");
				$sentencia->execute();
				$resultado = $sentencia->fetch(PDO::FETCH_OBJ);

				$idVenta = $resultado === false ? 1 : $resultado->ID_Venta;
				
				//Guarda el credito
				$sqlcre = $base_de_datos->prepare("INSERT INTO Abonos (ID_Venta, ID_Cliente, Fecha, Saldo_Ant, Abono, Saldo_Pend, Estatus, ID_Medio, Fecha_Final) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);");
				$rescre = $sqlcre->execute([$idVenta, $comprador, $fechaabono, $total, $efectivo, $pendiente, 0, 2, $fecfinal]);
				//Obtiene el ultimo ID de Abono
				/* $sqlcr = "SELECT ID_Abono FROM Abonos ORDER BY ID_Abono DESC LIMIT 1";
				$querycr = $conexion -> query($sqlcr);
				$idabono = mysqli_fetch_array($querycr); */
				
				$senteupcli = $base_de_datos->prepare("UPDATE Clientes SET Credito = Credito - ? WHERE ID_Cliente = ?;");
				$resulupcli = $senteupcli->execute([$total, $comprador]);

				//guarda cada producto recorriendo el carrito en venta detalle
				$base_de_datos->beginTransaction();
				$sentencia = $base_de_datos->prepare("INSERT INTO Venta_Detalle(ID_Producto, Cantidad, ID_Venta) VALUES (?, ?, ?);");
				$sentenciaExistencia = $base_de_datos->prepare("UPDATE Productos SET Existencia = Existencia - ? WHERE ID_Producto = ?;");
				foreach ($_SESSION["carrito"] as $producto) {
					$total += $producto->total;
					$sentencia->execute([$producto->ID_Producto, $producto->Cantidad, $idVenta]);
					$sentenciaExistencia->execute([$producto->Cantidad, $producto->ID_Producto]);
				}  
				$base_de_datos->commit();
				unset($_SESSION["carrito"]);
				$_SESSION["carrito"] = [];

				header("Location: ./../../vender.php?status=1&venta=1&idv=".$idVenta); 
			}catch(Exception $exeption){
				echo $exeption;
				//echo 'fallo en la consulta';
			}
			break;
		case 3:
			# code... Apartados
			try {
				$fecfinal = date("Y-m-d",strtotime($fecha."+ 1 month")); 

				$sentencia = $base_de_datos->prepare("INSERT INTO Ventas(ID_Personal, ID_Cliente, Caja, ID_Medio, Cantidad, Fecha, Hora, Descuento_efect, Descuento_porcent, Subtotal, IVA, Total, Efectivo, Cambio, ID_Destino, Comentarios, Cort, Liquidar, Fecha_Fin) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,? ,?);");
				$sentencia->execute([$vendedor, $comprador, $caja, $tipo, $cantidad, $fecha, $hora, $descuento_pesos, $descuento_porce, $subtotal, $iva, $total, $efectivo, $cambio, $destino, $comentario, $cort, 1, $fecfinal]);

				$sentencia = $base_de_datos->prepare("SELECT ID_Venta FROM Ventas ORDER BY ID_Venta DESC LIMIT 1;");
				$sentencia->execute();
				$resultado = $sentencia->fetch(PDO::FETCH_OBJ);

				$idVenta = $resultado === false ? 1 : $resultado->ID_Venta;

				//Guarda el credito
				$sqlcre = $base_de_datos->prepare("INSERT INTO Abonos (ID_Venta, ID_Cliente, Fecha, Saldo_Ant, Abono, Saldo_Pend, Estatus, ID_Medio, Fecha_Final) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);");
				$rescre = $sqlcre->execute([$idVenta, $comprador, $fechaabono, $total, $efectivo, $pendiente, 0, 3, $fecfinal]);

				$base_de_datos->beginTransaction();
				$sentencia = $base_de_datos->prepare("INSERT INTO Venta_Detalle(ID_Producto, Cantidad, ID_Venta) VALUES (?, ?, ?);");
				$sentenciaExistencia = $base_de_datos->prepare("UPDATE Productos SET Existencia = Existencia - ? WHERE ID_Producto = ?;");
				foreach ($_SESSION["carrito"] as $producto) {
					$total += $producto->total;
					$sentencia->execute([$producto->ID_Producto, $producto->Cantidad, $idVenta]);
					$sentenciaExistencia->execute([$producto->Cantidad, $producto->ID_Producto]);
				}  
				//echo 'ewe'.$idVenta;
				$base_de_datos->commit();
				unset($_SESSION["carrito"]);
				$_SESSION["carrito"] = [];

				header("Location: ./../../vender.php?status=1&venta=1&idv=".$idVenta); 
			}catch(Exception $exeption){
				echo $exeption;
				//echo 'fallo en la consulta';
			}
			break;
		
		default:
			# code...
			break;
	}
}
?>