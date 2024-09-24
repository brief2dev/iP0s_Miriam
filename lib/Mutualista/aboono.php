<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');

session_start();
include_once "../conexion.php";
include_once "../cnx.php";

$id = $_GET["mrl"];                 //tipo Abono = 1703 o liquidar todo = 2890
$idcre = $_GET["icr"];              //id del cliente o id del credito
$personal = $_SESSION['ids'];
$motivo = 1;                        // 1 abono, 2 Retiro
$medio = $_GET["md"];                 //1 EFECTIVO 2 TARJETA
$saldo = $_GET['saldototal'];       //saldo pendiente
$abonoo = $_GET["ab"];               // el monto a abonar



$sqlidv = "SELECT * FROM M_MDetalles WHERE ID_Detalle = ".$idcre;
$queryidv = $conexion -> query ($sqlidv);
$idv = mysqli_fetch_array($queryidv);
$ddi = $idv['ID_Detalle'];

$sc = "SELECT * FROM Clientes WHERE ID_Cliente = ".$idv['ID_Cliente'];
$qc = $conexion -> query($sc);
$c = mysqli_fetch_array($qc);
$caa = $c['ID_Cliente'];

$sm = "SELECT * FROM M_Mutualista WHERE ID_Mutualista = ".$idv['ID_Mutualista'];
$qm = $conexion -> query($sm);
$m = mysqli_fetch_array($qm);
$maa = $m['ID_Mutualista'];


        $fecha= date("Y-m-d H:i:s");
        $fech = date("Y-m-d");
        $descr = "Abono de mutualista con numero: ".$idv['ID_Mutualista']." del Cliente: ".$c['Nombres']." ".$c['Apellidos'];
        //$tot = $saldo - $abonoo;
        //Inserta el Abono
        $sqlapg = $base_de_datos->prepare("INSERT INTO M_Abonos (Fecha, Monto, ID_Cliente, ID_Mutualista) VALUES (?, ?, ?, ?);");
        $rapg = $sqlapg->execute([$fech, $abonoo, $caa, $ddi]);
        if($rapg === true){

            $sms = "SELECT * FROM M_Abonos ORDER BY ID_Abono DESC LIMIT 1";
            $qms = $conexion -> query($sms);
            $ms = mysqli_fetch_array($qms);

            $sqlmov = $base_de_datos->prepare("INSERT INTO Caja(ID_Personal, ID_Caja_T, Descripcion, Fecha, Monto, Tip, MT, IMT) VALUES (?, ?, ?, ?, ?, ?, ?, ?);");
            $rmov = $sqlmov->execute([$personal, $motivo, $descr, $fecha, $abonoo, $medio, 1, $ms['ID_Abono']]);
            
            header("Location: ./../../MT.php?status=1&venta=5&idv=" . $ms['ID_Abono']);
        }