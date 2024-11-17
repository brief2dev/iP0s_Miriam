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
$idcup = $_GET['idb'];
$cupval = $_GET['st'];
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
			                	}
				                	?>
                <?php
				                }
			                
                        ?>
                        <?php
			                            if(isset($_GET["status"])){
				                            if($_GET["status"] === "28"){
                                                
					                        ?>
                <div class="alert alert-success">
                    <strong>¡Correcto!</strong> Descuento Aplicado
                </div>
                <?php }}?>
                <!--END Backend-->

                <!--Formulario-->
                <form method="post" action="lib/Ventas/Carrito.php">
                    <div data-repeater-list="group-a">
                        <!--Row-->
                        <div data-repeater-item class="row">
                            <!--COdigo-->
                            <div class="form-group col-lg-4">
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
                <h4>SubTotal: $ <?php echo $granTotal = $granTotal - $cupval;  ?></h4>
                <br><br>
                <form action="./lib/Ventas/Guardar.php" id="venta" name="venta" method="POST">
                    <input type="hidden" name="articulos" value=<?php echo $articulos; ?> />
                    <div data-repeater-list="group-a">
                        <div data-repeater-item class="row">
                            
                            <div class="form-group col-lg-3">
                                <label for="email">Cliente</label>
                                <select id="SLCliente" class="form-control" onchange="if (this.selectedIndex) getpremium();" name="cliente" required>
                                    <option value="5" selected>VENTA GENERAL</option>
                                    <?php 
                                        $idcl = $_GET['ipr'];
                                        if ($idcl != null) {
                                            $sql = "SELECT * FROM Clientes WHERE ID_Cliente = ".$idcl;
                                            $query = $conexion -> query ($sql);
                                            $valores = mysqli_fetch_array($query);
                                            echo "<option selected value='".$valores['ID_Cliente']."'>".$valores['Nombres']." ".$valores['Apellidos']."</option>";

                                            $sqlcl = "SELECT * FROM Clientes WHERE ID_Cliente != ".$idcl;
                                            $querycl = $conexion -> query ($sqlcl);
                                                while($valorescl = mysqli_fetch_array($querycl)){
                                                    echo "<option value='".$valorescl['ID_Cliente']."'>".$valorescl['Nombres']." ".$valorescl['Apellidos']."</option>";
                                                }


                                        }else{
                                            $sql = "SELECT * FROM Clientes WHERE ID_Cliente != 5 AND visible = 1 Order by Nombres ASC";
                                            $query = $conexion -> query ($sql);
                                                while($valores = mysqli_fetch_array($query)){
                                                    echo "<option value='".$valores['ID_Cliente']."'>".$valores['Nombres']." ".$valores['Apellidos']."</option>";
                                                }
                                        }
                                               
                                            ?>
                                </select>
                            </div>
                            <div class="form-group col-lg-2">
                                <label for="name">Vendedor</label>
                                <select id="Vendedr" name="vendedor" class="form-control" required>
                                    <option value="" disabled selected>Selecciona</option>
                                    <?php 
                                                $sql = "SELECT ID_Personal, Nombre FROM Personal WHERE ID_Puesto = 3 OR ID_Puesto = 4 AND Baja = 0 AND visible = 1";
                                                $query = $conexion -> query ($sql);
                                                    while($valores = mysqli_fetch_array($query)){
                                                        echo "<option value='".$valores['ID_Personal']."'>".$valores['Nombre']."</option>";
                                                         }
                                            ?>
                                </select>
                            </div>
                            
                            <div class="form-group col-lg-2">
                                <label for="email">Medio de Pago</label>
                                <select id="MedioPago" name="mediopago" class="form-control">
                                    <?php 
                                            $sql = "SELECT * FROM Medio_Pago WHERE ID_Medio != 3";
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
                                    <option value="" disable selected>Selecciona</option>
                                    <?php 
                                                $sql = "SELECT * FROM Venta_T WHERE ID_Destino != 4";
                                                $query = $conexion -> query ($sql);
                                                    while($valores = mysqli_fetch_array($query)){
                                                        echo "<option value='".$valores['ID_Destino']."'>".$valores['Destino']."</option>";
                                                         }
                                            ?>
                                </select>
                            </div>
                            <div class="form-group col-lg-2">
                                <label for="message">Comentarios</label>
                                <textarea id="Comentarios" name="coment" class="form-control"
                                    maxlength="200"><?php if(!empty($idcup)){echo "Aplicado descuento por: $".number_format($cupval, 2).", vale con folio: ".$idcup.".";} ?></textarea>
                            </div>
                        </div>
                    </div>
                    <!--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
                    <div data-repeater-list="group-a">
                        <div data-repeater-item class="row">
                            <input class="subtotal" id="Sub" name="Subtotal" type="hidden"
                                value="<?php echo $granTotal;?>">

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
                            <script>
                            function descupeso() {
                                var sub = ($(".subtotal").val());
                                var descpeso = ($(".descuentoss").val());
                                var totals = 0;
                                var des = 0;
                                //des = sub * (descpeso / 100);
                                totals = sub - descpeso;
                                document.venta.descuentoss.value = des;
                                document.venta.totall.value = totals;
                            }
                            </script>


                            <div class="form-group col-lg-2">
                                <label for="name">$ Descuento $</label>
                                <input type="text" id="Camo" class="form-control" name="descuentoss" value="0" placeholder="0.0" onkeyup="descupeso();" >
                            </div>
                            <div class="form-group col-lg-2">
                                <label for="name">Total $ </label>
                                <input type="text" id="Cambio" class="form-control tot" name="totall"
                                    value="<?php echo $granTotal;?>" placeholder="0.0" readonly>
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
                            <?php
                                if (!empty($idcl)) {
                                     $sqlcredi = "SELECT * FROM Clientes WHERE ID_Cliente = ".$idcl;
                                    $querycred = $conexion -> query($sqlcredi);
                                    $idpremi = mysqli_fetch_array($querycred);
                                    if ($idpremi['Premium'] == '1') {
                                        echo '
                                        <div class="form-group col-lg-2">
                                            <label for="name">Disponible</label>
                                            <input style="background:#ffc125" type="text" id="Credito" class="form-control" name="fcredito" value="'.$idpremi['Credito'].'"
                                                placeholder="0.0" readonly>
                                        </div>
                                    ';
                                    }
                                }
                               
                                
                             ?>
                            


                        </div>
                    </div>

                    <br>
                    <center>
                        <input type="hidden" id="idcup" name="idcupon" value="<?php echo $idcup;?>">
                        <input type="hidden" id="cupval" value="<?php echo $cupval;?>">
                        <button type="submit" class="btn btn-success mt-3 mt-lg-0">Terminar venta</button>
                        <a href="./lib/Ventas/Cancelar.php" class="btn btn-danger">Cancelar venta</a>


                    </center>
                   
                </form>

                <!------------------------------------------------------------>
            </div>
        </div>

    </div>
</div>
<!-- end row -->
<?php include_once "lib/Footer.php" ?>

<script>

    jQuery(document).ready(function($){
    $(document).ready(function() {
        $('#SLCliente').select2();
    });
});


    function getpremium(){
        var idpre = $('#SLCliente').val();
        /* var idcup = $('#idcup').val();
        var cupval = $('#cupval').val(); */
        location.href = "vender.php?ipr=" + idpre;
    }
</script>