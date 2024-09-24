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
    <!--Default Table-->
    <div class="col-12">
        <div class="card">
            <div class="card-body">

                <h4 class="card-title">Consulte Todos lo Productos</h4>
                <p class="card-title-desc">Puede usar las flechas de cada Celda para filtrar por Fecha, Nombre, Cantidad
                    etc. O bien usar el cuadro de busqueda para filtrar los datos
                </p>

                <table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap"
                    style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                    <thead>
                        <tr>
                            <th>Codigo</th>
                            <th>Nombre</th>
                            <th>Stock Total</th>
                            <th>Ingreso</th>
                            <th>Precio</th>
                            <th>Ult. Modific</th>
                            <th>Opc</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php 
                                                //obtiene los datos del Producto
                                                //$sql = "SELECT * FROM Productos WHERE PrecioCompra = 1 ORDER BY ID_Producto DESC";
                                                $sql = "SELECT * FROM Productos WHERE visto = 0 ORDER BY ID_Producto DESC";
                                                $query = $conexion -> query ($sql);
                                                while($product = mysqli_fetch_array($query)){
                                                    //echo $product['Total'];//-----------------------------
                                                    echo '<tr>';
                                                            echo '<td>'.$product['Codigo'].'</td>';
                                                            echo '<td>'.$product['Nombre'].'</td>';
                                                            echo '<td>'.$product['Existencia'].'</td>';
                                                            echo '<td>'.$product['can'].'</td>';
                                                            echo '<td>'.$product['PrecioVenta'].'</td>';
                                                            echo '<td>'.date('d-m-Y g:i a', strtotime($product['Fecha_Ingreso'])).'</td>';
                                                            echo '<td></td>';
                                                            

                                                            
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