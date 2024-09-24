<?php
header('Content-Type: text/html; charset=UTF-8');
session_start();
if ($_SESSION['loggedin'] != true){
    header('Location: index.php');
    echo $_SESSION['loggedin'];
}else{
    $page = 'Inventario_de_Productos';
    include_once "lib/Header.php" ;
}

include_once "lib/cnx.php";
include_once "lib/alerts.php";
?>

<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-flex align-items-center justify-content-between">
            <h4 class="page-title mb-0 font-size-18">Inventario de Productos</h4>

            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Inventario</a></li>
                    <li class="breadcrumb-item active">Productos</li>
                </ol>
            </div>

        </div>
    </div>
</div>
<!-- end page title -->
<!------------------------------------>
<!--ROW 1-->
<div class="row">
    <div class="col-6">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="form-group">
                            <br>
                            <Center>
                                <label class="control-label">Selecciona una Categoria</label>
                                <select name="cat" id="cat1" class="form-control" required="required">
                                    <option value="" disabled selected>Seleccionar..</option>
                                    <option value="all">TODAS</option>
                                    <?php
                                        $nombrecirc="SELECT * FROM Categorias";
                                        $resulcirc = $conexion -> query($nombrecirc);
                                        while ($circuito = mysqli_fetch_array($resulcirc)) {               
                                            echo '<option value="'.$circuito['ID_Categoria'].'">'.$circuito['Nombre'].'</option>';
                                        } 
                                    ?>
                                </select>
                            </Center>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="form-group">
                            <br>
                            <Center>
                                <button id="apxch1" role="button" class="btn btn-success">Consultar
                                    <i class="mdi mdi-file-excel"></i></button>
                            </Center>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end row -->

<!-- TABLAS-->
<div class="row" id="tablas">
    <!-- se carga las tablas desde la api mediante el js -->
    <?php 
    $id = $_GET["id_cat"];
        if(!empty($id)){
                            echo'
                                <div class="container">
                                    <div class="loaderss" id="load"></div>
                                </div>
                                <div class="col-12" id="tabl">
                            <div class="card">
                                <div class="card-body">
                                    <table id="datatable-buttons"
                                        class="table table-striped table-bordered dt-responsive nowrap"
                                        style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                        <thead>
                                            <tr>
                                                <th>Codigo</th>
                                                <th>Stock</th>
                                                <th>Nombre</th>
                                                <th>Categoria</th>
                                                <th>Fecha Modificacion</th>
                                                <th>Observaciones</th>
                                            </tr>
                                        </thead>

                                        <tbody>';


                                                echo '<script> function showload() {
                                                    var x = document.getElementById("tabl");
                                                    var pre = document.getElementById("load");
                                                    if (pre.style.display === "none") {
                                                        pre.style.display = "block";
                                                        x.style.display = "none";
                                                    } else {
                                                        x.style.display = "none";
                                                        pre.style.display = "block";
                                                    }
                                                }';
                                                echo "showload();";
                                                echo "</script>";
                                                if($id == "all"){
                                                    $sqltable = "SELECT * FROM Productos ";
                                                }else{
                                                    $sqltable = "SELECT * FROM Productos WHERE ID_Categoria = ".$id;
                                                }
                                                $resulctable = $conexion -> query($sqltable);
                                                while ($lectura = mysqli_fetch_array($resulctable)){
                                                    $sqlca = "SELECT * FROM Categorias WHERE ID_Categoria = ".$lectura['ID_Categoria'];
                                                    $queryca = $conexion -> query($sqlca);
                                                    $catt = mysqli_fetch_array($queryca);
                                                   echo'
                                                        <tr>
                                                            <td>'.$lectura['Codigo'].'</td>
                                                            <td>'.$lectura['Existencia'].'</td>
                                                            <td>'.$lectura['Nombre'].'</td>
                                                            <td>'.$catt['Nombre'].'</td>
                                                            <td>'.date('d-m-Y g:i a', strtotime($lectura['Fecha_Ingreso'])).'</td>
                                                            <td></td>
                                                        </tr>
                                                    ';
                                                }
                                                echo '<script> function hideload() {
                                                        var x = document.getElementById("tabl");
                                                        var pre = document.getElementById("load");
                                                        if (x.style.display === "none") {
                                                            x.style.display = "block";
                                                            pre.style.display = "none";
                                                        } else {
                                                            x.style.display = "none";
                                                        }
                                                    }';
                                                echo "hideload();";
                                                echo "</script>";
    ?>
    <?php
                                            echo'
                        </tbody>
                        </table>
                    </div>
                </div>
            </div>';

            }
    ?>
    <!-- se carga las tablas desde la api mediante el js -->
</div>
<!-- END TABLAS-->
<?php include_once "lib/Footer.php" ?>

<script>
var boton1 = document.getElementById("apxch1");
boton1.onclick = function(e) {
    var cat = $("#cat1").val();
    //var cattexto = $("#cat1").find('option:selected').text();
    location.href = "Pint.php?id_cat=" + cat;
        texto;
    //window.top.document.title = texto;
};
</script>