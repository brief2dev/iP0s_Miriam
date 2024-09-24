<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');
session_start(); 

//$total = $_POST["total"];
include_once "../conexion.php";
include_once "../cnx.php";

$personal = $_SESSION['ids'];
$mut = $_POST['nam'];
$inica = $_POST['fi'];
$termina = $_POST['ff'];

$id = $_POST['id'];
$edit = $_POST['edit'];
$idc = $_POST['idc'];

if(empty($_POST['mnt1'])){$mnt1 = 0;}else{$mnt1 = $_POST['mnt1'];};
if(empty($_POST['mnt2'])){$mnt2 = 0;}else{$mnt2 = $_POST['mnt2'];};
if(empty($_POST['mnt3'])){$mnt3 = 0;}else{$mnt3 = $_POST['mnt3'];};
if(empty($_POST['mnt4'])){$mnt4 = 0;}else{$mnt4 = $_POST['mnt4'];};
if(empty($_POST['mnt5'])){$mnt5 = 0;}else{$mnt5 = $_POST['mnt5'];};
if(empty($_POST['mnt6'])){$mnt6 = 0;}else{$mnt6 = $_POST['mnt6'];};
if(empty($_POST['mnt7'])){$mnt7 = 0;}else{$mnt7 = $_POST['mnt7'];};
if(empty($_POST['mnt8'])){$mnt8 = 0;}else{$mnt8 = $_POST['mnt8'];};
if(empty($_POST['mnt9'])){$mnt9 = 0;}else{$mnt9 = $_POST['mnt9'];};
if(empty($_POST['mnt10'])){$mnt10 = 0;}else{$mnt10 = $_POST['mnt10'];};

if(empty($_POST['tp1'])){$tps1 = 0;}else{$tps1 = $_POST['tp1'];};
if(empty($_POST['tp2'])){$tps2 = 0;}else{$tps2 = $_POST['tp2'];};
if(empty($_POST['tp3'])){$tps3 = 0;}else{$tps3 = $_POST['tp3'];};
if(empty($_POST['tp4'])){$tps4 = 0;}else{$tps4 = $_POST['tp4'];};
if(empty($_POST['tp5'])){$tps5 = 0;}else{$tps5 = $_POST['tp5'];};
if(empty($_POST['tp6'])){$tps6 = 0;}else{$tps6 = $_POST['tp6'];};
if(empty($_POST['tp7'])){$tps7 = 0;}else{$tps7 = $_POST['tp7'];};
if(empty($_POST['tp8'])){$tps8 = 0;}else{$tps8 = $_POST['tp8'];};
if(empty($_POST['tp9'])){$tps9 = 0;}else{$tps9 = $_POST['tp9'];};
if(empty($_POST['tp10'])){$tps10 = 0;}else{$tps10 = $_POST['tp10'];};

if(empty($_POST['cl1'])){$cli1 = 0;}else{$cli1 = $_POST['cl1'];};
if(empty($_POST['cl2'])){$cli2 = 0;}else{$cli2 = $_POST['cl2'];};
if(empty($_POST['cl3'])){$cli3 = 0;}else{$cli3 = $_POST['cl3'];};
if(empty($_POST['cl4'])){$cli4 = 0;}else{$cli4 = $_POST['cl4'];};
if(empty($_POST['cl5'])){$cli5 = 0;}else{$cli5 = $_POST['cl5'];};
if(empty($_POST['cl6'])){$cli6 = 0;}else{$cli6 = $_POST['cl6'];};
if(empty($_POST['cl7'])){$cli7 = 0;}else{$cli7 = $_POST['cl7'];};
if(empty($_POST['cl8'])){$cli8 = 0;}else{$cli8 = $_POST['cl8'];};
if(empty($_POST['cl9'])){$cli9 = 0;}else{$cli9 = $_POST['cl9'];};
if(empty($_POST['cl10'])){$cli10 = 0;}else{$cli10 = $_POST['cl10'];};

if ($edit == "1") {
	if(empty($_POST['num1'])){$num1 = 0;}else{$num1 = $_POST['num1'];};
	if(empty($_POST['num2'])){$num2 = 0;}else{$num2 = $_POST['num2'];};
	if(empty($_POST['num3'])){$num3 = 0;}else{$num3 = $_POST['num3'];};
	if(empty($_POST['num4'])){$num4 = 0;}else{$num4 = $_POST['num4'];};
	if(empty($_POST['num5'])){$num5 = 0;}else{$num5 = $_POST['num5'];};
	if(empty($_POST['num6'])){$num6 = 0;}else{$num6 = $_POST['num6'];};
	if(empty($_POST['num7'])){$num7 = 0;}else{$num7 = $_POST['num7'];};
	if(empty($_POST['num8'])){$num8 = 0;}else{$num8 = $_POST['num8'];};
	if(empty($_POST['num9'])){$num9 = 0;}else{$num9 = $_POST['num9'];};
	if(empty($_POST['num10'])){$num10 = 0;}else{$num10 = $_POST['num10'];};

	if(empty($_POST['iddt1'])){$iddt1 = 0;}else{$iddt1 = $_POST['iddt1'];};
	if(empty($_POST['iddt2'])){$iddt2 = 0;}else{$iddt2 = $_POST['iddt2'];};
	if(empty($_POST['iddt3'])){$iddt3 = 0;}else{$iddt3 = $_POST['iddt3'];};
	if(empty($_POST['iddt4'])){$iddt4 = 0;}else{$iddt4 = $_POST['iddt4'];};
	if(empty($_POST['iddt5'])){$iddt5 = 0;}else{$iddt5 = $_POST['iddt5'];};
	if(empty($_POST['iddt6'])){$iddt6 = 0;}else{$iddt6 = $_POST['iddt6'];};
	if(empty($_POST['iddt7'])){$iddt7 = 0;}else{$iddt7 = $_POST['iddt7'];};
	if(empty($_POST['iddt8'])){$iddt8 = 0;}else{$iddt8 = $_POST['iddt8'];};
	if(empty($_POST['iddt9'])){$iddt9 = 0;}else{$iddt9 = $_POST['iddt9'];};
	if(empty($_POST['iddt10'])){$iddt10 = 0;}else{$iddt10 = $_POST['iddt10'];};

	# code...
	$se1 = $base_de_datos->prepare("UPDATE M_MDetalles SET ID_Cliente = ?, Cantidad = ?, Tiempo_Pago = ?, Numero = ? WHERE ID_Detalle = ?;");
	$re1 = $se1->execute([$cli1, $mnt1, $tps1, $num1, $iddt1]); 
	$se2 = $base_de_datos->prepare("UPDATE M_MDetalles SET ID_Cliente = ?, Cantidad = ?, Tiempo_Pago = ?, Numero = ? WHERE ID_Detalle = ?;");
	$re2 = $se2->execute([$cli2, $mnt2, $tps2, $num2, $iddt2]); 
	$se3 = $base_de_datos->prepare("UPDATE M_MDetalles SET ID_Cliente = ?, Cantidad = ?, Tiempo_Pago = ?, Numero = ? WHERE ID_Detalle = ?;");
	$re3 = $se3->execute([$cli3, $mnt3, $tps3, $num3, $iddt3]); 
	$se4 = $base_de_datos->prepare("UPDATE M_MDetalles SET ID_Cliente = ?, Cantidad = ?, Tiempo_Pago = ?, Numero = ? WHERE ID_Detalle = ?;");
	$re4 = $se4->execute([$cli4, $mnt4, $tps4, $num4, $iddt4]); 
	$se5 = $base_de_datos->prepare("UPDATE M_MDetalles SET ID_Cliente = ?, Cantidad = ?, Tiempo_Pago = ?, Numero = ? WHERE ID_Detalle = ?;");
	$re5 = $se5->execute([$cli5, $mnt5, $tps5, $num5, $iddt5]); 
	$se6 = $base_de_datos->prepare("UPDATE M_MDetalles SET ID_Cliente = ?, Cantidad = ?, Tiempo_Pago = ?, Numero = ? WHERE ID_Detalle = ?;");
	$re6 = $se6->execute([$cli6, $mnt6, $tps6, $num6, $iddt6]); 
	$se7 = $base_de_datos->prepare("UPDATE M_MDetalles SET ID_Cliente = ?, Cantidad = ?, Tiempo_Pago = ?, Numero = ? WHERE ID_Detalle = ?;");
	$re7 = $se7->execute([$cli7, $mnt7, $tps7, $num7, $iddt7]); 
	$se8 = $base_de_datos->prepare("UPDATE M_MDetalles SET ID_Cliente = ?, Cantidad = ?, Tiempo_Pago = ?, Numero = ? WHERE ID_Detalle = ?;");
	$re8 = $se8->execute([$cli8, $mnt8, $tps8, $num8, $iddt8]); 
	$se9 = $base_de_datos->prepare("UPDATE M_MDetalles SET ID_Cliente = ?, Cantidad = ?, Tiempo_Pago = ?, Numero = ? WHERE ID_Detalle = ?;");
	$re9 = $se9->execute([$cli9, $mnt9, $tps9, $num9, $iddt9]); 
	$se10 = $base_de_datos->prepare("UPDATE M_MDetalles SET ID_Cliente = ?, Cantidad = ?, Tiempo_Pago = ?, Numero = ? WHERE ID_Detalle = ?;");
	$re10 = $se10->execute([$cli10, $mnt10, $tps10, $num10, $iddt10]); 

	header("Location: ./../../MT.php?code=1");
}else{

	$sentencia = $base_de_datos->prepare("INSERT INTO M_Mutualista(Nombre, Fecha_Inicio, Fecha_Fin, ID_Personal) VALUES (?, ?, ?, ?);");
	$resultado = $sentencia->execute([$mut, $inica, $termina, $personal]);

	$mt = "SELECT * FROM M_Mutualista ORDER BY ID_Mutualista DESC LIMIT 1";
	echo $mt;
	$q = $conexion -> query($mt);
	$mutu = mysqli_fetch_array($q);

	$se1 = $base_de_datos->prepare("INSERT INTO M_MDetalles(ID_Cliente, ID_Mutualista, Cantidad, Tiempo_Pago) VALUES (?, ?, ?, ?);");
	$re1 = $se1->execute([$cli1, $mutu['ID_Mutualista'], $mnt1, $tps1]); 
	$se2 = $base_de_datos->prepare("INSERT INTO M_MDetalles(ID_Cliente, ID_Mutualista, Cantidad, Tiempo_Pago) VALUES (?, ?, ?, ?);");
	$re2 = $se2->execute([$cli2, $mutu['ID_Mutualista'], $mnt2, $tps2]); 
	$se3 = $base_de_datos->prepare("INSERT INTO M_MDetalles(ID_Cliente, ID_Mutualista, Cantidad, Tiempo_Pago) VALUES (?, ?, ?, ?);");
	$re3 = $se3->execute([$cli3, $mutu['ID_Mutualista'], $mnt3, $tps3]); 
	$se4 = $base_de_datos->prepare("INSERT INTO M_MDetalles(ID_Cliente, ID_Mutualista, Cantidad, Tiempo_Pago) VALUES (?, ?, ?, ?);");
	$re4 = $se4->execute([$cli4, $mutu['ID_Mutualista'], $mnt4, $tps4]); 
	$se5 = $base_de_datos->prepare("INSERT INTO M_MDetalles(ID_Cliente, ID_Mutualista, Cantidad, Tiempo_Pago) VALUES (?, ?, ?, ?);");
	$re5 = $se5->execute([$cli5, $mutu['ID_Mutualista'], $mnt5, $tps5]); 
	$se6 = $base_de_datos->prepare("INSERT INTO M_MDetalles(ID_Cliente, ID_Mutualista, Cantidad, Tiempo_Pago) VALUES (?, ?, ?, ?);");
	$re6 = $se6->execute([$cli6, $mutu['ID_Mutualista'], $mnt6, $tps6]); 
	$se7 = $base_de_datos->prepare("INSERT INTO M_MDetalles(ID_Cliente, ID_Mutualista, Cantidad, Tiempo_Pago) VALUES (?, ?, ?, ?);");
	$re7 = $se7->execute([$cli7, $mutu['ID_Mutualista'], $mnt7, $tps7]); 
	$se8 = $base_de_datos->prepare("INSERT INTO M_MDetalles(ID_Cliente, ID_Mutualista, Cantidad, Tiempo_Pago) VALUES (?, ?, ?, ?);");
	$re8 = $se8->execute([$cli8, $mutu['ID_Mutualista'], $mnt8, $tps8]); 
	$se9 = $base_de_datos->prepare("INSERT INTO M_MDetalles(ID_Cliente, ID_Mutualista, Cantidad, Tiempo_Pago) VALUES (?, ?, ?, ?);");
	$re9 = $se9->execute([$cli9, $mutu['ID_Mutualista'], $mnt9, $tps9]); 
	$se10 = $base_de_datos->prepare("INSERT INTO M_MDetalles(ID_Cliente, ID_Mutualista, Cantidad, Tiempo_Pago) VALUES (?, ?, ?, ?);");
	$re10 = $se10->execute([$cli10, $mutu['ID_Mutualista'], $mnt10, $tps10]); 

	header("Location: ./../../NMT.php?code=1");

}


/* if($re){
	header("Location: ./../../NMT.php?code=1");
}
else {
	header("Location: ./../../NMT.php?code=2");
} */








?>