<?php
header('Content-Type: text/html; charset=UTF-8');
session_start();
if ($_SESSION['loggedin'] != true){
    header('Location: index.php');
    echo $_SESSION['loggedin'];
}else{
    $page = 'Resurtir';
    include_once "lib/Header.php" ;
}

include_once "lib/conexion.php";
include_once "lib/alerts.php";
$sentencia = $base_de_datos->query("SELECT * FROM Productos;");
$productos = $sentencia->fetchAll(PDO::FETCH_OBJ);
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

                <table id="datatable" class="table table-striped table-bordered dt-responsive nowrap"
                    style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                    <thead>
                        <tr>
                            <th>SKU</th>
                            <th>Codigo</th>
                            <th>Stock</th>
                            <th>Nombre</th>
                            <th>Precio</th>
                            <th>Editar</th>
                            <th>Borrar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($productos as $producto){ ?>
                        <tr>
                            <td><?php echo $producto->ID_Producto ?></td>
                            <td><?php echo $producto->Codigo ?></td>
                            <td><?php echo $producto->Existencia ?></td>
                            <td><?php echo $producto->Nombre ?></td>
                            <td><?php echo $producto->PrecioVenta ?></td>
                            <td><a class="btn btn-warning"
                                    href="<?php echo "PForm.php?id=" . $producto->ID_Producto?>"><i
                                        class="fa fa-edit"></i></a></td>
                            <td> <a id="borrar" class="btn btn-danger"
                                    href="<?php echo "lib/Productos/Borrar_Producto.php?id=" . $producto->ID_Producto?>"><i
                                        class="fa fa-trash"></i></a></td>
                        </tr>
                        <?php } ?>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
    <!-- end col -->
    <!--END Default Table-->
</div>



<?php include_once "lib/Footer.php" ?>