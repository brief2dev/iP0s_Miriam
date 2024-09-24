<?php
header('Content-Type: text/html; charset=UTF-8');
session_start();
if ($_SESSION['loggedin'] != true){
    header('Location: index.php');
    echo $_SESSION['loggedin'];
}else{
    $page = 'Creditos';
    include_once "lib/Header.php" ;
}

include_once "lib/cnx.php";
include_once "lib/alerts.php";
?>

<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-flex align-items-center justify-content-between">
            <h4 class="page-title mb-0 font-size-18">Credito de Ventas</h4>

            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Credito</a></li>
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

                <h4 class="card-title">Consulte Apertados Pendientes</h4>
                <p class="card-title-desc">Puede usar las flechas de cada Celda para filtrar por Fecha, Nombre, Cantidad
                    etc. O bien usar el cuadro de busqueda para filtrar los datos
                </p>

                <table id="datatable" class="table table-bordered dt-responsive nowrap"
                    style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Cliente</th>
                            <th>Deuda Total</th>
                            <th>Abonar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php 
                            //BUSCA EL ABONO MAS RECIENTE
                            //$sql = "SELECT MAX(ID_Abono) as ida, ID_Venta, Fecha, Abono, Saldo_Pend FROM Abonos WHERE Estatus = 0 GROUP BY ID_Venta ORDER BY ID_Venta DESC";
                            /* SELECT DISTINCT ID_Cliente, ID_Venta, Fecha, (SELECT SUM(Total FROM Ventas WHERE ID_Cliente = 7) FROM Ventas WHERE ID_Destino = 2 AND ID_Cliente = 7 GROUP BY ID_Cliente 
                            SELECT SUM(Total) as t FROM Ventas WHERE ID_Destino = 2 AND ID_Cliente = 7
                            SELECT Saldo_Pend FROM Abonos WHERE ID_Venta = 110 AND ID_Cliente = 1 ORDER BY ID_Abono DESC LIMIT 1 */
                            //$sql = "SELECT MAX(ID_Deuda) as ida, ID_Cliente, Abono, Pendiente, Fecha FROM Deudas GROUP BY ID_Cliente ORDER BY ID_Cliente DESC";
                            //$sql = "SELECT * FROM Deudas WHERE estatus = 0 AND ID_Deuda IN (SELECT MAX(ID_Deuda) FROM Deudas GROUP BY ID_Cliente ORDER BY ID_Cliente DESC) GROUP BY ID_Cliente ORDER BY ID_Cliente DESC";
                            $sqlcli = "SELECT MAX(ID_Cliente) as cliente FROM Abonos WHERE Estatus = 0 AND ID_Medio = 3 GROUP BY ID_Cliente ORDER BY ID_Cliente DESC";
                            $querycli = $conexion -> query ($sqlcli);
                                while($cliente = mysqli_fetch_array($querycli)){
                                            //obtiene nombre con el id del cliente retornado de los datos
                                            $sql2 = "SELECT * FROM Clientes WHERE ID_Cliente = ".$cliente['cliente'];
                                            $query2 = $conexion -> query ($sql2);
                                                while ($ncliente = mysqli_fetch_array($query2)){
                                                            echo '<tr>';
                                                            echo '<td>'.$cliente['cliente'].'</td>';
                                                            echo '<td> <a href="Cliente.php?id='.$cliente['cliente'].'"'.'target="_blank">'. $ncliente['Nombres']." ".$ncliente['Apellidos'] .'</a> </td>';
                                                            $sqltot = "SELECT SUM(Saldo_Pend) as total FROM Abonos WHERE ID_Cliente = ".$cliente['cliente']." AND Estatus = 0";
                                                            $querytot = $conexion -> query($sqltot);
                                                            $total = mysqli_fetch_array($querytot);
                                                            echo '<td> $'.number_format( $total['total'], 2).'</td>';
                                                            echo '<td><div onClick="modalphp('.$cliente['cliente'].')" class="btn btn-primary"><i class="fas fa-comment-dollar"></i></div>
                                                                  </td>';
                                                            echo '</tr>';
                                                    }
                                    }
                        ?>

                    </tbody>
                </table>
                <br>
                <!--  Modal content -->
                <div class="modal fade bs-example-modal-lg" id="modal-blitz" tabindex="-1" role="dialog"
                    aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <!--Modal Head-->
                                <!--Codigo que tu quieras aqui-->
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div  class="modal-body">
                                <!--Modal Body-->
                                <!--Codigo que tu quieras aqui-->
                                <div id="conte-modal">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->

            </div>
        </div>
    </div>
    <!-- end col -->
    <!--END Default Table-->
</div>

<?php include_once "lib/Footer.php" ?>

<script>
function modalphp(modal) {
    var options = {
        modal: true,
        height: 300,
        width: 600
    };

    var url = 'lib/Credito/bridge/getdata.php?idcliente=' + modal;
    $('#conte-modal').load(url, function() {
        console.log(url);
        $("#modal-blitz").modal("toggle");
        /* $('#modal-blitz').modal({
            show: true
        }); */
    });

}
</script>