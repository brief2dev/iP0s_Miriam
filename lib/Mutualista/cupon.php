<?php 
error_reporting(E_ALL);
ini_set('display_errors', '1');


include_once "../conexion.php"; 
include_once "../cnx.php"; 
$idd = $_GET['idd'];
$fecha = date("Y-m-d");
//sumo 1 año
$fven = date("Y-m-d", strtotime($fecha."+ 1 year"));

$smd = "SELECT * FROM M_MDetalles WHERE ID_Detalle = ".$idd;
$qmd = $conexion -> query($smd);
$deta = mysqli_fetch_array($qmd);
$valor = $deta['Cantidad'];


$sentencia2 = $base_de_datos->prepare("INSERT INTO Cupon(Fecha_Gen, Fecha_Exp, Valor, Usado, ID_MD) VALUES (?, ?, ?, ?, ?);");
$resultado2 = $sentencia2->execute([$fecha, $fven, $valor, 0, $idd]);

$scp = "SELECT * FROM Cupon ORDER BY ID_Cupon DESC LIMIT 1";
$qcp = $conexion -> query($scp);
$cp = mysqli_fetch_array($qcp);
$idcp = $cp['ID_Cupon'];



if($resultado2 === TRUE){
    $se1 = $base_de_datos->prepare("UPDATE M_MDetalles SET ID_Cupon = ?, Entregado = ? WHERE ID_Detalle = ?;");
	$re1 = $se1->execute([$idcp, 1, $idd]); 
    if ($re1 === TRUE) {
        header("Location: ./../../MTA.php?id=".$deta['ID_Mutualista']."&status=1&venta=5&idv=".$idVenta);
		exit;
    }	
}

?>