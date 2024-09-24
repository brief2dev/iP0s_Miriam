<?php
header('Content-Type: text/html; charset=UTF-8');
session_start();
if ($_SESSION['loggedin'] != true){
    header('Location: index.php');
    echo $_SESSION['loggedin'];
}else{
    $page = 'Personal';
    include_once "lib/Header.php" ;
}

include_once "lib/conexion.php";
include_once "lib/alerts.php";
$sentencia = $base_de_datos->query("SELECT * FROM Personal WHERE Baja = 0 AND visible = 1;");
$usuarios = $sentencia->fetchAll(PDO::FETCH_OBJ);
?>

<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-flex align-items-center justify-content-between">
            <h4 class="page-title mb-0 font-size-18">Personal Registrado</h4>

            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Personal</a></li>
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

                <h3 class="card-title">Consulte los Empelados de las Sucursales</h3>

                <table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap"
                    style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Telefono</th>
                            <th>Direccion</th>
                            <th>Puesto</th>
                            <th>Sucursal</th>
                            <th>Opciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($usuarios as $usuario){ ?>
                        <tr>
                            <td><?php echo $usuario->ID_Personal ?></td>
                            <td><?php echo $usuario->Nombre .' '. $usuario->Apellido?></td>
                            <td><?php echo $usuario->Telefono ?></td>
                            <td><?php echo $usuario->Direccion .' '.$usuario->Colonia?></td>
                            <td><?php 
                                    $sqlpu = "SELECT * FROM Puestos WHERE ID_Puesto =".$usuario->ID_Puesto;
                                    $querypue = $conexion -> query($sqlpu);
                                    $puesto = mysqli_fetch_array($querypue);
                                    echo $puesto['Cargo'];
                                ?></td>
                            <td><?php 
                                    $sqlsu = "SELECT * FROM Sucursales WHERE ID_Sucursal = ".$usuario->ID_Sucursal;
                                    $querysu = $conexion -> query($sqlsu);
                                    $sucursal = mysqli_fetch_array($querysu);
                                        echo $sucursal['Nombre']; 
                                ?></td>
                            
                            <td> <a id="borrar" class="btn btn-info"
                                    href="<?php echo "Perfil.php?id=" . $usuario->ID_Personal?>"><i
                                        class="far fa-eye"></i></a>
                                    <a id="borrar" class="btn btn-danger"
                                    href="<?php echo "lib/Personal/Baja.php?bp=1&id=" . $usuario->ID_Personal?>"><i class="far fa-thumbs-down"></i></a>
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