<?php
header('Content-Type: text/html; charset=UTF-8');
session_start();
if ($_SESSION['loggedin'] != true){
    header('Location: index.php');
    echo $_SESSION['loggedin'];
}else{
    $page = 'Detalles Corte';
    include_once "lib/Header.php" ;
}

include_once "lib/cnx.php";
include_once "lib/alerts.php";
$idc = $_GET['idc'];
$fecha= date("Y-m-d");
$totalcorte = 0;

?>

<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-flex align-items-center justify-content-between">
            <h4 class="page-title mb-0 font-size-18">Detalles de Corte de Caja</h4>

            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                </ol>
            </div>

        </div>
    </div>
</div>
<!-- end page title -->
<!------------------------------------>
<br>
<Center>
    <h2>Total de Ventas</h2>
</Center>
<br>
<!--ROW 1-->
<div class="row">
    <!--Default Table-->

    <div class="col-12">
        <div class="card">
            <div class="card-body">

                <h4 class="card-title">Consulte los movimientos</h4>

                <table id="datatable" class="table table-striped table-bordered dt-responsive nowrap"
                    style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Suc.</th>
                            <th>Personal</th>
                            <th>Dia</th>
                            <th>Comentario</th>
                            <th>Tipo</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php 
                                                //obtiene los datos del Producto
                                                //$sql = "SELECT ID_Venta, ID_Personal, ID_Medio, Cantidad, Fecha, Total FROM Ventas WHERE Fecha = ". "'" . $fecha. "'" ." AND Cort = 0";
                                                $sql = "SELECT * FROM Ventas WHERE ID_Destino = 1 AND idcorte = ".$idc;
                                                //echo $sql;
                                                //echo $sql;
                                                $query = $conexion -> query ($sql);
                                                while($venta = mysqli_fetch_array($query)){
                                                    //echo $venta['Total'];//-----------------------------
                                                    //obtiene los datos del vendedor con el id retornado de ventas
                                                    $sql1 = "SELECT * FROM Personal WHERE ID_Personal = ".$venta['ID_Personal'];
                                                    $query1 = $conexion -> query ($sql1);
                                                    while($vendedor = mysqli_fetch_array($query1)){
                                                        //echo $vendedor['Nombre'];//---------------------------
                                                        //obtiene la sucursal con el id retornado de los datos del vendedor
                                                        $sql2 = "SELECT Nombre FROM Sucursales WHERE ID_Sucursal = ".$vendedor['ID_Sucursal'];
                                                        $query2 = $conexion -> query ($sql2);
                                                        while ($sucursal = mysqli_fetch_array($query2)){
                                                            //echo $sucursal['Nombre'];//---------------------------
                                                            //obtiene el medio de pago con el id retornado po la venta
                                                            $sql3 = "SELECT Tipo FROM Medio_Pago WHERE ID_Medio = ".$venta['ID_Medio'];
                                                            $query3 = $conexion -> query ($sql3);
                                                            //echo $sql3;
                                                            while ($medio = mysqli_fetch_array($query3)){

                                                                echo '<tr>';
                                                                echo '<td>'.$venta['ID_Venta'].'</td>';
                                                                echo '<td>'.$sucursal['Nombre'].'</td>';
                                                                echo '<td>'.$vendedor['Nombre'].' '.$vendedor['Apellido'].'</td>';
                                                                echo '<td>'.date("d-m-Y", strtotime($venta['Fecha'])).' - '.date("g:i a", strtotime($venta['Hora'])).'</td>';
                                                                echo '<td>'.$venta['Comentarios'].'</td>';
                                                                $sqti = "SELECT * FROM Medio_Pago WHERE ID_Medio = ".$venta['ID_Medio'];
                                                                $que = $conexion -> query($sqti);
                                                                $tip = mysqli_fetch_array($que);
                                                                echo '<td>'.$tip['Tipo'].'</td>';
                                                                echo '<td> <a href="Nota.php?id='.$venta['ID_Venta'].'"'.'target="_blank">'.'$ ' .$venta['Total'].'</a> </td>';
                                                                echo '</tr>';
                                                                if ($venta['ID_Medio'] == 2) {
                                                                    $spei = $spei + doubleval ($venta['Total']);
                                                                }else{
                                                                    $totalcorte = $totalcorte + doubleval ($venta['Total']);
                                                                }
                                                                //$totalcorte = $totalcorte + doubleval ($venta['Total']);
                                                            }
                                                        }
                                                    }
                                                }
                                            ?>
                    </tbody>
                </table>
                <br>
                <center>
                    <h5>Efectivo: $ <?php echo number_format($totalcorte, 2); ?> </h5>
                    <h5>Tarjetas/SPEI: $ <?php echo number_format($spei, 2); ?> </h5>
                </center>
            </div>
        </div>
    </div>
</div>
<br>
<Center>
    <h2>Movimientos</h2>
</Center>
<!--ROW 1-->
<div class="row">
    <!--Default Table-->

    <div class="col-12">
        <div class="card">
            <div class="card-body">

                <h4 class="card-title">Consulte los movimientos de Caja</h4>

                <table id="datatable" class="table table-striped table-bordered dt-responsive nowrap"
                    style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tipo</th>
                            <th>Monto</th>
                            <th>Medio</th>
                            <th>Descripcion</th>
                            <th>Fecha</th>
                            <th>Usuario</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php 
                                                //obtiene los datos del Producto
                                                //$sql = "SELECT ID_Venta, ID_Personal, ID_Medio, Cantidad, Fecha, Total FROM Ventas WHERE Fecha = ". "'" . $fecha. "'" ." AND Cort = 0";
                                                $sqlc = "SELECT * FROM Caja WHERE Saldo_Inicial = 0 AND Cort = 1 AND idcorte = ".$idc;
                                                $queryc = $conexion -> query ($sqlc);
                                                while($caja = mysqli_fetch_array($queryc)){
                                                    //echo $venta['Total'];//-----------------------------
                                                    //obtiene los datos del vendedor con el id retornado de ventas
                                                    $sql1p = "SELECT * FROM Personal WHERE ID_Personal = ".$caja['ID_Personal'];
                                                    $query1p = $conexion -> query ($sql1p);
                                                    while($admin = mysqli_fetch_array($query1p)){
                                                        //echo $vendedor['Nombre'];//---------------------------
                                                        //obtiene la sucursal con el id retornado de los datos del vendedor
                                                        
                                                            //echo $sucursal['Nombre'];//---------------------------
                                                            

                                                                echo '<tr>';
                                                                echo '<td>'.$caja['ID_Caja'].'</td>';
                                                                    $sqtip = "SELECT * FROM Caja_T WHERE ID_Caja_T = ".$caja['ID_Caja_T'];
                                                                    $quetip = $conexion -> query($sqtip);
                                                                    $tipc = mysqli_fetch_array($quetip);
                                                                echo '<td>'.$tipc['Motivo'].'</td>';

                                                                echo '<td>$ '.number_format($caja['Monto'], 2).'</td>';
                                                                    $tp = $caja['Tip'];
                                                                    $sqpg = "SELECT * FROM Medio_Pago WHERE ID_Medio = ".$tp;
                                                                    $quepg = $conexion -> query($sqpg);
                                                                    $tippg = mysqli_fetch_array($quepg);
                                                                echo '<td>'.$tippg['Tipo'].'</td>';

                                                                echo '<td>'.$caja['Descripcion'].'</td>';
                                                                echo '<td>'.date("d-m-Y g:i a", strtotime($caja['Fecha'])).'</td>';
                                                                echo '<td>'.$admin['Nombre'].' '.$vendedor['Apellido'].'</td>';
                                                                if ($caja['Tip'] == 2 && $caja['ID_Caja_T'] == 1) {
                                                                    $speic = $speic + doubleval ($caja['Monto']);
                                                                }else{
                                                                    if ($caja['Tip'] == 1 && $caja['ID_Caja_T'] == 1) {
                                                                        $totalcortec = $totalcortec + doubleval ($caja['Monto']);
                                                                    }
                                                                    
                                                                }
                                                               
                                                    }
                                                }
                                            ?>
                    </tbody>
                </table>
                <?php
                    $sqling = "SELECT * FROM Caja WHERE ID_Caja = ".$idc;
                    $quering = $conexion -> query($sqling);
                    $tcaja = mysqli_fetch_array($quering);

                    $ingre = doubleval ($tcaja['Efectivo']);
                    $gasto = doubleval ($tcaja['Gastos']);
                 ?>
                <br>
                <center>
                    <h5>Efectivo: $ <?php echo number_format($totalcortec, 2); ?> </h5>
                    <h5>Tarjetas/SPEI: $ <?php echo number_format($speic, 2); ?> </h5>
                    <h5>Gastos: $ -<?php echo number_format($gasto, 2); ?> </h5>
                </center>
                <!-- <center>
                    <h2>Efectivo: $ <php echo number_format($ingre, 2); ?> ====== Gastos: $
                        <php echo number_format($gasto, 2); ?> </h2>
                </center> -->

                <br>
                <!-- <form action="./lib/Caja/Corte.php" id="venta" method="POST">
                    <input name="totalcorte" type="hidden" value="<php echo $totalcorte;?>">
                    <button type="submit" class="btn btn-success mt-3 mt-lg-0">Guardar en Caja</button>
                </form> -->

            </div>
        </div>
    </div>
</div>
<br>
<center>
    <div class="d-print-none">
        <div class="">
            <center>
                <a href="T_CajaC.php?id=<?php echo $idc; ?>" target="_blank"
                    class="btn btn-success waves-effect waves-light"><i class="fa fa-print"></i> Imprimir
                    Comprobante
                </a>
            </center>

        </div>
    </div>
</center>
<br><br>
<?php include_once "lib/Footer.php" ?>