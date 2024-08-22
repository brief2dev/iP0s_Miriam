<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');
session_start();
$subtotal = $_POST['Subtotal'];
include_once "../conexion.php"; 


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
//Subtotal ya uzado arriba 


$efectivo = $_POST['efectivo'];
$cambio = $_POST['fcambio'];
$destino = $_POST['destino'];
$comentario = $_POST['coment']; 
$cort = 0;

$fecfinal = date("Y-m-d",strtotime($fecha."+ 1 month")); 

//echo $descuento_pesos.'  '.$descuento_porce.'  '.$total.'  '.$efectivo.'  '.$cambio;
	try {
		$sentencia = $base_de_datos->prepare("INSERT INTO Ventas(ID_Personal, ID_Cliente, Caja, ID_Medio, Cantidad, Fecha, Hora, Descuento_efect, Descuento_porcent, Subtotal, IVA, Total, Efectivo, Cambio, ID_Destino, Comentarios, Cort, Fecha_Fin) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,? ,?);");
		$sentencia->execute([$vendedor, $comprador, $caja, $tipo, $cantidad, $fecha, $hora, $descuento_pesos, $descuento_porce, $subtotal, $iva, $total, $efectivo, $cambio, $destino, $comentario, $cort, $fecfinal]);


		$sentencia = $base_de_datos->prepare("SELECT ID_Venta FROM Ventas ORDER BY ID_Venta DESC LIMIT 1;");
		$sentencia->execute();
		$resultado = $sentencia->fetch(PDO::FETCH_OBJ);

		$idVenta = $resultado === false ? 1 : $resultado->ID_Venta;

		$base_de_datos->beginTransaction();
		$sentencia = $base_de_datos->prepare("INSERT INTO Venta_Detalle(ID_Producto, Cantidad, ID_Venta) VALUES (?, ?, ?);");
		$sentenciaExistencia = $base_de_datos->prepare("UPDATE Productos SET Existencia = Existencia - ? WHERE ID_Producto = ?;");
		foreach ($_SESSION["cam"] as $producto) {
			//$total += $producto->total;
			$sentencia->execute([$producto->ID_Producto, $producto->Cantidad, $idVenta]);
			$sentenciaExistencia->execute([$producto->Cantidad, $producto->ID_Producto]);
		}  
		//echo 'ewe'.$idVenta;
		$base_de_datos->commit();
		unset($_SESSION["cam"]);
		unset($_SESSION["dev"]);
		$_SESSION["cam"] = [];
		$_SESSION["dev"] = [];
		//header("Location: ./../../VDev.php?status=1&"); 
		if ($total < 0) {
			$tot = abs($total);
			$sentencia2 = $base_de_datos->prepare("INSERT INTO Cupon(ID_Venta, Fecha_Gen, Fecha_Exp, Valor, Usado) VALUES (?, ?, ?, ?, ?);");
			$resultado2 = $sentencia2->execute([$idVenta, $fecha, $fecfinal, $tot, 0]);

			if($resultado2 === TRUE){
				header("Location: ./../../VDev.php?status=1&venta=4&idv=".$idVenta);
				exit;
			}
		}else{
			header("Location: ./../../VDev.php?r=".$total."&status=1&venta=4&idv=".$idVenta);
				exit;
		}
		
		
	}
	catch(Exception $exeption){
		echo $exeption;
		//echo 'fallo en la consulta';
	}




?>