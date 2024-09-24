<?php 
include_once "../../conexion.php";
include_once "../../cnx.php";
//MODAL
$id = $_GET["idd"];

$sqlidv = "SELECT * FROM M_MDetalles WHERE ID_Detalle = ".$id;
$queryidv = $conexion -> query ($sqlidv);
$idv = mysqli_fetch_array($queryidv);

$sc = "SELECT * FROM Clientes WHERE ID_Cliente = ".$idv['ID_Cliente'];
$qc = $conexion -> query($sc);
$c = mysqli_fetch_array($qc);

$sm = "SELECT * FROM M_Mutualista WHERE ID_Mutualista = ".$idv['ID_Mutualista'];
$qm = $conexion -> query($sm);
$m = mysqli_fetch_array($qm);





?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Abono a Mutualista</title>
</head>

<body>
    <div class="card">
        <div class="card-body">
            <Center>
                <h2>Cliente: <?php echo $c['Nombres']." ".$c['Apellidos']." (".$idv['ID_Cliente'].")" ?></h2>
            </Center>
            <br>
            <Center>
                <h3 class="card-title mb-4">Mutualista</h3><br>

            </Center>
            <table class="table table-centered mb-0">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">F.Inicio</th>
                        <th scope="col">F.Termino</th>
                        <th scope="col">Monto Total</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                            echo '<tr>';
                            echo '<td>'.$m['ID_Mutualista'].'</td>';
                            echo '<td>'.$m['Nombre'].'</td>';
                            echo '<td>'.date('d/m/Y', strtotime($m['Fecha_Inicio'])).'</td>';
                            echo '<td>'.date('d/m/Y', strtotime($m['Fecha_Fin'])).'</td>';
                            echo '<td> $'.number_format($idv['Cantidad'], 2).'</td>';
                            echo '</tr>';
                        ?>
                </tbody>
            </table>
            <br><br>
            <hr><br>
            <center>HISTORIAL DE ABONOS</center><hr><br>
            <div class="table-responsive">
                <table class="table table-centered mb-0">
                    <thead>
                        <tr>
                            <th scope="col">#Folio</th>
                            <th scope="col">Fecha abono</th>
                            <th scope="col">Cantidad</th>
                            <th scope="col">Restante</th>
                            <th scope="col">Monto Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php //muestras las deudas del usuario
                        $tota_adeudo = 0;
                                $sql2 = "SELECT * FROM M_Abonos WHERE ID_Mutualista = ".$id." AND Finalizado = 0 ORDER BY Fecha ASC";
                                //echo $sql2;
                                $query2 = $conexion -> query ($sql2);
                                $rows = mysqli_num_rows($query2);
                                    if ($rows == 0){
                                        echo '<tr>"Se encontro: "'.$rows.'" Coincidencias" </tr>';
                                    }else{
                                        while($credito = mysqli_fetch_array($query2)){
                                            echo '<tr>';
                                            echo '<td>'.$credito['ID_Abono'].'</td>';
                                            echo '<td>'.date('d/m/Y', strtotime($credito['Fecha'])).'</td>';
                                            echo '<td> $'.number_format($credito['Monto'], 2).'</td>';
                                            $tota_adeudo = $tota_adeudo + $credito['Monto'];
                                            $rest = $idv['Cantidad'] - $tota_adeudo;
                                            echo '<td> $'.number_format($rest, 2).'</td>';
                                            echo '<td> $'.number_format($idv['Cantidad'], 2).'</td>';
                                            //echo '<td><div onClick="modal1php('.$credito['ID_Abono'].')" class="btn btn-primary"><i class=""></i>Abonar</div></td>';
                                            echo '</tr>';
                                        } 
                                    }                                           
                            ?>
                    </tbody>
                </table>
                <br>
                <br>
                <center>
                    <h3>Total de Abonado: $<?php echo number_format($tota_adeudo, 2);?></h3>
                </center>
                <br>
                <center>
                    <div class="btn btn-primary"><!-- 
                        <a style="margin: 10px; color:#FFFFFF;"
                            href="lib/Credito/Liquidar.php?mrl=2890&md=1&icr=<?php echo $id; ?>">
                            <i class="mdi mdi-cash-100"></i> Agregar Abono
                        </a> -->
                        <div onClick="modal1php('<?php echo $id; ?>')" class="btn btn-primary"><i class=""></i>Abonar</div>
                    </div>
                    <!-- <div class="btn btn-primary">
                        <a style="margin: 10px; color:#FFFFFF;"
                            href="lib/Credito/Liquidar.php?mrl=2890&md=2&icr=<?php echo $id; ?>">
                            <i class="mdi mdi-credit-card"></i> Liquidar Todo (TARJETA/SPEI)
                        </a>
                    </div> -->
                    <!--  <div class="btn btn-primary">
                        <a style="margin: 10px; color:#FFFFFF;" href="Nota.php?id=<php echo $id; ?>" target="_blank">
                            <i class="mdi mdi-printer"></i> Imprimir Estado
                        </a>
                    </div> -->
                </center>

            </div>
        </div>
    </div>

    <!--  Modal content -->
    <div class='modal fade bs-example-modal-lg' id='modal-blitzc0de' tabindex='-1' role='dialog'
        aria-labelledby='myExtraLargeModalLabel' aria-hidden='true'>
        <div class='modal-dialog modal-lg'>
            <div class='modal-content'>
                <div class='modal-header'>
                    <!--Modal Head-->

                </div>
                <div class='modal-body'>
                    <!--Modal Body-->
                    <!--Codigo que tu quieras aqui-->
                    <div style="height: 670px;" id='conte1-modal'>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->

</body>

</html>

<script>
function modal1php(modal1) {

    var options = {
        modal: true,
        height: 900,
        width: 600
    };
    var url1 = 'lib/Mutualista/bridge/loadpay.php?idd=' + modal1;
    $('#conte1-modal').load(url1, function() {
        console.log(url1);
        $("#modal-blitzc0de").modal("toggle");
        /* $('#modal-blitzc0de').modal({
            show: true
        }); */
    });
}
</script>