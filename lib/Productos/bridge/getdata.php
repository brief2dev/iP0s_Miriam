<?php 
include_once "../../conexion.php";
include_once "../../cnx.php";

$id = $_GET["id_cat"];

$sentencia = $base_de_datos->prepare("SELECT * FROM Categorias WHERE ID_Categoria = ?;");
$sentencia->execute([$id]);
$ciudadano = $sentencia->fetch(PDO::FETCH_OBJ);

if($ciudadano === FALSE){
    echo "¡No existe algún producto con ese ID!";
    //exit();
}else{

?>
<h4 class="modal-title mt-0" id="myExtraLargeModalLabel">Categoria :<?php echo $id; ?> </h4>
<form method="post" action="lib/Productos/Ecategoria.php">
    <div class="row">
        <div class="col-lg-4">
            <div class="form-group">
                <label for="password">Nombre</label>
                <input type="text" class="form-control"
                    value="<?php echo $ciudadano->Nombre; ?>" name="nombre">
                <input type="hidden" name="id" value="<?php echo $ciudadano->ID_Categoria; ?>">
            </div>
        </div>
        <div class="col-lg-4">
            <div class="form-group">
                <label for="password">Descripcion</label>
                <textarea name="descripcion" class="form-control" id="" rows="2"><?php echo $ciudadano->Descripcion; ?></textarea>
            </div>
        </div>  
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="text-right">
                <button type="submit" class="btn btn-primary">Guardar</button>

            </div>
        </div>
    </div>
</form>
<?php
}
?>