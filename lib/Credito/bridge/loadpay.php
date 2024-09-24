<?php
include_once "../../cnx.php";
$idabono = $_GET['idabono'];
//datos del Credito
$sqlida = "SELECT * FROM Abonos WHERE ID_Abono = ".$idabono;
$queryida = $conexion -> query ($sqlida);
$ida = mysqli_fetch_array($queryida);

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>payout</title>
</head>

<body>
    <form method="get" action="lib/Credito/Liquidar.php">
        <div class="row">
            <div class="col-lg-5">
                <div class="form-group">
                    <label for="password">Cliente: </label>
                    <?php 
                    $sqlcli = "SELECT * FROM Clientes WHERE ID_Cliente = ".$ida['ID_Cliente'];
                    $querycli = $conexion->query($sqlcli);
                    $cliente = mysqli_fetch_array($querycli);
                    echo '<input type="text" readonly style="text-transform: uppercase;" class="form-control"
                    value="'.$cliente['Nombres'].' '.$cliente['Apellidos'].'" name="cliente" >'
                ?>
                    <input type="hidden" name="mrl" value="1703"> 
                    <input type="hidden" name="icr" value="<?php echo $idabono; ?>">
                    <input type="hidden" name="saldototal" value="<?php echo $ida['Saldo_Pend']; ?>">
                </div>
            </div>
            <div class="col-lg-5">
            </div>

        </div>
        <div class="row">
            <div class="col-lg-4">
                <div class="form-group">
                    <label for="Foraneo">Deuda Total</label>
                    <input type="text" value="<?php echo $ida['Saldo_Pend'];?>" readonly
                        style="text-transform: uppercase;" class="form-control" placeholder="">
                </div>
            </div>
            <div class="col-lg-4">
                <div class="form-group">
                    <label for="name">Abono</label>
                    <input type="text" class="form-control" value="" name="ab" placeholder="">
                </div>
            </div>
            <div class="col-lg-4">
                <div class="form-group">
                    <label for="name">Medio de Pago</label>
                    <select name="md" class="form-control" id="" required>
                        <option disabled selected value="">Seleccione</option>
                        <option value="1">Efectivo</option>
                        <option value="2">Tarjeta/SPEI</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <center>
                    <br>
                    <h5 id="myExtraLargeModalLabel">NOTA: si va liquidar el saldo pendiente teclee el monto de la deuda
                        total en el campo de Abono! </h5>
                    <br>
                </center>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="text-center">
                    <button type="submit" class="btn btn-primary"><i class="mdi mdi-content-save-all"></i>
                        Guardar</button>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="card-body">
                    <Center>
                        <h3 class="card-title mb-4">Historial de Abonos</h3>
                    </Center>

                    <table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap"
                        style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                        <thead>
                            <tr>
                                <th scope="col">Folio</th>
                                <th scope="col">Fecha</th>
                                <th scope="col">Monto</th>
                                <th scope="col">Medio</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                                $sql2 = "SELECT * FROM Deudas WHERE ID_Credito = ".$idabono." ORDER BY ID_Deuda DESC";
                                $query2 = $conexion -> query ($sql2);
                                $rows = mysqli_num_rows($query2);
                                    if ($rows == 0){
                                        echo '<tr>"Se encontro: "'.$rows.'" Coincidencias" </tr>';
                                    }else{
                                        while($venta = mysqli_fetch_array($query2)){
                                            echo '<tr>';
                                            echo '<td>'.$venta['ID_Deuda'].'</td>';
                                            echo '<td>'.date('d-m-Y g:i a', strtotime($venta['Fecha'])).'</td>';
                                            echo '<td> $'.number_format($venta['Abono'], 2) .'</td>';
                                                $sqlvc = "SELECT * FROM Medio_Pago WHERE ID_Medio = ".$venta['ID_Medio'];
                                                $queryvc = $conexion -> query($sqlvc);
                                                $destino = mysqli_fetch_array($queryvc);
                                            echo '<td>'.$destino['Tipo'].'</td>';
                                            echo '<td><a href="T_Comprobante.php?id='.$venta['ID_Deuda'].'" target="_blank" class="btn btn-primary btn-sm"><i class="mdi mdi-printer"></i> Imprimir</a></td>';
                                            echo '</tr>';
                                        } 
                                    }                                           
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </form>
</body>

</html>