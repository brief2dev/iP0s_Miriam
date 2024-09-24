<?php
header('Content-Type: text/html; charset=UTF-8');
session_start();
if ($_SESSION['loggedin'] != true){
    header('Location: index.php');
    echo $_SESSION['loggedin'];
}else{
    $page = 'Agregar_Proveedor';
    include_once "lib/Header.php" ;
}

include_once "lib/cnx.php";
include_once "lib/alerts.php";
?>
<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-flex align-items-center justify-content-between">
            <h4 class="page-title mb-0 font-size-18">Proveedores</h4>

            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Proveedor</a></li>
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
                <h4 class="card-title">Agregar Proveedor</h4>
                <p class="card-title-desc">Llene todos los datos solicitados.</p>

                <form id="form-horizontal" action="lib/Proveedores/Guardar.php" method="POST"
                    class="form-horizontal form-wizard-wrapper" enctype="multipart/form-data">
                    <h3>Datos de Contacto</h3>
                    <fieldset>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtFirstNameBilling" class="col-lg-3 col-form-label">Nombre</label>
                                    <div class="col-lg-9">
                                        <input id="txtFirstNameBilling" name="nomprove" type="text" class="form-control"
                                            >
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtAddress2Billing" class="col-lg-3 col-form-label">Foto</label>
                                    <div class="col-lg-9">
                                        <div class="fallback">
                                            <input name="fotoprove" type="file" multiple="multiple">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtFirstNameBilling" class="col-lg-3 col-form-label">Correo</label>
                                    <div class="col-lg-9">
                                        <input id="txtFirstNameBilling" name="correoprove" type="text"
                                            class="form-control" >
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtLastNameBilling" class="col-lg-3 col-form-label">Telefono</label>
                                    <div class="col-lg-9">
                                        <input id="txtLastNameBilling" name="telefonoprove" type="text"
                                            class="form-control"
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">


                        </div>
                    </fieldset>
                    <h3>Detalles de Empresa</h3>
                    <fieldset>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtFirstNameShipping" class="col-lg-3 col-form-label">Nombre*</label>
                                    <div class="col-lg-9">
                                        <input id="txtLastNameBilling" name="nomempre" type="text" class="form-control"
                                            required>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtLastNameShipping" class="col-lg-3 col-form-label">Direccion</label>
                                    <div class="col-lg-9">
                                        <input id="txtLastNameBilling" name="dirempre" type="text" class="form-control"
                                            >
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtFirstNameShipping" class="col-lg-3 col-form-label">Telefono</label>
                                    <div class="col-lg-9">
                                        <input id="txtLastNameBilling" name="telempre" type="text" class="form-control"
                                            >
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtLastNameShipping" class="col-lg-3 col-form-label">correo</label>
                                    <div class="col-lg-9">
                                        <input id="txtLastNameBilling" name="correoempre" type="text"
                                            class="form-control" >
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtFirstNameShipping" class="col-lg-3 col-form-label">Ciudad</label>
                                    <div class="col-lg-9">
                                        <input id="txtLastNameBilling" name="ciudadempre" type="text"
                                            class="form-control" >
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtLastNameShipping" class="col-lg-3 col-form-label">CP</label>
                                    <div class="col-lg-9">
                                        <input id="txtLastNameBilling" name="cpempre" type="text" class="form-control"
                                            >
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtAddress2Billing" class="col-lg-3 col-form-label">Logo</label>
                                    <div class="col-lg-9">
                                        <div class="fallback">
                                            <input name="logoempre" type="file" multiple="multiple">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtLastNameShipping"
                                        class="col-lg-3 col-form-label">Beneficiario</label>
                                    <div class="col-lg-9">
                                        <input id="txtLastNameBilling" name="beneficiario" type="text"
                                            class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtFirstNameShipping" class="col-lg-3 col-form-label">Clabe Interbancaria</label>
                                    <div class="col-lg-9">
                                        <input id="txtLastNameBilling" name="clabe" type="text"
                                            class="form-control" >
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtLastNameShipping" class="col-lg-3 col-form-label">Banco</label>
                                    <div class="col-lg-9">
                                        <input id="txtLastNameBilling" name="banco" type="text" class="form-control"
                                            >
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
                    <button type="submit" class="btn btn-success mt-3 mt-lg-0">Guardar</button>
                </form>

            </div>
        </div>
    </div>
</div>
<!-- end row -->






<?php include_once "lib/Footer.php" ?>