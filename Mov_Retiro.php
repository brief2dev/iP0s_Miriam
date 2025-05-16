<?php
header('Content-Type: text/html; charset=UTF-8');
session_start();
if ($_SESSION['loggedin'] != true){
    header('Location: index.php');
    echo $_SESSION['loggedin'];
}else{
    $page = 'Retiros';
    include_once "lib/Header.php" ;
}

include_once "lib/cnx.php";
include_once "lib/alerts.php";
?>
<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-flex align-items-center justify-content-between">
            <h4 class="page-title mb-0 font-size-18">Caja</h4>

            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Movimientos</a></li>
                    <li class="breadcrumb-item active">Retiros</li>
                </ol>
            </div>

        </div>
    </div>
</div>
<!-- end page title -->

<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Retiro de la Caja</h4>
                <p class="card-title-desc">Ingresa el monto y Describe el movimiento</p>

                <form id="form-horizontal" action="lib/Caja/Guardar_Retiro.php" method="POST"
                    class="form-horizontal form-wizard-wrapper">
                    <h3>Detalles del Retiro</h3>
                    <fieldset>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtFirstNameBilling" class="col-lg-3 col-form-label">*Monto</label>
                                    <div class="col-lg-9">
                                        <input id="txtFirstNameBilling" name="monto" type="text" class="form-control"
                                            required>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtAddress1Billing" class="col-lg-3 col-form-label">*Descripcion</label>
                                    <div class="col-lg-9">
                                        <textarea id="txtAddress1Billing" name="descr" rows="4" class="form-control"
                                            maxlength="123" required></textarea>
                                    </div>
                                </div>
                                <center>
                                    <button type="submit" class="btn btn-success mt-3 mt-lg-0">Guardar</button>
                                </center>
                            </div>
                        </div>
                    </fieldset>


                </form>

            </div>
        </div>
    </div>
    <Center>
        <h3>Lista de Retiros </h3>
    </Center>
    <!--Default Table-->
    <div class="col-12">
        <div class="card">
            <div class="card-body">

                <h4 class="card-title">Salidas de Dinero</h4>

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
                                                $sql = "SELECT * FROM Caja WHERE Cort = 0 AND ID_Caja_T = 2 ORDER BY ID_Caja DESC ";
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
                                                                echo '<td>'.$caja['ID_Caja'].'</td>';
                                                                echo '<td>'.$tipo['Motivo'].'</td>';//
                                                                echo '<td>'.'$ ' .$caja['Monto'].'</td>';
                                                                echo '<td>'.$caja['Descripcion'].'</td>';
                                                                echo '<td>'.date('d/m/Y g:i a', strtotime($caja['Fecha'])).'</td>';
                                                                echo '<td>'.$user['Nombre'].'</td>';//usuario
                                                                echo '</tr>';  
                                                                $totalcorte = $totalcorte + doubleval ($caja['Monto']);
                                                            }//END USER
                                                        
                                                    }//END Tipo 
                                                   
                                                }//END Caja
                                            ?>
                    </tbody>
                </table>
                <h2>Total: $ <?php echo $totalcorte; ?> </h2>
            </div>
        </div>
    </div>
    <!-- end col -->
    <!--END Default Table-->
</div>
<!-- end row -->

<?php include_once "lib/Footer.php" ?>