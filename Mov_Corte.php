<?php
header('Content-Type: text/html; charset=UTF-8');
session_start();
if ($_SESSION['loggedin'] != true){
    header('Location: index.php');
    echo $_SESSION['loggedin'];
}else{
    $page = 'Corte';
    include_once "lib/Header.php" ;
}

include_once "lib/cnx.php";
include_once "lib/alerts.php";
$fecha= date("Y-m-d");
$totalcorte = 0;

?>

<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-flex align-items-center justify-content-between">
            <h4 class="page-title mb-0 font-size-18">Corte de Caja</h4>

            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                </ol>
            </div>

        </div>
    </div>
</div>
<!-- end page title -->
<!------------------------------------>
<!--ROW 1-->
<div class="row">
    <div class="col-md-4">
        <div class="card" >
            <div class="card-body">
                <div class="row">
                    <div class="col-8">
                        <div>
                            <p class="text-muted font-weight-medium mt-1 mb-2">Saldo Inicial</p>
                            <?php
                                $sqlini = "SELECT SUM(Monto) as mnt FROM Caja WHERE Saldo_Inicial = 1 AND Cort = 0";
                                $queryini = $conexion -> query($sqlini);
                                $saldo = mysqli_fetch_array($queryini);
                                        echo '<span class=""><h4 class="mt-4">$ '.number_format($saldo['mnt'], 2).'</h4></span>';
                                    ?>

                        </div>
                    </div>

                    <div class="col-4">
                        <div>
                            <div id="radial-chart-2"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card" style="background-color: #D1F2EB">
            <div class="card-body">
                <div class="row">
                    <div class="col-12">
                        <div>
                            <p class="text-muted font-weight-medium mt-1 mb-4">Ingresos en Efectivo</p>
                            <?php
                                        $sql2 = "SELECT SUM(Monto) as totalingre FROM Caja WHERE ID_Caja_T = 1 AND Tip = 1 AND Cort = 0 AND Saldo_Inicial != 1 ;";
                                        $query2 = $conexion -> query ($sql2);
                                        $rows2 = mysqli_fetch_array($query2);
                                        echo '<span class=""><h4 class="mt-4">$ '.number_format($rows2['totalingre'], 2).'</h4></span>';
                                    ?>
                        </div>
                    </div>

                    <div class="col-4">
                        <div>
                            <div id="radial-chart-2"></div>
                        </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card" style="background-color: #FAD7A0">
            <div class="card-body">
                <div class="row">
                    <div class="col-8">
                        <div>
                            <p class="text-muted font-weight-medium mt-1 mb-2">Gastos Realizados</p>
                            <?php
                                        $sql3 = "SELECT SUM(Monto) as totalgast FROM Caja WHERE ID_Caja_T = 2 AND Cort = 0 ";
                                        $query3 = $conexion -> query ($sql3);
                                        $rows3 = mysqli_fetch_array($query3);
                                        echo '<span class=""><h4 class="mt-4">$ '.number_format($rows3['totalgast'], 2).'</h4></span>';
                                    ?>
                        </div>
                    </div>

                    <div class="col-4">
                        <div>
                            <div id="radial-chart-2"></div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card" style="background-color: #D1F2EB">
            <div class="card-body">
                <div class="row">
                    <div class="col-8">
                        <div>
                            <p class="text-muted font-weight-medium mt-1 mb-2">Ventas en Efectivo</p>
                            <?php
                                        $sql4 = "SELECT SUM(Total) as efectivo FROM Ventas WHERE ID_Medio = 1 AND ID_Destino = 1 AND Cort = 0;";
                                        $query4 = $conexion -> query ($sql4);
                                        $rows4 = mysqli_fetch_array($query4);
                                        echo '<span class=""><h4 class="mt-4">$ '.number_format($rows4['efectivo'], 2).'</h4></span>';
                                    ?>
                        </div>
                    </div>
                    <div class="col-4">
                        <div>
                            <div id="radial-chart-2"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card" style="background-color: #D6EAF8">
            <div class="card-body">
                <div class="row">
                    <div class="col-12">
                        <div>
                            <p class="text-muted font-weight-medium mt-1 mb-2">Tarjetas/SPEI (Ventas/Ingresos)</p>
                            <?php
                                        $sqlabtt = "SELECT SUM(Monto) as totabtt FROM Caja WHERE ID_Caja_T = 1 AND Tip = 2 AND Cort = 0 AND Saldo_Inicial != 1 ;";
                                        $queabtt = $conexion -> query($sqlabtt);
                                        $ingreatt = mysqli_fetch_array($queabtt);

                                        $sql5 = "SELECT SUM(Total) as tarjeta FROM Ventas WHERE ID_Medio = 2 AND ID_Destino = 1 AND Cort = 0;";
                                        $query5 = $conexion -> query ($sql5);
                                        $rows5 = mysqli_fetch_array($query5);

                                        $ttabt = $ingreatt['totabtt'] + $rows5['tarjeta'];
                                        echo '<span class=""><h4 class="mt-4">$ '.number_format($ttabt, 2).'</h4></span>';
                                    ?>
                        </div>
                    </div>

                    <div class="col-4">
                        <div>
                            <div id="radial-chart-2"></div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card" style="background-color: #A3E4D7">
            <div class="card-body">
                <div class="row">
                    <div class="col-12">
                        <div>
                            <p class="text-muted font-weight-medium mt-1 mb-2">Total Recaudado</p>
                            <?php
                                $veningre = $ttabt + $rows4['efectivo'] + $rows2['totalingre'];
                                echo '<span class=""><h4 class="mt-4">$ '.number_format($veningre, 2).'</h4></span>';
                            ?>
                        </div>
                    </div>

                    <div class="col-4">
                        <div>
                            <div id="radial-chart-2"></div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-12">
        <div class="card" style="background-color: #EAFAF1">
            <div class="card-body">
                <div class="row">
                    <div class="col-6">
                        <div>
                            <center>
                                <p class="text-muted font-weight-medium mt-1 mb-2">Efectivo Recibido</p>
                                <?php
                                    $efec = $rows4['efectivo'] + $rows2['totalingre'];
                                        echo '<span class=""><h4 class="mt-4">$ '.number_format($efec, 2).'</h4></span>';
                                    ?>

                            </center>
                            
                        </div>
                        
                    </div>

                    <div class="col-6">
                        <div>
                            <center>
                                <p class="text-muted font-weight-medium mt-1 mb-2">Total en Caja (-Gastos)</p>
                                <?php
                                    $subefe = $efec - $rows3['totalgast'];
                                        echo '<span class=""><h4 class="mt-4">$ '.number_format($subefe, 2).'</h4></span>';
                                    ?>
                            </center>
                        </div>
                    </div>


                    
                    
                    <div class="col-12">
                        <form action="./lib/Caja/Corte.php" id="venta" method="POST">
                        <br>
                        <center>
                            <input name="abono" type="hidden" value="<?php echo $rows2['totalingre'];?>"> <!-- Ingresos en Efectivo -->
                            <input name="efectivo" type="hidden" value="<?php echo $rows4['efectivo'];?>"> <!-- Ventas en Efectivo -->
                            <input name="tarjeta" type="hidden" value="<?php echo $rows5['tarjeta'];?>"> <!-- Tarjetas/SPEI (Ventas/Ingresos) -->
                            <input name="gastos" type="hidden" value="<?php echo $rows3['totalgast'];?>"><!--  Gastos Realizados -->
                            <input name="totalcorte" type="hidden" value="<?php echo $subefe;?>"><!--  Total -->
                        <button type="submit" class="btn btn-success mt-3 mt-lg-0">Guardar en Caja</button>
                        </center>
                    </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!--Default Table-->
    <div class="col-12">
        <div class="card">
            <div class="card-body">

                <h4 class="card-title">Cortes de Caja</h4>

                <table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap"
                    style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tipo</th>
                            <th>Monto</th>
                            <th>Descrip</th>
                            <th>Fecha</th>
                            <th>Usuario</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php 
                                                //obtiene los datos de la caja
                                                $sql = "SELECT * FROM Caja WHERE Cort = 1 AND ms = 'SI' ORDER BY ID_Caja DESC";
                                                $query = $conexion -> query ($sql);
                                                while($caja = mysqli_fetch_array($query)){
                                                    //echo $product['Total'];//-----------------------------
                                                    //Obtiene los datos del tipo de movimiento
                                                    
                                                    $sql1 = "SELECT * FROM Caja_T WHERE ID_Caja_T =". $caja['ID_Caja_T'] ;
                                                    $query1 = $conexion -> query ($sql1);
                                                    while($tipo = mysqli_fetch_array($query1)){

                                                        $sql2 = "SELECT Nombre, Apellido FROM Personal WHERE ID_Personal =". $caja['ID_Personal'];
                                                            $query2 = $conexion -> query ($sql2);
                                                            while($user = mysqli_fetch_array($query2)){
                                                                echo '<tr>';
                                                                echo '<td><a href="CortesHis.php?idc='.$caja['ID_Caja'].'" >'.$caja['ID_Caja'].'</a></td>';
                                                                echo '<td>'.$tipo['Motivo'].'</td>';//
                                                                echo '<td>'.'$ '.number_format($caja['Saldo'], 2).'</td>';
                                                                echo '<td>'.$caja['Descripcion'].'</td>';
                                                                echo '<td>'.date('d/m/Y g:i a', strtotime($caja['Fecha'])).'</td>';
                                                                echo '<td>'.$user['Nombre'].'</td>';//usuario
                                                                echo '</tr>';  
                                                            }//END USER
                                                        
                                                    }//END Tipo 
                                                   
                                                }//END Caja
                                            ?>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
    <!-- end col -->
    <!--END Default Table-->
</div>
<?php include_once "lib/Footer.php" ?>