<?php
include_once "../../cnx.php";
$id = $_GET['idd'];
//datos del Credito
$sqlida = "SELECT * FROM Abonos WHERE ID_Abono = ".$idabono;
$queryida = $conexion -> query ($sqlida);
$ida = mysqli_fetch_array($queryida);


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
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>payoutyy</title>
</head>

<body>
    <form method="get" action="lib/Mutualista/aboono.php">
        <div class="row">
            <div class="col-lg-5">
                <div class="form-group">
                    <label for="password">Cliente: </label>
                    <?php 
                    echo '<input type="text" readonly style="text-transform: uppercase;" class="form-control"
                    value="'.$c['Nombres'].' '.$c['Apellidos'].'" name="cliente" >'
                ?>
                    <input type="hidden" name="mrl" value="1703"> 
                    <input type="hidden" name="icr" value="<?php echo $id; ?>">
                    <input type="hidden" name="saldototal" value="<?php echo $ida['Saldo_Pend']; ?>">
                </div>
            </div>
            <div class="col-lg-5">
            </div>

        </div>
        <div class="row">
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
                <div class="text-center">
                    <button type="submit" class="btn btn-primary"><i class="mdi mdi-content-save-all"></i>
                        Guardar abono</button>
                </div>
            </div>
        </div>
    </form>
</body>

</html>