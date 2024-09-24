<?php
header('Content-Type: text/html; charset=UTF-8');
session_start();
if ($_SESSION['loggedin'] != true){
    header('Location: index.php');
    echo $_SESSION['loggedin'];
}else{
    $page = 'Vales & Cupones';
    include_once "lib/Header.php" ;
}

include_once "lib/cnx.php";
include_once "lib/alerts.php";
?>

<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-flex align-items-center justify-content-between">
            <h4 class="page-title mb-0 font-size-18">Vales</h4>

            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Vales</a></li>
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

                <h4 class="card-title">Consulte Cupones y Vales</h4>

                <table id="datatable" class="table table-bordered dt-responsive nowrap"
                    style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                    <thead>
                        <tr>
                            <th>Folio</th>
                            <th>Tipo</th>
                            <th>Cliente</th>
                            <th>Fecha Gen</th>
                            <th>Fecha Exp</th>
                            <th>Valor</th>
                            <th>Usar</th>
                            <!-- <php
                            if($_SESSION['cargo'] == 2){
                                echo "<th>Eliminar</th>";
                            }
                            ?> -->
                            <!-- <th>Eliminar</th> -->
                        </tr>
                    </thead>
                    <tbody>
                        <?php 
                            //obtiene los datos de la venta
                            $fech = date("Y-m-d");
                            
                            $sql = "SELECT * FROM Cupon WHERE Usado = 0 AND Fecha_Exp >= ".$fech." ORDER BY ID_Cupon DESC";
                            
                            $query = $conexion -> query ($sql);
                            error_reporting(E_ALL);
                            ini_set('display_errors', '1');
                                while($venta = mysqli_fetch_array($query)){
                                    //echo $venta['Total'];//-----------------------------
                                    //obtiene los datos del vendedor con el id retornado de ventas
                                    if (empty($venta['ID_Venta'])) {
                                        $sql1 = "SELECT * FROM M_MDetalles WHERE ID_Detalle = ".$venta['ID_MD'];
                                        $topp = "Mutualista";
                                    }else{
                                        $sql1 = "SELECT * FROM Ventas WHERE ID_Venta = ".$venta['ID_Venta'];
                                        $topp = "Venta";
                                    }
                                    $query1 = $conexion -> query ($sql1);
                                        while($vendedor = mysqli_fetch_array($query1)){
                                            //echo $vendedor['Nombre'];//---------------------------
                                            //obtiene la sucursal con el id del vendedor retornado de los datos del vendedor
                                            $sql2 = "SELECT *FROM Clientes WHERE ID_Cliente = ".$vendedor['ID_Cliente'];
                                            $query2 = $conexion -> query ($sql2);
                                                while ($sucursal = mysqli_fetch_array($query2)){
                                                            echo '<tr>';
                                                            echo '<td>'.$venta['ID_Cupon'].'</td>';
                                                            echo '<td>'.$topp.'</td>';
                                                            echo '<td>'.$sucursal['Nombres'].' '.$sucursal['Apellidos'].'</td>';
                                                            echo '<td>'.date('d/m/Y', strtotime($venta['Fecha_Gen'])).'</td>';
                                                            echo '<td>'.date('d/m/Y', strtotime($venta['Fecha_Exp'])).'</td>';
                                                            echo '<td>$'.number_format($venta['Valor'], 2).'</td>';
                                                            //echo '<td> <a href="Nota.php?id='.$venta['ID_Cupon'].'"'.'target="_blank">f</a> </td>';
                                                            echo '<td> <a id="borrar" class="btn btn-info" href="vender.php?status=28&st='.$venta['Valor'].'&idb='.$venta['ID_Cupon'].'"><i class="fa fa-cash-register"></i></a></td>';
                                                                /* if($_SESSION['cargo'] == 2){
                                                                    echo '<td> <a id="borrar" class="btn btn-danger" href="lib/Ventas/Borrar.php?idb='.$venta['ID_Cupon'].'"><i class="fa fa-trash"></i></a></td>';
                                                                } */
                                                           // echo '<td> <a id="borrar" class="btn btn-danger" href="lib/Ventas/Borrar.php?idb='.$venta['ID_Venta'].'"><i class="fa fa-trash"></i></a></td>';
                                                            echo '</tr>';
                                                    }
                                            }
                                    }
                        ?>

                    </tbody>
                </table>
                <br>
                <?php
                /* $vdia;
                $vmes;
                $vano;
                $sql0 = "SELECT SUM(Total) FROM Ventas WHERE ID_Destino = 1 AND Fecha = CURDATE()";
                $query0 = $conexion -> query ($sql0);
                $vdia = mysqli_fetch_array($query0);
                echo '<h4 class="card-title"> Venta del Dia: '.$vdia['SUM(Total)'].'</h4>'; */
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