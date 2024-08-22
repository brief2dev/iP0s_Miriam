<?php 
header('Content-Type: text/html; charset=UTF-8');
session_start();
if ($_SESSION['loggedin'] != true){
    header('Location: index.php');
    echo $_SESSION['loggedin'];
}else{
    $page = 'Devolucion';
    include_once "lib/Header.php" ;
}

include_once "lib/cnx.php";
include_once "lib/alerts.php";

if(!isset($_SESSION["dev"])) $_SESSION["dev"] = [];
if(!isset($_SESSION["cam"])) $_SESSION["cam"] = [];
$granTotal = 0;
$articulos = 0;

$Pdevolucion = 0;
$Pcambio = 0;
$diferencia = 0;
?>

<div class="row">

    <div class="col-12">
        <div class="page-title-box d-flex align-items-center justify-content-between">
            <h4 class="page-title mb-0 font-size-18">Cambios o Devoluciones</h4>
            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Ventas</a></li>
                    <li class="breadcrumb-item active">Cambios</li>
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
                <h4 class="card-title mb-4">Producto a Devolver</h4>

                <?php
			                            if(isset($_GET["status"])){
				                            if($_GET["status"] === "1"){
					                        ?>
                <div class="alert alert-success">
                    <strong>¡Correcto!</strong> Cambio realizada correctamente
                </div>
                <?php
				                }else if($_GET["status"] === "2"){
					                ?>
                <div class="alert alert-info">
                    <strong>Cambios cancelada</strong>
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
                <form method="post" action="lib/Ventas/devo.php">
                    <div data-repeater-list="group-a">
                        <!--Row-->
                        <div data-repeater-item class="row">
                            <!--COdigo-->
                            <div class="form-group col-lg-3">
                                <label for="Codigo">Código de barras:</label>
                                <input autocomplete="off" autofocus class="form-control" name="Codigo" id="Codigo"
                                    placeholder="Escribe el código" required>
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
                        <?php foreach($_SESSION["dev"] as $indice => $producto){ 
                                                $Pdevolucion += $producto->total    
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
                                    href="<?php echo "lib/Ventas/carrito_del_dev.php?indice=" . $indice?>"><i
                                        class="fa fa-trash"></i></a></td>
                        </tr>
                        <?php } ?>
                    </tbody>
                </table>
                <!--END Tabla-->
                <!----------------------------------------------------------->


                <!----------------------------------------------------------->
                <!--Formulario 2-->
                <h4 class="card-title mb-4">Producto a Cambiar</h4>
                <form method="post" action="lib/Ventas/cambio.php">
                    <div data-repeater-list="group-a"> 
                        <!--Row-->
                        <div data-repeater-item class="row">
                            <!--COdigo-->
                            <div class="form-group col-lg-3">
                                <label for="Codigo">Código de barras:</label>
                                <input autocomplete="off" autofocus class="form-control" name="Codigos" id="Codigos"
                                    placeholder="Escribe el código" required>
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
                        <?php foreach($_SESSION["cam"] as $indice1 => $producto1){ 
                                                $Pcambio += $producto1->total    
                                                ?>
                        <tr>
                            <td><?php echo $producto1->ID_Producto ?></td>
                            <td><?php echo $producto1->Codigo ?></td>
                            <td><?php echo $producto1->Descripcion ?></td>
                            <td><?php echo $producto1->PrecioVenta ?></td>
                            <td><?php $articulos1 = $articulos1 + $producto1->Cantidad;
                                                 echo $producto1->Cantidad  ?></td>
                            <td><?php echo $producto1->total ?></td>
                            <td><a class="btn btn-danger"
                                    href="<?php echo "lib/Ventas/carrito_del_cam.php?indice=" . $indice1?>"><i
                                        class="fa fa-trash"></i></a></td>
                        </tr>
                        <?php } ?>
                    </tbody>
                </table>
                <!--END Tabla-->
                <!----------------------------------------------------------->
                <form class="repeater" enctype="multipart/form-data">

                </form>
                <!----------------------------------------------------------->
                <br>
                <br>
                <!-- <h3>Total: $ <php echo $granTotal; ?></h3> -->
                <h3><?php 
                $diferencia = $Pcambio - $Pdevolucion;
                                        //echo $diferencia; 
                if ($diferencia < 0) {
                    echo "Saldo en Contra: $ ".$diferencia; 
                }else{
                     echo "Saldo a Favor: $ ".$diferencia;
                }
                                        
                                    ?>
                </h3>
<br><br>
                <form action="./lib/Ventas/Guardar_Dev.php" id="venta" name="venta" method="POST">
                    <!-- <form action="test.php" method="POST"> -->

                    <div data-repeater-list="group-a"> 
                        <div data-repeater-item class="row">
                            <div class="form-group col-lg-2">
                                <label for="name">Caja</label>
                                <input type="text" id="lname" class="form-control" name="caja"
                                    value="<?php echo $_SESSION['username']; ?>" disabled>
                                <input type="hidden" name="articulos" value=<?php echo $articulos; ?> />
                            </div>
                            <div class="form-group col-lg-2">
                                <label for="name">Vendedor</label>
                                <select id="Vendedr" name="vendedor" class="form-control" required>
                                    <option value="" disabled selected>Selecciona</option>
                                    <?php 
                                                $sql = "SELECT ID_Personal, Nombre FROM Personal WHERE ID_Puesto = 3 OR ID_Puesto = 4";
                                                $query = $conexion -> query ($sql);
                                                    while($valores = mysqli_fetch_array($query)){
                                                        echo "<option value='".$valores['ID_Personal']."'>".$valores['Nombre']."</option>";
                                                         }
                                            ?>
                                </select>
                            </div>
                            <div class="form-group col-lg-2">
                                <label for="email">Cliente</label>
                                <select id="Cliente" class="form-control" name="cliente" required>
                                    <!-- <option value="" disabled selected>Selecciona una opción</option> -->
                                    <?php 
                                                $sql = "SELECT ID_Cliente, Nombres FROM Clientes";
                                                $query = $conexion -> query ($sql);
                                                    while($valores = mysqli_fetch_array($query)){
                                                        echo "<option value='".$valores['ID_Cliente']."'>".$valores['Nombres']."</option>";
                                                         }
                                            ?>
                                </select>
                            </div>
                            <div class="form-group col-lg-2">
                                <label for="email">Medio de Pago</label>
                                <select id="MedioPago" name="mediopago" class="form-control">
                                    <?php 
                                            $sql = "SELECT * FROM Medio_Pago";
                                            $query = $conexion -> query ($sql);
                                                while($valores = mysqli_fetch_array($query)){
                                                    echo "<option value='".$valores['ID_Medio']."'>".$valores['Tipo']."</option>";
                                                    }
                                        ?>
                                </select>
                            </div>
                            <div class="form-group col-lg-2">
                                <label for="email">Destino</label>
                                <select id="Destino" name="destino" class="form-control" required>
                                    <option value="4" selected>Cambio</option>
                                </select>
                            </div>
                            <div class="form-group col-lg-2">
                                <label for="message">Comentarios</label>
                                <textarea id="Comentarios" name="coment" class="form-control"
                                    maxlength="200">Cambios de Producto</textarea>
                            </div>
                        </div>
                    </div>
                    <!--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
                    <div data-repeater-list="group-a">
                        <div data-repeater-item class="row">
                            <input class="subtotal" id="Sub" name="Subtotal" type="hidden" value="<?php echo $diferencia;?>">
                            <input class="" id="" name="tipocambio" type="hidden" value="1">

                            <!----------------Descuento por Cantidad----------------->
                            <div class="form-group col-lg-2">
                                <label for="email">% Descuento % </label>
                                <input type="text" id="lname" class="form-control descporcentaje"
                                    name="descueporcentaje" value="0" placeholder="0.0" onkeyup="descuento();">
                            </div>
                            <script>
                            function descuento() {
                                var sub = ($(".subtotal").val());
                                var descpeso = ($(".descporcentaje").val());
                                var totals = 0;
                                var des = 0;
                                des = sub * (descpeso / 100);
                                totals = sub - des;
                                document.venta.descuentoss.value = des;
                                document.venta.totall.value = totals;
                            }
                            </script>


                            <div class="form-group col-lg-2">
                                <label for="name">$ Descuento $</label>
                                <input type="text" id="Camo" class="form-control" name="descuentoss" value="0"
                                    placeholder="0.0" readonly>
                            </div>
                            <div class="form-group col-lg-2">
                                <label for="name">Total $ </label>
                                <input type="text" id="Cambio" class="form-control tot" name="totall"  value="<?php echo $diferencia;?>"
                                    placeholder="0.0" readonly>
                            </div>

                            <!----------------Efectivo Entregado----------------->
                            <div class="form-group col-lg-2">
                                <label for="name">Efectivo $</label>
                                <input type="text" id="Efectivo" class="form-control efectiv" required name="efectivo"
                                    value="" placeholder="0.0" onkeyup="rst();">
                            </div>
                            <script>
                            function rst() {
                                var sub = ($(".tot").val());
                                if ($(".tot").val() == 0) {
                                    sub = ($(".subtotal").val());
                                }
                                var efectivo = ($(".efectiv").val());
                                var cambio = 0;
                                cambio = efectivo - sub;
                                document.venta.fcambio.value = cambio;
                            }
                            </script>

                            <!----------------Cambio----------------->
                            <div class="form-group col-lg-2">
                                <label for="name">Cambio $ </label>
                                <input type="text" id="Cambio" class="form-control" name="fcambio" value=""
                                    placeholder="0.0" readonly>
                            </div>

                        </div>
                    </div>

                    <br>
                    <!-- <h3>Total: $</h3> -->
                    <br>
                    <center>
                        <button type="submit" class="btn btn-success mt-3 mt-lg-0">Aceptar </button>
                        <a href="./lib/Ventas/Cancela_Dev.php" class="btn btn-danger">Cancelar </a>
                    </center>
                </form>

                <!------------------------------------------------------------>
            </div>
        </div>

    </div>
</div>
<!-- end row -->
<?php include_once "lib/Footer.php" ?>