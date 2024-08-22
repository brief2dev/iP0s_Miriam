<?php
header('Content-Type: text/html; charset=UTF-8');
session_start();
if ($_SESSION['loggedin'] != true){
    header('Location: index.php');
    echo $_SESSION['loggedin'];
}else{
    $page = 'Precios';
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

            

        </div>
    </div>
</div>
<!-- end page title -->
<!------------------------------------>
<!--ROW 1-->
<div class="row">
    <!--Default Table-->
    <div class="col-12">
        <div class="card">
            <div class="card-body">


                <table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap"
                    style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                    <thead>
                        <tr>
                            <th>Codigo</th>
                            <th>Stock</th>
                            <th>Nombre</th>
                            <th>Descripcion</th>
                            <th>Precio</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php 
                                                //obtiene los datos del Producto
                                                //$sql = "SELECT * FROM Productos WHERE PrecioCompra = 1 ORDER BY ID_Producto DESC";
                                                $sql = "SELECT * FROM Productos WHERE Existencia >= 1 ORDER BY ID_Producto DESC";
                                                $query = $conexion -> query ($sql);
                                                while($product = mysqli_fetch_array($query)){
                                                    //echo $product['Total'];//-----------------------------
                                                    echo '<tr>';
                                                            echo '<td>'.$product['Codigo'].'</td>';
                                                            echo '<td>'.$product['Existencia'].'</td>';
                                                            echo '<td>'.$product['Nombre'].'</td>';
                                                            echo '<td>'.$product['Descripcion'].'</td>';
                                                            echo '<td>'.$product['PrecioVenta'].'</td>';

                                                            
                                                    echo '</tr>';
                                                }
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