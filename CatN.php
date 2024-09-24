<?php
header('Content-Type: text/html; charset=UTF-8');
session_start();
if ($_SESSION['loggedin'] != true){
    header('Location: index.php');
    echo $_SESSION['loggedin'];
}else{
    $page = 'Categorias';
    include_once "lib/Header.php" ;
}

include_once "lib/cnx.php";
include_once "lib/alerts.php";

?>
<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-flex align-items-center justify-content-between">
            <h4 class="page-title mb-0 font-size-18">Categorias</h4>

            <div class="page-title-right">
                <ol class="breadcrumb m-0">
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
                <h4 class="card-title">Vea y Cree nuevas Categorias</h4>

                <form id="form-horizontal" action="lib/Productos/Ncategoria.php" method="POST"
                    class="form-horizontal form-wizard-wrapper">
                    <h3>Nuevo Categoria</h3>
                    <fieldset>
                        <div class="row">
                            <div class="col-md-9">
                                <div class="form-group row">
                                    <label for="txtFirstNameBilling" class="col-lg-3 col-form-label">Escriba el Nombre**</label>
                                    <div class="col-lg-9">
                                        <input id="txtFirstNameBilling" name="ncat" placeholder="Blusas, Pantalones, perfumes, etc" type="text" class="form-control"
                                            required>
                                    </div>
                                </div>
                            </div>
                             
                        </div>

                        <div class="row">
                            <div class="col-md-9">
                                <div class="form-group row">
                                    <label for="txtAddress1Billing" class="col-lg-3 col-form-label">Descripcion</label>
                                    <div class="col-lg-9">
                                        <textarea id="txtAddress1Billing" name="descr" rows="4" class="form-control"
                                            maxlength="750" ></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                            </div>
                        </div>
                    </fieldset>
                    <br><br>
                    <center>
                        <button type="submit" class="btn btn-success mt-3 mt-lg-0">Guardar</button>
                    </center>
                    
                </form>

            </div>
        </div>
    </div>

    <Center>
        <h3>Lista de Categorias</h3>
    </Center>
    <!--Default Table-->
    <div class="col-12">
        <div class="card">
            <div class="card-body">

                <table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap"
                    style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Descripcion</th>
                            <th>Opciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php 
                                                //obtiene los datos de la caja
                                                $sql = "SELECT * FROM Categorias ";
                                                $query = $conexion -> query ($sql);
                                                while($cat = mysqli_fetch_array($query)){
                                                    echo '<tr>';
                                                                echo '<td>'.$cat['ID_Categoria'].'</td>';
                                                                echo '<td>'.$cat['Nombre'].'</td>';//
                                                                echo '<td>'.$cat['Descripcion'].'</td>';
                                                                echo '<td> 
                                                                        <div onClick="modalphp('.$cat['ID_Categoria'].')" class="btn btn-primary"><i class="fa fa-edit"></i></div>
                                                                    </td>';
                                                    echo '</tr>';  
                                                   
                                                }//END Caja
                                            ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- end col -->
    <!--END Default Table-->
      <!--  Modal content -->
    <div class="modal fade bs-example-modal-xl" id="modal-blitz" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                 <!--Modal Head-->
                    <!--Codigo que tu quieras aqui-->
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!--Modal Body-->
                    <!--Codigo que tu quieras aqui-->
                    <div id="conte-modal">
                    <!--API Blitz para cargar sin ajax-->
                    </div>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
    <script>
        function modalphp(modal) {
            var options = {
                modal: true,
                height: 300,
                width: 600
            };

            var url = 'lib/Productos/bridge/getdata.php?id_cat=' + modal;
            $('#conte-modal').load(url, function() {
                console.log(url);
                $('#modal-blitz').modal({
                    show: true
                });
            });
            
        }
    </script>

</div>
<!-- end row -->






<?php include_once "lib/Footer.php" ?>