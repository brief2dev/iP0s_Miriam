<?php
header('Content-Type: text/html; charset=UTF-8');
session_start();
if ($_SESSION['loggedin'] != true){
    header('Location: index.php');
    echo $_SESSION['loggedin'];
}else{
    $page = 'Mutualista Abonos';
    include_once "lib/Header.php" ;
}
$idm = $_GET['id'];
include_once "lib/cnx.php";
include_once "lib/alerts.php";
?>

<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-flex align-items-center justify-content-between">
            <h4 class="page-title mb-0 font-size-18">Participantes </h4>

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
                            <th>Num</th>
                            <th>Nombre</th>
                            <th>Pago</th>
                            <th>Ult. Pago</th>
                            <th>Abonos</th>
                            <th>OPC</th>
                        </tr>
                    </thead>

                    <tbody>
                        <?php 
                        $smm = "SELECT * FROM M_Mutualista WHERE ID_Mutualista = ".$idm;
                        $qsmm = $conexion -> query($smm);
                        $mm = mysqli_fetch_array($qsmm);
                        error_reporting(E_ALL);
                        ini_set('display_errors', '1');
                        $sqlca = "SELECT * FROM M_MDetalles WHERE ID_Mutualista = ".$idm;
                        $queryca = $conexion -> query($sqlca);
                        while ($catt = mysqli_fetch_array($queryca)) {
                            $sus = "SELECT * FROM Clientes WHERE ID_Cliente = ".$catt['ID_Cliente'];
                            $qus = $conexion -> query($sus);
                            while ($user = mysqli_fetch_array($qus)) {
                                $pag = "SELECT * FROM M_Abonos WHERE ID_Cliente = ".$catt['ID_Cliente']." ORDER BY ID_Abono DESC LIMIT 1";
                                $qpag = $conexion -> query($pag);
                                $fpa = mysqli_fetch_array($qpag);
                                echo '<tr>
                                            <td>'.$catt['Numero'].'</td>
                                            <td>'.$user['Nombres'].' '.$user['Apellidos'].'</td>';
                                            switch ($catt['Tiempo_Pago']) {
                                                case '7':
                                                    $f_inicio= new DateTime($mm['Fecha_Inicio']);
                                                    $f_final= new DateTime($mm['Fecha_Fin']);
                                                    $diff = $f_inicio->diff($f_final);
                                                    $t_dias = $diff->days;

                                                    $r_t_dias = round(($t_dias / 7), 0, PHP_ROUND_HALF_UP);

                                                    $retVal = ($r_t_dias == 0 ) ? 1 : $r_t_dias ;
                                                    $ps = $catt['Cantidad']/$retVal;
                                                    echo "<td>Semanal ($".number_format($ps, 2).$r_t_dias.")</td>";
                                                    break;
                                                case '14':
                                                    $f_inicio= new DateTime($mm['Fecha_Inicio']);
                                                    $f_final= new DateTime($mm['Fecha_Fin']);
                                                    $diff = $f_inicio->diff($f_final);
                                                    $t_dias = $diff->days;

                                                    $r_t_dias = round(($t_dias / 14), 0, PHP_ROUND_HALF_UP);

                                                    $retVal = ($r_t_dias == 0 ) ? 1 : $r_t_dias ;
                                                    $ps = $catt['Cantidad']/$retVal;
                                                    echo "<td>Catorsenal ($".number_format($ps, 2).")</td>";
                                                    break;
                                                case '30':
                                                    $f_inicio= new DateTime($mm['Fecha_Inicio']);
                                                    $f_final= new DateTime($mm['Fecha_Fin']);
                                                    $diff = $f_inicio->diff($f_final);
                                                    $t_dias = $diff->days;

                                                    $r_t_dias = round(($t_dias / 30), 0, PHP_ROUND_HALF_UP);

                                                    $retVal = ($r_t_dias == 0 ) ? 1 : $r_t_dias ;
                                                    $ps = $catt['Cantidad']/$retVal;
                                                    echo "<td>Mensual ($".number_format($ps, 2).")</td>";
                                                    break;
                                                
                                                default:
                                                    # code...
                                                    break;
                                            }
                                            echo ' <td>'.date('d/m/Y', strtotime($fpa['Fecha'])).'</td>';
                                            $sab = "SELECT SUM(Monto) AS tot FROM M_Abonos WHERE ID_Cliente = ".$catt['ID_Cliente']." AND ID_Mutualista = ".$catt['ID_Detalle'];
                                            
                                            $qsab = $conexion -> query($sab);
                                            $abonado = mysqli_fetch_array($qsab);
                                            $abonado['tot'] = ($abonado['tot'] == null) ? 0 : $abonado['tot'];
                                            echo '
                                            <td>$'.$abonado['tot'].' / $'.$catt['Cantidad'].'</td>
                                            <td>
                                                <div onClick="modalphp('.$catt['ID_Detalle'].')" class="btn btn-primary"><i class="fas fa-credit-card"></i></div>';
                                                if ($catt['Entregado'] == 0) {
                                                    # code...
                                                    echo  ' <a class="btn btn-success" href="lib/Mutualista/cupon.php?idd='.$catt['ID_Detalle'].'"><i class="fa fa-gift"></i></a>';
                                                }
                                                echo '
                                            </td>
                                        </tr>';

                            }
                        }
                        echo'
                        </tbody>
                        </table>
                    </div>
                </div>
            </div>';
    ?>

                        <!--  Modal content -->
                        <div class='modal fade bs-example-modal-xl' id='modal-blitz' tabindex='-1' role='dialog'
                            aria-labelledby='myExtraLargeModalLabel' aria-hidden='true'>
                            <div class='modal-dialog modal-xl'>
                                <div class='modal-content'>
                                    <div class='modal-header'>
                                        <!--Modal Head-->
                                        <button type='button' class='close' data-dismiss='modal' aria-label='Close'>
                                            <span aria-hidden='true'>&times;</span>
                                        </button>
                                    </div>
                                    <div class='modal-body'>
                                        <!--Modal Body-->
                                        <!--Codigo que tu quieras aqui-->
                                        <div id='conte-modal'>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->

            </div>
            <!-- END TABLAS-->
            <?php include_once "lib/Footer.php" ?>

            <script>
            function modalphp(modal) {
                var options = {
                    modal: true,
                    height: 300,
                    width: 600
                };

                var url = 'lib/Mutualista/bridge/getdata.php?idd=' + modal;
                $('#conte-modal').load(url, function() {
                    console.log(url);
                    $("#modal-blitz").modal("toggle");
                    /* $('#modal-blitz').modal({
                        show: true
                    }); */
                });

            }
            </script>