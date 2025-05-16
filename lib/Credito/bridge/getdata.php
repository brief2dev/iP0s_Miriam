<?php 
include_once "../../conexion.php";
include_once "../../cnx.php";
//MODAL
$id = $_GET["idcliente"];

$sqlidv = "SELECT * FROM Clientes WHERE ID_Cliente = ".$id;
$queryidv = $conexion -> query ($sqlidv);
$idv = mysqli_fetch_array($queryidv);

?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>creditos</title>
</head>

<body>
    <div class="card">
        <div class="card-body">
            <Center>
                <h2>Cliente: <?php echo $idv['Nombres']." ".$idv['Apellidos'] ?></h2>
            </Center>
            <br>
            <Center>
                <h3 class="card-title mb-4">Creditos</h3>
            </Center>
            <div class="table-responsive">
                <table class="table table-centered mb-0">
                    <thead>
                        <tr>
                            <th scope="col"># Venta</th>
                            <th scope="col">F.Inicio</th>
                            <th scope="col">F.Termino</th>
                            <th scope="col">Monto</th>
                            <th scope="col" colspan="2">Destino</th>
                            <th scope="col" colspan="2">Opciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php //muestras las deudas del usuario
                        $tota_adeudo = 0;
                                $sql2 = "SELECT * FROM Abonos WHERE ID_Cliente = $id AND Estatus = 0 ORDER BY Fecha_Final ASC";
                                $query2 = $conexion -> query ($sql2);
                                $rows = mysqli_num_rows($query2);
                                    if ($rows == 0){
                                        echo '<tr>"Se encontro: "'.$rows.'" Coincidencias" </tr>';
                                    }else{
                                        while($credito = mysqli_fetch_array($query2)){
                                            echo '<tr>';
                                            echo '<td>'.$credito['ID_Venta'].'</td>';
                                            echo '<td>'.date('d/m/Y g:i a', strtotime($credito['Fecha'])).'</td>';
                                            echo '<td>'.date('d/m/Y', strtotime($credito['Fecha_Final'])).'</td>';
                                            echo '<td> $'.number_format($credito['Saldo_Pend'], 2).'</td>';
                                            $tota_adeudo = $tota_adeudo + $credito['Saldo_Pend'];
                                            echo '<td><span class="badge badge-soft-warning font-size-12">Credito</span></td>';
                                            echo '<td><div class="btn btn-primary"><a href="Nota.php?id='.$credito['ID_Venta'].'" target="_blank" style="color:#FFFFFF;><i class="mdi mdi-eye"></i>Nota </a></div></td>';
                                            echo '<td><div onClick="modal1php('.$credito['ID_Abono'].')" class="btn btn-primary"><i class=""></i>Abonar</div></td>';
                                            echo '<td><div onClick="modal2php('.$credito['ID_Venta'].')" class="btn btn-primary"><i class=""></i>Config</div></td>';
                                            //echo '<td><a href="Nota.php?id='.$venta['ID_Venta'].'" target="_blank" class="btn btn-primary btn-sm">Abonar</a></td>';
                                            echo '</tr>';
                                        } 
                                    }                                           
                            ?>
                    </tbody>
                </table>
                <br>
                <br>
                <center>
                    <h3>Total de Adeudo: $<?php echo number_format($tota_adeudo, 2);?></h3>
                </center>
                <br>
                <center>
                    <div class="btn btn-primary">
                        <a style="margin: 10px; color:#FFFFFF;"
                            href="lib/Credito/Liquidar.php?mrl=2890&md=1&icr=<?php echo $id; ?>" >
                            <i class="mdi mdi-cash-100"></i> Liquidar Todo (EFECTIVO)
                        </a>
                    </div>
                    <div class="btn btn-primary">
                        <a style="margin: 10px; color:#FFFFFF;"
                            href="lib/Credito/Liquidar.php?mrl=2890&md=2&icr=<?php echo $id; ?>">
                            <i class="mdi mdi-credit-card"></i> Liquidar Todo (TARJETA/SPEI)
                        </a>
                    </div>
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
      <!--  Modal content -->
    <div class='modal fade bs-example-modal-lg' id='modal-blitzc0de2' tabindex='-1' role='dialog'
        aria-labelledby='myExtraLargeModalLabel' aria-hidden='true'>
        <div class='modal-dialog modal-lg'>
            <div class='modal-content'>
                <div class='modal-header'>
                    <!--Modal Head-->
                    
                </div>
                <div class='modal-body'>
                    <!--Modal Body-->
                    <!--Codigo que tu quieras aqui-->
                    <div style="height: 670px;" id='conte2-modal'>
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
    var url1 = 'lib/Credito/bridge/loadpay.php?idabono=' + modal1;
    $('#conte1-modal').load(url1, function() {
        console.log(url1);
        $("#modal-blitzc0de").modal("toggle");
        /* $('#modal-blitzc0de').modal({
            show: true
        }); */
    });
}
</script>
<script>
function modal2php(modal2) {

    var options2 = {
        modal: true,
        height: 900,
        width: 600
    };
    var url2 = 'lib/Credito/bridge/config.php?iventa=' + modal2;
    $('#conte2-modal').load(url2, function() {
        console.log(url2);
        $("#modal-blitzc0de2").modal("toggle");
        /* $('#modal-blitzc0de').modal({
            show: true
        }); */
    });
}
</script>