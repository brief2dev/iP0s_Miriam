<?php
header('Content-Type: text/html; charset=UTF-8');
session_start();
if ($_SESSION['loggedin'] != true){
    header('Location: index.php');
    echo $_SESSION['loggedin'];
}else{
    $page = 'Agregar_Producto';
    include_once "lib/Header.php" ;
}

include_once "lib/cnx.php";
include_once "lib/alerts.php";
?>
<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-flex align-items-center justify-content-between">
            <h4 class="page-title mb-0 font-size-18">Productos Nuevos</h4>

            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Productos</a></li>
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
                <h4 class="card-title">Agregar Productos</h4>
                <p class="card-title-desc">Llene todos los datos solicitados para Agregar el Producto, puede usar el
                    lector de codigo de barras.</p>

                <form id="form-horizontal" action="lib/Productos/Guardar.php" method="POST"
                    class="form-horizontal form-wizard-wrapper" enctype="multipart/form-data">
                    <h3>Detalles del Producto</h3>
                    <fieldset>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtFirstNameBilling" class="col-lg-3 col-form-label">Codigo**</label>
                                    <div class="col-lg-9">
                                        <input id="txtFirstNameBilling" name="codigop" autofocus type="text"
                                            class="form-control" required>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtLastNameBilling" class="col-lg-3 col-form-label">Nombre**</label>
                                    <div class="col-lg-9">
                                        <input id="txtLastNameBilling" name="nombrep" type="text" class="form-control"
                                            required>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtAddress1Billing" class="col-lg-3 col-form-label">Descripcion</label>
                                    <div class="col-lg-9">
                                        <textarea id="txtAddress1Billing" name="descrip" rows="4"
                                            class="form-control"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtAddress2Billing" class="col-lg-3 col-form-label">Foto</label>
                                    <div class="col-lg-9">
                                        <div class="fallback">
                                            <input name="fotop" type="file" multiple="multiple">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtCityBilling" class="col-lg-3 col-form-label">Proveedor**</label>
                                    <div class="col-lg-9">
                                        <select name="provedor" class="form-control" id="" required>
                                            <option value="" disabled selected>Selecciona</option>
                                            <?php
                                                $sqlpro = "SELECT * FROM Proveedores ";
                                                $querypro = $conexion -> query ($sqlpro);
                                                while($prov = mysqli_fetch_array($querypro)){
                                                    echo '<option value="'.$prov['ID_Proveedor'].'" >'.$prov['NEmpresa'].'</option>';
                                                }
                                                
                                            ?>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtStateProvinceBilling" class="col-lg-3 col-form-label">Stock**</label>
                                    <div class="col-lg-9">
                                        <input id="txtStateProvinceBilling" name="stockp" type="text"
                                            class="form-control" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtCityBilling" class="col-lg-3 col-form-label">Sucursal**</label>
                                    <div class="col-lg-9">
                                        <select name="sucursal" class="form-control" id="" required>
                                            <option value="" disabled selected>Selecciona</option>
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
                                    <label for="txtStateProvinceBilling"
                                        class="col-lg-3 col-form-label">Categoria**</label>
                                    <div class="col-lg-9">
                                        <select name="categoria" class="form-control" id="" required>
                                            <option value="" disabled selected>Selecciona</option>
                                            <?php
                                                $sqlcat = "SELECT * FROM Categorias";
                                                $querycat = $conexion -> query ($sqlcat);
                                                while($cayegori = mysqli_fetch_array($querycat)){
                                                    echo '<option value="'.$cayegori['ID_Categoria'].'" >'.$cayegori['Nombre'].'</option>';
                                                }
                                            ?>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <h3>Detalles de Venta</h3>
                    <fieldset>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtFirstNameShipping" class="col-lg-3 col-form-label">Precio de
                                        Compra</label>
                                    <div class="col-lg-9">
                                        <input id="txtFirstNameShipping" name="presiocp" type="text"
                                            class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group row">
                                    <label for="txtLastNameShipping" class="col-lg-3 col-form-label">Precio al
                                        publico**</label>
                                    <div class="col-lg-9">
                                        <input id="txtLastNameShipping" name="preciovp" type="text" class="form-control"
                                            required>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <br><br>
                    <center>
                        <button type="submit" class="btn btn-success mt-3 mt-lg-6 mdi mdi-content-save-settings"> Guardar en Inventario</button>
                    </center>

                </form>

            </div>
        </div>
    </div>
</div>
<!-- end row -->






<?php include_once "lib/Footer.php" ?>