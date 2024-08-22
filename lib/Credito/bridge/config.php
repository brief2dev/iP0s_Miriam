<?php
include_once "../../cnx.php";
$idabono = $_GET['iventa'];
//datos del Credito


?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>payout</title>
</head>

<body>
    <form method="get" action="lib/Credito/Liquidar.php">
        <div class="row">
            <div class="col-lg-12">
                <div class="card-body">
                    <Center>
                        <h3 class="card-title mb-4">Productos del Credito</h3>
                    </Center>

                    <table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap"
                        style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                        <thead>
                            <tr>
                                <th scope="col">Codigo</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Cantidad</th>
                                <th scope="col">OPC</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                            $sqlida = "SELECT * FROM Venta_Detalle WHERE ID_Venta = ".$idabono;
                            $queryida = $conexion -> query ($sqlida);
                            while ($ida = mysqli_fetch_array($queryida)) {
                                $sql2 = "SELECT * FROM Productos WHERE ID_Producto = ".$ida['ID_Producto'];
                                $query2 = $conexion -> query ($sql2);
                                $rows = mysqli_num_rows($query2);
                                    if ($rows == 0){
                                        echo '<tr>"Se encontro: "'.$rows.'" Coincidencias" </tr>';
                                    }else{
                                        while($venta = mysqli_fetch_array($query2)){
                                            echo '<tr>';
                                            echo '<td>'.$venta['Codigo'].'</td>';
                                            echo '<td>'.$venta['Nombre'].'</td>';
                                            echo '<td>'.$ida['Cantidad'].'</td>';
                                            /* echo '<td> $'.number_format($venta['Abono'], 2) .'</td>';
                                                $sqlvc = "SELECT * FROM Medio_Pago WHERE ID_Medio = ".$venta['ID_Medio'];
                                                $queryvc = $conexion -> query($sqlvc);
                                                $destino = mysqli_fetch_array($queryvc); */
                                            echo '<td><a href="lib/Credito/cancelarprodc.php?us='.$user.'&cantorg='.$ida['Cantidad'].'&idv='.$idabono.'&idp='.$ida['ID_Producto'].'" class="btn btn-danger btn-sm"><i class="mdi mdi-delete"></i> Eliminar</a></td>';
                                            echo '</tr>';
                                        } 
                                    }     
                                # code...
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