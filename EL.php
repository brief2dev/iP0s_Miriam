<?php
header('Content-Type: text/html; charset=UTF-8');
session_start();
if ($_SESSION['loggedin'] != true){
    header('Location: index.php');
    echo $_SESSION['loggedin'];
}else{
    $page = 'Mis Empresas';
    include_once "lib/Header.php" ;
}
include_once "lib/conexion.php";
include_once "lib/cnx.php";
include_once "lib/alerts.php";
$sentencia = $base_de_datos->query("SELECT * FROM Sucursales WHERE visible = 1;");
$usuarios = $sentencia->fetchAll(PDO::FETCH_OBJ);
?>

<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-flex align-items-center justify-content-between">
            <h4 class="page-title mb-0 font-size-18">Mis Empresas Disponibles</h4>

            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);"></a></li>
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

                <h4 class="card-title">Consulte la lista de Empresas</h4>
                <br>
                <br><br>

                <table id="datatable" class="table table-striped table-bordered dt-responsive nowrap"
                    style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Telefono</th>
                            <th>Ubicacion</th>
                            <th>Encargado</th>
                            <th>Administrar</th>

                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($usuarios as $usuario){ ?>
                        <tr>
                            <td><?php echo $usuario->ID_Sucursal ?></td>
                            <td><?php echo $usuario->Nombre ?></td>
                            <td><?php echo $usuario->Telefono ?></td>
                            <td><?php echo $usuario->Municipio ?></td>
                            <?php
                                $sqlenc = "SELECT * FROM Personal WHERE ID_Sucursal = ".$usuario->ID_Sucursal." ORDER BY ID_Personal DESC LIMIT 1";
                                $queryenc = $conexion -> query ($sqlenc);
                                $encargado = mysqli_fetch_array($queryenc);
                                echo '<td>'.$encargado['Nombre'].' '.$encargado['Apellido'].'</td>';

                            ?>
                            <td> <a id="borrar" class="btn btn-info"
                                    href="<?php echo "Empresa.php?id=" . $usuario->ID_Sucursal?>"><i
                                        class="far fa-eye"></i></a>
                                <!-- <a id="borrar" class="btn btn-danger"
                                    href="<php echo "lib/Proveedores/Borrar.php?id=" . $usuario->ID_Proveedor?>"><i
                                        class="fa fa-trash"></i></a> -->

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