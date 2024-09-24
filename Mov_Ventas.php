<?php
header('Content-Type: text/html; charset=UTF-8');
session_start();
if ($_SESSION['loggedin'] != true){
    header('Location: index.php');
    echo $_SESSION['loggedin'];
}else{
    $page = 'Corte';
    include_once "lib/Header.php" ;
}

include_once "lib/cnx.php";
include_once "lib/alerts.php";
$fecha= date("Y-m-d");
$totalcorte = 0;
$spei = 0;

?>

<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-flex align-items-center justify-content-between">
            <h4 class="page-title mb-0 font-size-18">Corte de Caja</h4>

            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                </ol>
            </div>

        </div>
    </div>
</div>
<!-- end page title -->
<!------------------------------------>
<!--ROW 1-->
<div class="row">
    <!--Default Table-->
    <Center>
        <h3>Total de Ventas</h3>
    </Center>
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
                                                $sql = "SELECT * FROM Ventas WHERE ID_Destino = 1 AND Cort = 0";
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
                                                                echo '<td>'.date('d-m-Y', strtotime($venta['Fecha']))." - ".date('g:i a', strtotime($venta['Hora'])).'</td>';
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
                                                                
                                                            }
                                                        }
                                                    }
                                                }
                                            ?>
                    </tbody>
                </table>
                <br>
                <center>
                    <h2>Efectivo: $ <?php echo number_format($totalcorte, 2); ?> </h2>
                    <h2>Tarjetas/SPEI: $ <?php echo number_format($spei, 2); ?> </h2>

                </center>
                <!-- <form action="./lib/Caja/Corte.php" id="venta" method="POST">
                    <input name="totalcorte" type="hidden" value="<php echo $totalcorte;?>">
                    <button type="submit" class="btn btn-success mt-3 mt-lg-0">Guardar en Caja</button>
                </form> -->

            </div>
        </div>
    </div>

    <!-- end col -->
    <!--END Default Table-->
    
     
</div>

<?php include_once "lib/Footer.php" ?>