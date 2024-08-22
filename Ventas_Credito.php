<?php
header('Content-Type: text/html; charset=UTF-8');
session_start();
if ($_SESSION['loggedin'] != true){
    header('Location: index.php');
    echo $_SESSION['loggedin'];
}else{
    $page = 'Credito';
    include_once "lib/Header.php" ;
}

include_once "lib/cnx.php";
include_once "lib/alerts.php";

?>

<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-flex align-items-center justify-content-between">
            <h4 class="page-title mb-0 font-size-18">Inventario de Ventas</h4>

            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Inventario</a></li>
                    <li class="breadcrumb-item active">Ventas</li>
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
    <div class="col-12">
        <div class="card">
            <div class="card-body">

                <h4 class="card-title">Consulte Todas las ventas Realizadas</h4>
                <p class="card-title-desc">Puede usar las flechas de cada Celda para filtrar por Fecha, Nombre, Cantidad
                    etc. O bien usar el buscador para filtrar los datos
                </p>
                <table id="datatable" class="table table-bordered dt-responsive nowrap"
                    style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Cliente</th>
                            <th>Suc.</th>
                            <th>User</th>
                            <th>Fecha</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>

                        <?php 
                                                //obtiene los datos de la venta
                                                $sql = "SELECT ID_Venta, ID_Personal, ID_Medio, Cantidad, Fecha, Total FROM Ventas ORDER BY ID_Venta DESC";
                                                $query = $conexion -> query ($sql);
                                                while($venta = mysqli_fetch_array($query)){
                                                    //echo $venta['Total'];//-----------------------------
                                                    //obtiene los datos del vendedor con el id retornado de ventas
                                                    $sql1 = "SELECT Nombre, ID_Sucursal FROM Personal WHERE ID_Personal = ".$venta['ID_Personal'];
                                                    $query1 = $conexion -> query ($sql1);
                                                    while($vendedor = mysqli_fetch_array($query1)){
                                                        //echo $vendedor['Nombre'];//---------------------------
                                                        //obtiene la sucursal con el id retornado de los datos del vendedor
                                                        $sql2 = "SELECT Nombre FROM Sucursales WHERE ".$vendedor['ID_Sucursal'];
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
                                                            echo '<td>'.$medio['Tipo'].'</td>';
                                                            echo '<td>'.$sucursal['Nombre'].'</td>';
                                                            echo '<td>'.$vendedor['Nombre'].'</td>';
                                                            echo '<td>'.$venta['Fecha'].'</td>';
                                                            echo '<td> <a href="pages-invoice.html" target="_blank">'. '$ '.$venta['Total'].'</a> </td>';
                                                            echo '</tr>';

                                                            }
                                                        }
                                                    }
                                                }
                                            ?>

                    </tbody>
                </table>

            </div>
        </div>
    </div>
    <!-- end col -->
    <!--END Default Table-->
</div>

<?php include_once "lib/Footer.php" ?>