<?php
header('Content-Type: text/html; charset=UTF-8');
//Iniciar una nueva sesión o reanudar la existente.
session_start();
//Si existe la sesión "cliente"..., la guardamos en una variable.
if ($_SESSION['loggedin'] != true){
    header('Location: index.php');//Aqui lo redireccionas al lugar que quieras.
    echo $_SESSION['loggedin'];
}else{
    $page = 'Cliente Nuevo'; 
    include_once "lib/Header.php";
}

include_once "lib/alerts.php";
include_once "lib/cnx.php";

?>
<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-flex align-items-center justify-content-between">
            <h4 class="page-title mb-0 font-size-18">Nuevos Clientes</h4>

            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Cliente</a></li>
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
                <h4 class="card-title">Cliente Nuevo</h4>

                <form id="form-horizontal" action="lib/Clientes/Guardar.php" method="POST"
                    class="form-horizontal form-wizard-wrapper" enctype="multipart/form-data">
                    <h3>Datos de la persona</h3>
                    <fieldset>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtFirstNameBilling" class="col-lg-3 col-form-label">Nombres**</label>
                                    <div class="col-lg-9">
                                        <input id="txtFirstNameBilling" name="nomclie" placeholder="Juan Carlos"
                                            type="text" class="form-control" required>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtLastNameBilling" class="col-lg-3 col-form-label">Apellidos**</label>
                                    <div class="col-lg-9">
                                        <input id="txtLastNameBilling" name="apellidoclie" type="text"
                                            placeholder="Lopez Cruz" class="form-control" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtFirstNameBilling" class="col-lg-3 col-form-label">Correo</label>
                                    <div class="col-lg-9">
                                        <input id="txtFirstNameBilling" name="correoclie" type="text"
                                            class="form-control" placeholder="example@example.com">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtLastNameBilling" class="col-lg-3 col-form-label">Telefono</label>
                                    <div class="col-lg-9">
                                        <input id="txtLastNameBilling" name="telclie" type="text"
                                            placeholder="9999999999" class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtFirstNameBilling" class="col-lg-3 col-form-label">Direccion**</label>
                                    <div class="col-lg-9">
                                        <input id="txtFirstNameBilling" name="dirclie"
                                            placeholder="Calle, Cruzamientos, Localidad" type="text"
                                            class="form-control" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </fieldset>

                    <fieldset>

                    </fieldset>
                    <h3>Confirmar</h3>
                    <fieldset>
                        <div class="p-3">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" name="checkp" value="1" class="custom-control-input" id="customCheck1">
                                <label class="custom-control-label" for="customCheck1">Usuario Premium.</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtLastNameBilling" class="col-lg-3 col-form-label">Monto de credito</label>
                                    <div class="col-lg-9">
                                        <input id="txtLastNameBilling" name="montocredito" type="text" placeholder="000.00"
                                            class="form-control" >
                                    </div>
                                </div>
                            </div>
                    </fieldset>
                    <br><br>
                    <center>
                        <button type="submit" class="btn btn-success mt-3 mt-lg-0">Guardar Informacion</button>
                    </center>

                </form>

            </div>
        </div>
    </div>
</div>
<!-- end row -->






<?php include_once "lib/Footer.php" ?>