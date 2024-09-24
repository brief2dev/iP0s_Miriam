<?php
header('Content-Type: text/html; charset=UTF-8');
session_start();
if ($_SESSION['loggedin'] != true){
    header('Location: index.php');
    echo $_SESSION['loggedin'];
}else{
    $page = 'Agrega_Personal';
    include_once "lib/Header.php" ;
}

include_once "lib/cnx.php";
include_once "lib/alerts.php";
?>
<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-flex align-items-center justify-content-between">
            <h4 class="page-title mb-0 font-size-18">Personal</h4>

            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Personal</a></li>
                    <li class="breadcrumb-item active">Agregar</li>
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
                <h4 class="card-title">Agregar Personal</h4>
                <p class="card-title-desc">Llene todos los datos solicitados para Agregar un nuevo usuario.</p>

                <form id="form-horizontal" action="lib/Personal/Guardar.php" method="POST"
                    class="form-horizontal form-wizard-wrapper" enctype="multipart/form-data">
                    <h3>Datos de la persona</h3>
                    <fieldset>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtFirstNameBilling" class="col-lg-3 col-form-label">Nombre**</label>
                                    <div class="col-lg-9">
                                        <input id="txtFirstNameBilling" name="nombreus" type="text" class="form-control"
                                            required>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtLastNameBilling" class="col-lg-3 col-form-label">Apellido**</label>
                                    <div class="col-lg-9">
                                        <input id="txtLastNameBilling" name="apellidous" type="text"
                                            class="form-control" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtFirstNameBilling" class="col-lg-3 col-form-label">Correo</label>
                                    <div class="col-lg-9">
                                        <input id="txtFirstNameBilling" name="correous" type="text" class="form-control" >
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtLastNameBilling" class="col-lg-3 col-form-label">Telefono</label>
                                    <div class="col-lg-9">
                                        <input id="txtLastNameBilling" name="telefonous" type="text"
                                            class="form-control" >
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtAddress2Billing" class="col-lg-3 col-form-label">Foto</label>
                                    <div class="col-lg-9">
                                        <div class="fallback">
                                            <input name="fotous" type="file" multiple="multiple">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtAddress2Billing" class="col-lg-3 col-form-label">Direccion</label>
                                    <div class="col-lg-9">
                                        <div class="">
                                            <input name="dir" class="form-control" type="text" value="" placeholder="Direccion">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <h3>Detalles de Empresa</h3>
                    <fieldset>
                        <div class="row"> 
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtFirstNameShipping" class="col-lg-3 col-form-label">Sucursal</label>
                                    <div class="col-lg-9">
                                        <select name="sucus" class="form-control" id="cars" required>
                                            <option value="'" selected disabled >Selecciona</option>
                                            <?php
                                                $sqlsuc = "SELECT * FROM Sucursales WHERE visible = 1";
                                                $querysuc = $conexion -> query ($sqlsuc);
                                                    while($sucursal = mysqli_fetch_array($querysuc)){
                                                    echo '<option value="'.$sucursal['ID_Sucursal'].'" >'.$sucursal['Nombre'].'</option>';
                                                    }
                                            ?>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtLastNameShipping" class="col-lg-3 col-form-label">Puesto</label>
                                    <div class="col-lg-9">
                                        <select name="puesus" class="form-control" id="cars" required>
                                            <option value="'" selected disabled >Selecciona</option>
                                            <?php
                                                $sqlpu = "SELECT * FROM Puestos WHERE ID_Puesto = 3 || ID_Puesto = 4";
                                                $querypu = $conexion -> query ($sqlpu);
                                                    while($puesto = mysqli_fetch_array($querypu)){
                                                    echo '<option value="'.$puesto['ID_Puesto'].'" >'.$puesto['Cargo'].'</option>';
                                                    }
                                            ?>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <!--                                         <h3>Confirmar</h3>
                                        <fieldset>
                                            <div class="p-3">
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" id="customCheck1">
                                                    <label class="custom-control-label" for="customCheck1">I agree with the Terms and Conditions.</label>
                                                </div>
                                            </div>
                                        </fieldset> -->
                                        <br>
                                        <br>
                                        <center>
                                            <button type="submit" class="btn btn-success mt-3 mt-lg-0">Guardar</button>
                                        </center>
                    
                </form>

            </div>
        </div>
    </div>
</div>
<!-- end row -->






<?php include_once "lib/Footer.php" ?>