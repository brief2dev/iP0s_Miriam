<?php
header('Content-Type: text/html; charset=UTF-8');
session_start();
if ($_SESSION['loggedin'] != true){
    header('Location: index.php');
    echo $_SESSION['loggedin'];
}else{
    $page = 'Ventas Credito';
    include_once "lib/Header.php" ;
}

include_once "lib/cnx.php";
include_once "lib/alerts.php";
?>

<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-flex align-items-center justify-content-between">
            <h4 class="page-title mb-0 font-size-18">Abono de Creditos</h4>

            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Credito</a></li>
                    <li class="breadcrumb-item active">Abonos</li>
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

                <h4 class="card-title">Consulte los creditos Realizados</h4>
                <p class="card-title-desc">Puede usar las flechas de cada Celda para filtrar O bien usar el cuadro de busqueda para filtrar los datos
                </p>

                <table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap"
                    style="border-collapse: collapse; border-spacing: 0; width: 100%;">

                <!-- <table id="datatable" class="table table-bordered dt-responsive nowrap"
                    style="border-collapse: collapse; border-spacing: 0; width: 100%;"> -->

                    <thead>
                        <tr>
                            <th>Comprador</th>
                            <th>Total</th>
                            <th>Abonar</th>
                            <th>Liquidar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php 
                            //obtiene los datos de la venta
                            $sql = "SELECT DISTINCTROW (ID_Cliente) FROM Ventas WHERE ID_Destino = 2 ";
                            $query = $conexion -> query ($sql);
                                while($venta = mysqli_fetch_array($query)){
                                    $sql3 = "SELECT * FROM Clientes WHERE ID_Cliente = ".$venta['ID_Cliente'];
                                    $query3 = $conexion -> query ($sql3);
                                        while ($cliente = mysqli_fetch_array($query3)){
                                            echo '<tr>';
                                            echo '<td> <Center><a href="Cliente.php?id='.$venta['ID_Cliente'].'"'.'target="_blank">'. $cliente['Nombres']." ".$cliente['Apellidos'] .'</a></Center> </td>';
                                            $sql0 = "SELECT SUM(Total) FROM Ventas WHERE ID_Destino = 2 AND ID_Cliente = ".$venta['ID_Cliente'];
                                            $query0 = $conexion -> query ($sql0);
                                            $vdia = mysqli_fetch_array($query0);
                                            echo '<td> <Center><a href="Nota.php?id='.$venta['ID_Venta'].'"'.'target="_blank">'.'$ ' .$vdia['SUM(Total)'].'</a></Center> </td>';
                                            echo '<td> <Center> <a class="btn btn-info"
                                                href="VCForm.php?id="> <i class="fas fa-comment-dollar"></i> </a> </Center></td>';
                                            echo '<td> <Center><a class="btn btn-success"
                                                href="lib/Credito/Liquidar.php?id='.$venta['ID_Cliente'].'&cnom='.$cliente['Nombres'].'&monto='.$vdia['SUM(Total)'].' "><i class="fas fa-cash-register"></i></i></a></Center> </td>';
                                            echo '</tr>';
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
                //$sql0 = "SELECT SUM(Total) FROM Ventas WHERE ID_Destino = 2";
                //$query0 = $conexion -> query ($sql0);
                //$vdia = mysqli_fetch_array($query0);
                //echo '<h4 class="card-title"> Pendiente de Cobro: '.$vdia['SUM(Total)'].'</h4>';
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