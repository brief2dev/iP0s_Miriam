<?php
header('Content-Type: text/html; charset=UTF-8');
session_start();
if ($_SESSION['loggedin'] != true){
    header('Location: index.php');
    echo $_SESSION['loggedin'];
}else{
    $page = 'Nueva Empresa';
    include_once "lib/Header.php" ;
}

include_once "lib/conexion.php";
include_once "lib/cnx.php"; 
include_once "lib/alerts.php";
?>

<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-flex align-items-center justify-content-between">
            <h4 class="page-title mb-0 font-size-18">Crear Empresa</h4>

            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Nuevo</a></li>
                    <li class="breadcrumb-item active">Empresa</li>
                </ol>
            </div>

        </div>
    </div>
</div>
<!-- end page title -->

<!-- start row -->
<div class="row">

    <div class="col-md-12 col-xl-9">
        <div class="card">
            <div class="card-body">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs nav-tabs-custom nav-justified" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#settings" role="tab">
                            <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span>
                            <span class="d-none d-sm-block">Datos de Empresa</span>
                        </a>
                    </li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content p-3 text-muted">
                    <div class="tab-pane active" id="settings" role="tabpanel">
                        <!------------------------------------------------------------>
                        <form method="post" action="lib/Empresa/Guardar.php" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group mb-0">
                                        <label for="firstname">Nombre</label>
                                        <input type="text" value="" name="nombre" required class="form-control" id="firstname"
                                            placeholder="nombre de la tienda">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group mb-0">
                                        <label for="lastname">RFC</label>
                                        <input style="text-transform: uppercase;" type="text" value="" name="rfc" required class="form-control" id="lastname"
                                            placeholder="RFC">
                                    </div>
                                </div> <!-- end col -->
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group mb-0">
                                        <label for="firstname">Direccion</label>
                                        <input type="text" value="" name="direccion" required class="form-control" id="firstname"
                                            placeholder="Direccion">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group mb-0">
                                        <label for="lastname">Municipio</label>
                                        <input type="text" value="" name="muni" required class="form-control" id=""
                                            placeholder="Ejemplo: Ticul, Yuc.">
                                    </div>
                                </div> <!-- end col -->
                            </div>
                            <br>
                            <div class="row ">
                                <div class="col-md-6">
                                    <div class="form-group mb-0">
                                        <label for="firstname">Colonia</label>
                                        <input type="text" value="" name="colonia" required class="form-control" id="firstname"
                                            placeholder="Colonia">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group mb-0">
                                        <label for="lastname">CP</label>
                                        <input type="text" value="" name="cp" required class="form-control" id="lastname"
                                            placeholder="Codigo Postal">
                                    </div>
                                </div>
                            </div> <!-- end col -->
                            <br>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group mb-0">
                                        <label for="firstname">Telefono</label>
                                        <input type="text" value="" name="telefono" required class="form-control" id="firstname"
                                            placeholder="telefono de la tienda">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group mb-0">
                                        <label for="lastname">Correo</label>
                                        <input type="text" value="" name="correo" class="form-control" id="lastname"
                                            placeholder="correo de la empresa">
                                    </div>
                                </div> <!-- end col -->
                            </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group mb-0">
                                <label for="useremail">Gerente (Propietario)</label>
                                <input type="text" value="" name="gerente" required class="form-control" id="useremail"
                                    placeholder="Propietario">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group mb-0">
                                <label for="userpassword">Beneficiario</label>
                                <input type="text" value="" name="bene" class="form-control" id="userpassword"
                                    placeholder="Beneficiario">
                            </div>
                        </div>
                    </div> <!-- end col -->
                    <br>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group mb-0">
                                <label for="useremail">Banco</label>
                                <input style="text-transform: uppercase;" type="text" value="" name="banco" class="form-control" id="useremail"
                                    placeholder="Banco">
                            </div>
                        </div>
                        <br>
                        <div class="col-md-6">
                            <div class="form-group mb-0">
                                <label for="userpassword">Clabe</label>
                                <input type="text" class="form-control" id="userpassword" name="clabe"
                                    placeholder="Clabe Interbancaria">
                            </div>
                        </div>
                        <br>
                        <br>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="userpassword"></label><br>
                                <label for="userpassword">Logo</label><br>
                                <input name="logo" required type="file" multiple="multiple">
                            </div>
                        </div><!-- end col -->
                    </div>
                    <center><br><input class="btn btn-info" type="submit" value="Guardar"></center>

                    </form>
                    <!------------------------------------------------------------>
                </div>
                <!--End Setting-->
            </div>
        </div>
    </div>
</div>
</div>

<!-- end row -->
<?php include_once "lib/Footer.php" ?>