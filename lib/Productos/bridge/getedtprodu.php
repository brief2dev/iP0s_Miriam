<?php 
include_once "../../conexion.php";
include_once "../../cnx.php";

$id = $_GET["id_pro"];

$sentencia = $base_de_datos->prepare("SELECT * FROM Productos WHERE ID_Producto = ?;");
$sentencia->execute([$id]);
$ciudadano = $sentencia->fetch(PDO::FETCH_OBJ);

if($ciudadano === FALSE){
    echo "¡No existe algún producto con ese ID!";
    //exit();
}else{

?>
<h4 class="modal-title mt-0" id="myExtraLargeModalLabel"></h4>
<form method="post" action="lib/Productos/edt_vend.php">
    <div class="row">
        <div class="col-lg-4">
            <div class="form-group">
                <label for="password">Nombre</label>
                <input type="text" class="form-control" readonly 
                    value="<?php echo $ciudadano->Nombre; ?>" name="nombre">
                <input type="hidden" name="id" value="<?php echo $ciudadano->ID_Categoria; ?>">
            </div>
        </div>
        <div class="col-lg-4">
            <div class="form-group">
                <label for="password">Codigo</label>
                <input type="text" class="form-control" readonly 
                    value="<?php echo $ciudadano->Codigo; ?>" name="nombre">
            </div>
        </div>  
        <div class="col-lg-4">
            <div class="form-group">
                <label for="password">Stock</label>
                <input type="text" class="form-control" readonly 
                    value="<?php echo $ciudadano->Existencia; ?>" name="nombre">
            </div>
        </div>  
        <div class="col-lg-4">
            <div class="form-group">
                <label for="password">Agregar</label>
                <input type="number" min="1" class="form-control" required
                    value="" name="cantidad">
                    <input type="hidden" value="<?php echo $id?>" name="idp">
            </div>
        </div>  
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="text-right">
                <button type="submit" class="btn btn-primary">Añadir</button>

            </div>
        </div>
    </div>
</form>
<?php
}
?>