<?php 
header('Content-Type: text/html; charset=UTF-8');
session_start();
if ($_SESSION['loggedin'] != true){
    header('Location: index.php');
    echo $_SESSION['loggedin'];
}else{
    $page = 'Venta';
    include_once "lib/Header.php" ;
}

include_once "lib/cnx.php";
if(!isset($_SESSION["carrito"])) $_SESSION["carrito"] = [];
$granTotal = 0;
$articulos = 0;
?>

<div class="row">

    <div class="col-12">
        <div class="page-title-box d-flex align-items-center justify-content-between">
            <h4 class="page-title mb-0 font-size-18">Registrar Ventas</h4>

            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Ventas</a></li>
                    <li class="breadcrumb-item active">Realiza Venta</li>
                </ol>
            </div>

        </div>
    </div>

</div>
<!-- end page title -->

<div class="row">
    <div class="col-12">

        <div class="card">
            <!--------------------------------->
            <div class="card-body">
                <h4 class="card-title mb-4">Ventas</h4>

                <?php
			                            if(isset($_GET["status"])){
				                            if($_GET["status"] === "1"){
                                                
					                        ?>
                <div class="alert alert-success">
                    <script>
                    function alerta() {
                        swal({
                            title: "Venta realizada!",
                            text: "Imprimir ticket?",
                            type: "success",
                            showCancelButton: !0,
                            confirmButtonColor: "#3b5de7",
                            cancelButtonColor: "#f46a6a"
                        });
                    }
                    alerta();
                    </script>
                    <strong>¡Correcto!</strong> Venta realizada correctamente
                </div>
                <?php
				                }else if($_GET["status"] === "2"){
					                ?>
                <div class="alert alert-info">
                    <strong>Venta cancelada</strong>
                </div>
                <?php
				                 }else if($_GET["status"] === "3"){
					                ?>
                <div class="alert alert-info">
                    <strong>Ok</strong> Producto quitado de la lista
                </div>
                <?php
				                }else if($_GET["status"] === "4"){
					                ?>
                <div class="alert alert-warning">
                    <strong>Error:</strong> El producto que buscas no existe
                    <script>
                    function alerta() {
                        swal({
                            title: "Error al Buscar!",
                            text: "El Producto no Existe",
                            type: "error",
                            showCancelButton: 0,
                            confirmButtonColor: "#3b5de7",
                        });
                    }
                    alerta();
                    </script>
                </div>
                <?php
				                }else if($_GET["status"] === "5"){
					                ?>
                <div class="alert alert-danger">
                    <strong>Error: </strong>El producto está agotado
                </div>
                <?php
				                }else if($_GET["status"] === "6"){
					                ?>
                <div class="alert alert-warning">
                    <strong>Error:</strong> No Selecciono ningun Producto
                </div>
                <?php
			                	}else{
				                	?>
                <div class="alert alert-danger">
                    <strong>Error:</strong> Algo salió mal mientras se realizaba la venta
                </div>
                <?php
				                }
			                }
                        ?>
                <!--END Backend-->

                <!--Formulario-->
                <form method="post" action="lib/Ventas/Carrito.php">
                    <div data-repeater-list="group-a">
                        <!--Row-->
                        <div data-repeater-item class="row">
                            <!--COdigo-->
                            <div class="form-group col-lg-4">
                                <label for="Codigo">Código de barras:</label>
                                <input  autofocus class="form-control" name="Codigo" id="Codigo"
                                    placeholder="Escribe el código" required>
                            </div>
                            <!----------------------------->
                            <div class="form-group col-lg-4">
                                <label for="Cantidad">Cantidad:</label>
                                <input class="form-control" name="Cantidad" id="Cantidad"
                                    placeholder="Grs, Kg" required>
                            </div>
                            <!----------------------------->
                        </div>
                        <!--END Row-->
                    </div>
                </form>
                <!----------------------------------------------------------->
                <!--Tabla-->
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>SKU</th>
                            <th>Código</th>
                            <th>Descripción</th>
                            <th>Precio</th>
                            <th>Cantidad</th>
                            <th>Total</th>
                            <th>Quitar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($_SESSION["carrito"] as $indice => $producto){ 
                                                $granTotal += $producto->total    
                                                ?>
                        <tr>
                            <td><?php echo $producto->ID_Producto ?></td>
                            <td><?php echo $producto->Codigo ?></td>
                            <td><?php echo $producto->Descripcion ?></td>
                            <td><?php echo $producto->PrecioVenta ?></td>
                            <td><?php $articulos = $articulos + $producto->Cantidad;
                                                 echo $producto->Cantidad  ?></td>
                            <td><?php echo $producto->total ?></td>
                            <td><a class="btn btn-danger"
                                    href="<?php echo "lib/Ventas/Carrito_Delete.php?indice=" . $indice?>"><i
                                        class="fa fa-trash"></i></a></td>
                        </tr>
                        <?php } ?>
                    </tbody>
                </table>
                <!--END Tabla-->
                <!----------------------------------------------------------->
                <!----------------------------------------------------------->

                <h5>Articulos: <?php echo $articulos; ?></h5>
                <h4>SubTotal: $ <?php echo $granTotal;  ?></h4>



                <!------------------------------------------------------------>
            </div>
        </div>

    </div>
</div>
<!-- end row -->
<?php include_once "lib/Footer.php" ?>