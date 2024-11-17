<?php

error_reporting(E_ALL);
ini_set('display_errors', '1');
session_start();
include_once "conexion.php";
include_once "cnx.php";
$idpe = $_SESSION['ids'];
$succ = $_SESSION['suc'];

$sqlmisc = "SELECT * FROM ZMisc WHERE ID_Sucursal = ".$succ." ORDER BY ID_Misc DESC LIMIT 1";
$qerymisc = $conexion -> query($sqlmisc);
$ult_cort = mysqli_fetch_array($qerymisc);
$ult_corte = $ult_cort['Fecha'];
//$hoy = "2022-02-28";
$hoy = date("Y-m-d");
//$ult_dia_mes = date("Y-m-t", strtotime($hoy));
if(strtotime($ult_corte) == strtotime($hoy)){
    //ya se genero el pago anteriormente
    header('Location: ../Dashboard.php?id=0');
}
else{
    //se va a generar el moratoria
    //obtenemos los datos del abono
    $sqltar = "SELECT * FROM Abonos";
    $querytar = $conexion -> query($sqltar);
    while($tarifa = mysqli_fetch_array($querytar)){
        //convertimos la fecha final del abono a string
        $flimit = strtotime($tarifa['Fecha_Final']);
        $tdy = strtotime($hoy);

        //Creditos
        if ($tarifa['ID_Medio'] == 2 && $tarifa['Estatus'] == 0 && $flimit <= $tdy ) {
            /* si ya vencio agregamos el 10% mas a la deuda acxtual */
            $deuda = $tarifa['Saldo_Pend'] + ($tarifa['Saldo_Pend']*10)/100;
            $nuevafechaliimit = date("Y-m-d",strtotime($tarifa['Fecha_Final']."+ 33 days")); 
            $sentencia = $base_de_datos->prepare("UPDATE Abonos SET Saldo_Pend = ?, Fecha_Final = ? WHERE ID_Abono = ?;");
            $sentencia->execute([$deuda, $nuevafechaliimit, $tarifa['ID_Abono']]);
            $deuda = 0;

        }else{
        //Apartados
            if ($tarifa['ID_Medio'] == 3 && $tarifa['Estatus'] == 0 && $flimit <= $tdy) {
                $sentencia = $base_de_datos->prepare("UPDATE Abonos SET Estatus = ?, Saldo_Ant = ?, Abono = ?, Saldo_Pend = ? WHERE ID_Abono = ?;");
                $sentencia->execute([1, 0, 0, 0, $tarifa['ID_Abono']]);

                $sqlvd = "SELECT * FROM Venta_Detalle WHERE ID_Venta = ".$tarifa['ID_Venta'];
                $quervd = $conexion -> query($sqlvd);
                while ($product = mysqli_fetch_array($quervd)) {
                    $sentencia = $base_de_datos->prepare("UPDATE Productos SET Existencia = Existencia + ? WHERE ID_Producto = ?;");
                    $sentencia->execute([$product['Cantidad'], $product['ID_Producto']]);
                }
            }
        }
    }
    $sqlinsmisc = $base_de_datos->prepare("INSERT INTO ZMisc (ID_Sucursal, ID_Personal, Fecha, Corte) VALUES (?, ?, ?, ?);");
	$resultado = $sqlinsmisc->execute([$succ, $idpe, $hoy, 0]);
    if($resultado === TRUE){
        header('Location: ../Dashboard.php');
    }
}
?>