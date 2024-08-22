<?php
header('Content-Type: text/html; charset=UTF-8');
session_start();
if ($_SESSION['loggedin'] != true){
    header('Location: index.php');
    echo $_SESSION['loggedin'];
}else{
    $page = 'Abonos';
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
                    <li class="breadcrumb-item active">Ingreso</li>
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
                <h4 class="card-title">Ingreso a la Caja</h4>
                <p class="card-title-desc">Ingresa el monto y Describe el movimiento</p>

                <form id="form-horizontal" action="lib/Credito/abonar.php" method="POST"
                    class="form-horizontal form-wizard-wrapper">
                    <h3>Detalles del Abono</h3>
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
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtAddress2Billing" class="col-lg-3 col-form-label">Recibo(opc)</label>
                                    <div class="col-lg-9">
                                        <div class="fallback">
                                            <input name="fotop" type="file" multiple="multiple">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <!-- <p><h3>Saldo: $2790.50</h3>     <h3>Contra: $ -2310.50</h3></p>
                                     -->
                    <button type="submit" class="btn btn-success mt-3 mt-lg-0">Guardar</button>
                </form>

            </div>
        </div>
    </div>
</div>
<!-- end row -->






<?php include_once "lib/Footer.php" ?>