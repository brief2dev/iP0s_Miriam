<?php
session_start();
include_once "../conexion.php";
include_once "../cnx.php";
    $personal = $_SESSION['ids'];//solo admin
    $motivo = 2; //Retiro
    $fecha = date("Y-m-d");
    $hora = date("H:i:s");
    $descr = 'Retito y corte de caja ';
    $dia= date("Y-m-d H:i:s");
    $monto = $_POST['totalcorte'];
    $efectivo = $_POST['efectivo'];
    $tarjeta = $_POST['tarjeta'];
    $abono = $_POST['abono'];
    $gastos = $_POST['gastos'];
    if(empty($abono)){
        $abono = 0;
    }if(empty($tarjeta)){
        $tarjeta = 0;
    }if(empty($gastos)){
        $gastos = 0; 
    }

    $cort = 1;
    $ms = 'SI';
    $sqltv = "SELECT COUNT(ID_Venta) as tventa FROM Ventas WHERE ID_Destino = 1 AND Cort = 0";
    $querytv = $conexion -> query($sqltv);
    $tvent = mysqli_fetch_array($querytv);
    $tventas = $tvent['tventa'];
try{
    ////-----------------------------------------------------------------------
    $sentencia = $base_de_datos->prepare("INSERT INTO Caja(ID_Personal, ID_Caja_T, Descripcion, Fecha, Monto, Abono, Efectivo, Tarjeta, Gastos, T_Ventas, Saldo, Cort, ms) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");
    $sentencia->execute([$personal, $motivo, $descr, $dia, $monto, $abono, $efectivo, $tarjeta, $gastos, $tventas, $monto, $cort, $ms]);
    
    $sqlcrt = "SELECT ID_Caja FROM Caja ORDER BY ID_Caja DESC LIMIT 1";
    $querycrt = $conexion -> query($sqlcrt);
    $crt = mysqli_fetch_array($querycrt);
    $crtcj = $crt['ID_Caja'];

    $sentenciaExistencia = $base_de_datos->prepare("UPDATE Ventas SET Cort = ?, idcorte = ? WHERE Cort = 0;");
    $sentenciaExistencia->execute([$cort, $crtcj]);

    $sen = $base_de_datos->prepare("UPDATE Caja SET Cort = ?, idcorte = ? WHERE Cort = 0;");
    $sen->execute([$cort, $crtcj]);

    header("Location: ./../../Mov_Corte.php?status=1&venta=3&idv=".$crtcj);
}catch(Exception $exeption){
	echo $exeption;
}


?>