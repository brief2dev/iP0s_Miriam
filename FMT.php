<?php
header('Content-Type: text/html; charset=UTF-8');
session_start();
if ($_SESSION['loggedin'] != true){
    header('Location: index.php');
    echo $_SESSION['loggedin'];
}else{
    $page = 'List Mutualista';
    include_once "lib/Header.php" ;
}

include_once "lib/cnx.php";
include_once "lib/alerts.php";
?>

<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-flex align-items-center justify-content-between">
            <h4 class="page-title mb-0 font-size-18">Mutualista Finalizados</h4>

            <div class="page-title-right">
            </div>

        </div>
    </div>
</div>
<!-- end page title -->
<!------------------------------------>

<!-- TABLAS-->
<div class="row" id="tablas">
    <div class="col-12" id="tabl">
        <div class="card">
            <div class="card-body">
                <table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap"
                    style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                    <thead>
                        <tr>
                            <th>Folio</th>
                            <th>Nombre</th>
                            <th>Inicio</th>
                            <th>Final</th>
                            <th>Integra</th>
                            <th>OPC</th>
                        </tr>
                    </thead>

                    <tbody>
                        <?php 
                        $sqltable = "SELECT * FROM M_Mutualista WHERE Finalizado = 1 ";
                        $resulctable = $conexion -> query($sqltable);
                        while ($lectura = mysqli_fetch_array($resulctable)){
                        $sqlca = "SELECT COUNT(ID_Cliente) as tt FROM M_MDetalles WHERE ID_Cliente != 0 AND ID_Mutualista = ".$lectura['ID_Mutualista'];
                        $queryca = $conexion -> query($sqlca);
                        $catt = mysqli_fetch_array($queryca);
                        echo'
                        <tr>
                            <td>'.$lectura['ID_Mutualista'].'</td>
                            <td>'.$lectura['Nombre'].'</td>
                            <td>'.date('d/m/Y', strtotime($lectura['Fecha_Inicio'])).'</td>
                            <td>'.date('d/m/Y', strtotime($lectura['Fecha_Fin'])).'</td>
                            <td>'.$catt['tt'].' / 10</td>
                            <td>
                                <a class="btn btn-info" href="MTA.php?id='.$lectura['ID_Mutualista'].'"><i class="fa fa-usd"></i> </a>
                                <a class="btn btn-danger" href="lib/Mutualista/delete.php?id=' . $lectura['ID_Mutualista'] . '"><i class="fa fa-trash"></i></a>
                            </td>
                        </tr>
                        ';
                        }
                        echo'
                        </tbody>
                        </table>
                    </div>
                </div>
            </div>';
    ?>
                        <!-- se carga las tablas desde la api mediante el js -->
            </div>
            <!-- END TABLAS-->
            <?php include_once "lib/Footer.php" ?>

            <script>
            var boton1 = document.getElementById("apxch1");
            boton1.onclick = function(e) {
                var cat = $("#cat1").val();
                //var cattexto = $("#cat1").find('option:selected').text();
                location.href = "Pint.php?id_cat=" + cat;
                texto;
                //window.top.document.title = texto;
            };
            </script>