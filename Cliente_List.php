<?php
/* ini_set('display_errors', 1);
ini_set('display_startup_errors', 1); */
header('Content-Type: text/html; charset=UTF-8');
//Iniciar una nueva sesión o reanudar la existente.
session_start();
//Si existe la sesión "cliente"..., la guardamos en una variable.
if ($_SESSION['loggedin'] != true){
    header('Location: index.php');//Aqui lo redireccionas al lugar que quieras.
    echo $_SESSION['loggedin'];
}else{
    $page = 'Clientes';
    include_once "lib/Header.php" ;
}
 
include_once "lib/conexion.php";
include_once "lib/cnx.php";

$sentencia = $base_de_datos->query("SELECT * FROM Clientes WHERE visible = 1;");
$usuarios = $sentencia->fetchAll(PDO::FETCH_OBJ);
?>

<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-flex align-items-center justify-content-between">
            <h4 class="page-title mb-0 font-size-18">Clientes Registrado</h4>

            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Clientes</a></li>
                    <li class="breadcrumb-item active">Lista</li>
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
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Telefono</th>
                            <th>Direccion</th>
                            <th>Compras</th>
                            <th>Tipo</th>
                            <th>Monto</th>
                            <th>OPC</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($usuarios as $usuario){ ?>
                        <tr>
                            <td><?php echo $usuario->ID_Cliente ?></td>
                            <td><?php echo $usuario->Nombres .' '.$usuario->Apellidos ?></td>
                            <td><?php echo $usuario->Telefono ?></td>
                            <td><?php echo $usuario->Direccion ?></td>
                            <?php
                                    $comp = "SELECT COUNT(ID_Venta) as total FROM Ventas WHERE ID_Cliente = ".$usuario->ID_Cliente;
                                    $quer = $conexion -> query ($comp);
                                    $tcompr = mysqli_fetch_array($quer);
                                    echo '<td>'.$tcompr['total'].'</td>';
                                ?>
                            <td>
                                <?php
                                    if ($usuario->Premium == '1') {
                                        echo "Premium";
                                    }else{
                                        echo "Normal";
                                    }
                                 
                                 ?>
                            </td>
                            <td>
                                <?php
                                    if ($usuario->Premium == '1') {
                                        echo "$".number_format($usuario->Credito);
                                    }else{
                                        echo "N/A";
                                    }
                                 
                                 ?>
                            </td>

                            <td> <a id="borrar" class="btn btn-info"
                                    href="<?php echo "Cliente.php?id=" . $usuario->ID_Cliente?>"><i
                                        class="far fa-eye"></i></a>
                                    
                                        <a id="borrar" class="btn btn-warning"
                                    href="<?php echo "lib/Clientes/Borrar.php?id=" . $usuario->ID_Cliente?>"><i
                                        class="fa fa-trash"></i></a>
                                    </td>
                            
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