<?php
header('Content-Type: text/html; charset=UTF-8');
session_start();
if ($_SESSION['loggedin'] != true){
    header('Location: index.php');
    echo $_SESSION['loggedin'];
}else{
    $page = 'Editar_Producto';
    include_once "lib/Header.php" ;
}

if(!isset($_GET["id"])) exit();
$id = $_GET["id"];
$ven = $_GET["ven"];
include_once "lib/conexion.php";
include_once "lib/alerts.php";
$sentencia = $base_de_datos->prepare("SELECT * FROM Productos WHERE ID_Producto = ?;");
$sentencia->execute([$id]);
$producto = $sentencia->fetch(PDO::FETCH_OBJ);
if($producto === FALSE){
	echo "¡No existe algún producto con ese ID!";
	exit();
}

?>
<div class="row">
    <div class="col-6">
        <div class="card">
            <!--------------------------------->
            <div class="card-body">
                <div class="col-xs-6">
                    <br>
                    <br>
                    <h2>Cambios en el Producto con ID: <?php echo $producto->ID_Producto; ?></h2>
                    <br>
                    <br>
                    <Center>
                        <img src="<?php echo $producto->Foto; ?>" alt="" class="rounded-circle" width="300"
                            height="300">
                    </Center>
                    <br>
                    <form method="post" action="lib/Productos/Editar_Producto.php" enctype="multipart/form-data">
                        <input type="hidden" name="id" value="<?php echo $producto->ID_Producto; ?>">

                        <Center><label for="userpassword">Foto del Producto </label>
                            <br>
                            <input name="profotos" type="file" multiple="multiple">
							<input name="rutafoto" type="hidden" value="<?php echo $producto->Foto; ?>">
                            <input name="ven" type="hidden" value="<?php echo $ven; ?>">
                        </Center>
                        <br>

                        <label for="codigo">Código de barras:</label>
                        <input value="<?php echo $producto->Codigo ?>" class="form-control" name="codigo" required
                            type="text" id="codigo" placeholder="Escribe el código">

                        <label for="Nombre">Nombre:</label>
                        <input value="<?php echo $producto->Nombre ?>" class="form-control" name="nombrep" required
                            type="text" id="nombre" placeholder="Nombre del Producto">

                        <label for="descripcion">*Descripción:</label>
                        <textarea id="descripcion" name="descripcion" cols="30" rows="5"
                            class="form-control"><?php echo $producto->Descripcion ?></textarea>

                        <label for="precioVenta">Precio de venta:</label>
                        <input value="<?php echo $producto->PrecioVenta ?>" class="form-control" name="precioVenta"
                            required type="text" id="precioVenta" placeholder="Precio de venta">

                        <label for="precioCompra">Precio de compra:</label>
                        <input value="<?php echo $producto->PrecioCompra ?>" class="form-control" name="precioCompra"
                            required type="text" id="precioCompra" placeholder="Precio de compra">

                        <label for="existencia">*Existencia:</label>
                        <input value="<?php echo $producto->Existencia ?>" class="form-control" name="existencia"
                            required type="text" id="existencia" placeholder="Cantidad o existencia">
                        <label for="existencia">Sucursal:</label>
                        <select name="sucursal" class="form-control" id="" required>
                            <?php
								$sqlsu = "SELECT * FROM Sucursales WHERE ID_Sucursal = ".$producto->ID_Sucursal;
                                $querysu = $conexion -> query ($sqlsu);
								$suuc = mysqli_fetch_array($querysu);
								echo'<option value="'.$suuc['ID_Sucursal'].'" selected>'.$suuc['Nombre'].'</option>';

                                $sqlsuc = "SELECT * FROM Sucursales WHERE Visible = 1 AND ID_Sucursal != ".$producto->ID_Sucursal;
                                $querysuc = $conexion -> query ($sqlsuc);
                                	while($sucursal = mysqli_fetch_array($querysuc)){
                                     echo '<option value="'.$sucursal['ID_Sucursal'].'" >'.$sucursal['Nombre'].'</option>';
                                    }
                             ?>
                        </select>
                         <label for="existencia">Proveedor:</label>
                        <select name="prove" class="form-control" id="" required>
                            <?php
								$sqlpr = "SELECT * FROM Proveedores WHERE ID_Proveedor = ".$producto->ID_Proveedor;
                                $querypr = $conexion -> query ($sqlpr);
								$prove = mysqli_fetch_array($querypr);
								echo'<option value="'.$prove['ID_Proveedor'].'" selected>'.$prove['NEmpresa'].'</option>';

                                $sqlppr = "SELECT * FROM Proveedores WHERE ID_Proveedor != ".$producto->ID_Sucursal;
                                $queryppr = $conexion -> query ($sqlppr);
                                	while($pprov = mysqli_fetch_array($queryppr)){
                                     echo '<option value="'.$pprov['ID_Proveedor'].'" >'.$pprov['NEmpresa'].'</option>';
                                    }
                             ?>
                        </select>

                        <label for="existencia">Categoria:</label>
						<select name="categoria" class="form-control" id="" required>
                            <?php
								$sqlcats = "SELECT * FROM Categorias WHERE ID_Categoria = ".$producto->ID_Categoria;
                                $querycats = $conexion -> query ($sqlcats);
								$cayegoris = mysqli_fetch_array($querycats);
								echo'<option value="'.$cayegoris['ID_Categoria'].'" selected>'.$cayegoris['Nombre'].'</option>';

                                $sqlcat = "SELECT * FROM Categorias WHERE ID_Categoria != ".$producto->ID_Categoria;
                                $querycat = $conexion -> query ($sqlcat);
                                	while($cayegori = mysqli_fetch_array($querycat)){
                                  		echo '<option value="'.$cayegori['ID_Categoria'].'" >'.$cayegori['Nombre'].'</option>';
                                     }
                             ?>
                        </select>



                        <br><br>
                        <center>
                            <input class="btn btn-info" type="submit" value="Guardar Cambios">
                        <a class="btn btn-warning" href="./PRt.php">Cancelar & Volver</a>
                        </center>
                        
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<?php include_once "lib/Footer.php" ?>