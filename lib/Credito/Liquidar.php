<?php

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

/* if (!isset($_POST['venta_token']) || $_POST['venta_token'] !== $_SESSION['venta_token']) {
    header("Location: ./../../vender.php?status=duplicado");
    exit;
}

unset($_SESSION['venta_token']); */

//LIQUIDA TODO
if($id == 2890){
    $sqldt = "SELECT SUM(Saldo_Pend) as total FROM Abonos WHERE ID_Cliente = ".$idcre; 
    $querydt = $conexion -> query($sqldt);
    $abonos = mysqli_fetch_array($querydt);
    $total = $abonos['total']; 

    $sqlcliente = "SELECT * FROM Clientes WHERE ID_Cliente = ".$idcre;
    $querycliente = $conexion -> query($sqlcliente);
    $cliente = mysqli_fetch_array($querycliente);

    $fecha= date("Y-m-d H:i:s");
    $descr = "Liquidación del Credito del Cliente: ".$cliente['Nombres'];

    //Inserta el Abono
    $sqlapg = $base_de_datos->prepare("INSERT INTO Deudas(ID_Cliente, ID_Personal, Anterior, Abono, Pendiente, Fecha, ID_Medio) VALUES (?, ?, ?, ?, ?, ?, ?);");
    $rapg = $sqlapg->execute([$idcre, $personal, $total, $total, 0, $fecha, $medio]);
    if($rapg === true){
        //Actualiza la deuda
        $sqlab = $base_de_datos->prepare("UPDATE Abonos SET Estatus = 1, Saldo_Pend = 0 WHERE ID_Cliente = ? ;");
        $rab = $sqlab->execute([$idcre]);
        if($rab === true){
            //Inserta en la caja
            $sqlmov = $base_de_datos->prepare("INSERT INTO Caja(ID_Personal, ID_Caja_T, Descripcion, Fecha, Monto, Tip) VALUES (?, ?, ?, ?, ?, ?);");
            $rmov = $sqlmov->execute([$personal, $motivo, $descr, $fecha, $total, $medio]);
            if($rmov === true){
                $sqlcr = "SELECT ID_Deuda FROM Deudas ORDER BY ID_Deuda DESC LIMIT 1";
                $querycr = $conexion -> query($sqlcr);
                $idabono = mysqli_fetch_array($querycr);

                $sqlus = $base_de_datos->prepare("UPDATE Clientes SET Credito = Credito + ? WHERE ID_Cliente = ? ;");
                $rabus = $sqlus->execute([$total, $idcre]);

                $mjs = "Felicidades!! liquidaste tu crédito. Pinturas Acuario Ticul agradece tu preferencia. F".$idabono['ID_Deuda'];
                $message = $mjs;
	            $phone = '+52'.$cliente['Telefono'];
	            //require $_SERVER['DOCUMENT_ROOT']."/APIs/aws-SNS.php";
                header("Location: ./../../VCredito.php?status=1&venta=0&idv=".$idabono['ID_Deuda']);
            }
        }
    }
}else{
    //ABONA
    if($id == 1703){
        $sqldt = "SELECT * FROM Abonos WHERE ID_Abono = ".$idcre; 
        $querydt = $conexion -> query($sqldt);
        $abono = mysqli_fetch_array($querydt);

        $sqlcliente = "SELECT * FROM Clientes WHERE ID_Cliente = ".$abono['ID_Cliente'];
        $querycliente = $conexion -> query($sqlcliente);
        $cliente = mysqli_fetch_array($querycliente);

        $fecha= date("Y-m-d H:i:s");
        $descr = "Abono del Credito con folio: ".$idcre." del Cliente: ".$cliente['Nombres'];
        $tot = $saldo - $abonoo;
        //Inserta el Abono
        $sqlapg = $base_de_datos->prepare("INSERT INTO Deudas(ID_Cliente, ID_Personal, ID_Credito, Anterior, Abono, Pendiente, Fecha, ID_Medio) VALUES (?, ?, ?, ?, ?, ?, ?, ?);");
        $rapg = $sqlapg->execute([$cliente['ID_Cliente'], $personal, $idcre, $saldo, $abonoo, $tot, $fecha, $medio]);
        if($rapg === true){
            //Actualiza la deuda
           
            if($tot == 0){
                $stat = 1;
                $sldpnd = 0;
            }else{
                $stat = 0;
                $sldpnd = $tot;
            }
           /*  if($tot == 0){
                        $mjs = "Felicidades!! liquidaste tu crédito. Moda Miriam agradece tu preferencia. F".$idabono['ID_Deuda'];
                    }else{
                        $mjs = "Abono por $".$abonoo.". al credito con folio: ".$idcre.". Moda Miriam agradece tu preferencia.";
                    } */
            $sqlab = $base_de_datos->prepare("UPDATE Abonos SET Estatus = ?, Saldo_Pend = ? WHERE ID_Abono = ? ;");
            $rab = $sqlab->execute([$stat, $sldpnd, $idcre]);
            if($rab === true){
                //Inserta en la caja
                $sqlmov = $base_de_datos->prepare("INSERT INTO Caja(ID_Personal, ID_Caja_T, Descripcion, Fecha, Monto, Tip) VALUES (?, ?, ?, ?, ?, ?);");
                $rmov = $sqlmov->execute([$personal, $motivo, $descr, $fecha, $abonoo, $medio]);
                if($rmov === true){
                    $sqlcr = "SELECT ID_Deuda FROM Deudas ORDER BY ID_Deuda DESC LIMIT 1";
                    $querycr = $conexion -> query($sqlcr);
                    $idabono = mysqli_fetch_array($querycr);
                    
                    $sqlus = $base_de_datos->prepare("UPDATE Clientes SET Credito = Credito + ? WHERE ID_Cliente = ? ;");
                    $rabus = $sqlus->execute([$abonoo, $cliente['ID_Cliente']]);

                    
                    $message = $mjs;
                    $phone = '+52'.$cliente['Telefono'];
                    //require $_SERVER['DOCUMENT_ROOT']."/APIs/aws-SNS.php";
                    header("Location: ./../../VCredito.php?status=1&venta=0&idv=".$idabono['ID_Deuda']);
                }
            }
        }
    }
}
?>