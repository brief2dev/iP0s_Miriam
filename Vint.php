<?php
header('Content-Type: text/html; charset=UTF-8');
session_start();
if ($_SESSION['loggedin'] != true){
    header('Location: index.php');
    echo $_SESSION['loggedin'];
}else{
    $page = 'Inventario de Ventas';
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
                    etc. O bien usar el cuadro de busqueda para filtrar los datos
                </p>

                <table id="datatable" class="table table-bordered dt-responsive nowrap"
                    style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                    <thead>
                        <tr>
                            <th>Folio</th>
                            <th>Tipo</th>
                            <th>Personal</th>
                            <th>Dia</th>
                            <th>Comentario</th>
                            <th>Total</th>
                            <?php
                            if($_SESSION['cargo'] == 2){
                                echo "<th>Eliminar</th>";
                            }
                            ?>
                            <!-- <th>Eliminar</th> -->
                        </tr>
                    </thead>
                    <tbody>
                        <?php 
                            //obtiene los datos de la venta
                            $sql = "SELECT * FROM Ventas WHERE ID_Destino = 1 OR ID_Destino = 4 ORDER BY ID_Venta DESC";
                            $query = $conexion -> query ($sql);
                                while($venta = mysqli_fetch_array($query)){
                                    //echo $venta['Total'];//-----------------------------
                                    //obtiene los datos del vendedor con el id retornado de ventas
                                    $sql1 = "SELECT * FROM Personal WHERE ID_Personal = ".$venta['ID_Personal'];
                                    $query1 = $conexion -> query ($sql1);
                                        while($vendedor = mysqli_fetch_array($query1)){
                                            //echo $vendedor['Nombre'];//---------------------------
                                            //obtiene la sucursal con el id del vendedor retornado de los datos del vendedor
                                            $sql2 = "SELECT Destino FROM Venta_T WHERE ID_Destino = ".$venta['ID_Destino'];
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
                                                            echo '<td>'.$sucursal['Destino'].'</td>';
                                                            echo '<td>'.$vendedor['Nombre'].' '.$vendedor['Apellido'].'</td>';
                                                            echo '<td>'.date('d-mY', strtotime($venta['Fecha'])).' - '.date('g:i a', strtotime($venta['Hora'])).'</td>';
                                                            echo '<td>'.$venta['Comentarios'].'</td>';
                                                            echo '<td> <a href="Nota.php?id='.$venta['ID_Venta'].'"'.'target="_blank">'.'$ ' .$venta['Total'].'</a> </td>';
                                                                if($_SESSION['cargo'] == 2){
                                                                    echo '<td> <a id="borrar" class="btn btn-danger" href="lib/Ventas/Borrar.php?idb='.$venta['ID_Venta'].'"><i class="fa fa-trash"></i></a></td>';
                                                                }
                                                           // echo '<td> <a id="borrar" class="btn btn-danger" href="lib/Ventas/Borrar.php?idb='.$venta['ID_Venta'].'"><i class="fa fa-trash"></i></a></td>';
                                                            echo '</tr>';
                                                            }
                                                    }
                                            }
                                    }
                        ?>

                    </tbody>
                </table>
                <br>
                <?php
                $vdia;
                $vmes;
                $vano;
                $sql0 = "SELECT SUM(Total) FROM Ventas WHERE ID_Destino = 1 AND Fecha = CURDATE()";
                $query0 = $conexion -> query ($sql0);
                $vdia = mysqli_fetch_array($query0);
                echo '<h4 class="card-title"> Venta del Dia: '.$vdia['SUM(Total)'].'</h4>';
/* 
                $sql1 = "SELECT SUM(Total) FROM Ventas WHERE MONTH(Fecha) = MONTH(CURDATE()) AND YEAR(Fecha) = YEAR(CURDATE())";
                $query1 = $conexion -> query ($sql1);
                $vmes = mysqli_fetch_array($query1);
                echo '<h4 class="card-title"> Monto del Mes: '.$vmes['SUM(Total)'].'</h4>';
                
                $sql2 = "SELECT SUM(Total) FROM Ventas WHERE YEAR(Fecha) = YEAR(CURDATE())";
                $query2 = $conexion -> query ($sql2);
                $vano = mysqli_fetch_array($query2);
                echo '<h4 class="card-title"> Monto del Año: '.$vano['SUM(Total)'].'</h4>'; */
                ?>
            </div>
        </div>
    </div>
    <!-- end col -->
    <!--END Default Table-->
</div>

<?php include_once "lib/Footer.php" ?>