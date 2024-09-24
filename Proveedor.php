<?php
header('Content-Type: text/html; charset=UTF-8');
session_start();
if ($_SESSION['loggedin'] != true){
    header('Location: index.php');
    echo $_SESSION['loggedin'];
}else{
    $page = 'Proveedor';
    include_once "lib/Header.php" ;
}

$id = $_GET["id"];
include_once "lib/conexion.php";
include_once "lib/cnx.php"; 
include_once "lib/alerts.php";
$sentencia = $base_de_datos->query("SELECT * FROM Proveedores WHERE ID_Proveedor =  $id ;");
$usuarios = $sentencia->fetchAll(PDO::FETCH_OBJ);
?>

<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-flex align-items-center justify-content-between">
            <h4 class="page-title mb-0 font-size-18">Perfil</h4>

            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Perfil</a></li>
                    <li class="breadcrumb-item active">Datos</li>
                </ol>
            </div>

        </div>
    </div>
</div>
<!-- end page title -->

<!-- start row -->
<div class="row">
    <?php foreach($usuarios as $usuario){ ?>
    <div class="col-md-12 col-xl-3">
        <div class="card">
            <div class="card-body">
                <div class="profile-widgets py-3">

                    <div class="text-center">
                        <div class="">
                            <!--Foto de Perfil de empresa-->
                            <img src="<?php echo $usuario->NLogo?>" class="avatar-lg mx-auto  rounded-circle">
                            <div class="online-circle"><i class="fas fa-circle text-success"></i></div>
                        </div>
                        <br>
                        <div class="">
                            <!--Foto de Perfil-->
                            <img src="<?php echo $usuario->Foto?>" class="avatar-lg mx-auto  rounded-circle">
                            <div class="online-circle"><i class="fas fa-circle text-success"></i></div>
                        </div>

                        <!--Nombre Perfil y Puesto-->
                        <div class="mt-3 ">
                            <a href="#"
                                class="text-dark font-weight-medium font-size-16"><?php echo $usuario->Nombre?></a>
                            <!--Consulta-->
                            <?php 
                                $sql = "SELECT * FROM Puestos WHERE ID_Puesto = $usuario->ID_Puesto";
                                $query = $conexion -> query ($sql);
                                    while($cargo = mysqli_fetch_array($query)){
                                        $sql1 = "SELECT * FROM Sucursales WHERE ID_Sucursal = $usuario->ID_Sucursal";
                                        $query1 = $conexion -> query ($sql1);
                                            while($sucursal = mysqli_fetch_array($query1)){
                                                echo '<p class="text-body mt-1 mb-1">'.$cargo['Cargo'].'</p>';
                                                echo '<span class="badge badge-success">'.$sucursal['Nombre'].'</span>';
                                                }
                                        }
                            ?>
                        </div>
                        <div class="row mt-4 border border-left-0 border-right-0 p-3">
                            <div class="col-md-6">
                                <!-- <h6 class="text-muted">
                                    Total de Ventas:
                                </h6>
                                <h5 class="mb-0"><php echo $usuario->Ventas ?></h5> -->
                            </div>
                            <!--------------------------------->
                            <div class="col-md-12">
                                <h6 class="text-muted">
                                    Tiempo desde el Registro:
                                </h6>
                                <?php
                                    $hoy = time(); // HOY
                                    $fecharegistro = strtotime($usuario->Fecha_Registro);
                                    $diaslaborando = $hoy  - $fecharegistro;
                                ?>
                                <h5 class="mb-0"><?php echo round($diaslaborando / (60 * 60 * 24)); ?></h5>
                            </div>
                            <!--------------------------------->
                        </div>

                        <!--iconos sociales-->

                    </div>

                </div>
            </div>
        </div>
        <div class="card">
            <div class="card-body">
                <h5 class="card-title mb-3">Informacion Personal</h5>

                <div class="mt-3">
                    <p class="font-size-12 text-muted mb-1">Comentarios</p>
                    <h6 class=""><?php echo $usuario->Bio ?></h6>
                </div>

                <div class="mt-3">
                    <p class="font-size-12 text-muted mb-1">Correo</p>
                    <h6 class=""><?php echo $usuario->Correo ?></h6>
                </div>

                <div class="mt-3">
                    <p class="font-size-12 text-muted mb-1">Telefono</p>
                    <h6 class=""><?php echo $usuario->Telefono ?></h6>
                </div>

                <!-- <div class="mt-3">
                    <p class="font-size-12 text-muted mb-1">Direccion</p>
                    <h6 class=""><php echo $usuario->Direccion .' '. $usuario->Colonia.'. '.'C.P. '. $usuario->CP ?>
                    </h6>

                </div>-->
            </div>
        </div>

        <div class="card">
            <div class="card-body">
                <h5 class="card-title mb-3">Informacion de Empresa</h5>
                <div class="mt-3">
                    <p class="font-size-12 text-muted mb-1">Comentarios</p>
                    <h6 class=""><?php echo $usuario->NBio ?></h6>
                </div>
                <div class="mt-3">
                    <p class="font-size-12 text-muted mb-1">Nombre</p>
                    <h6 class=""><?php echo $usuario->NEmpresa ?></h6>
                </div>
                <div class="mt-3">
                    <p class="font-size-12 text-muted mb-1">Correo</p>
                    <h6 class=""><?php echo $usuario->NCorreo ?></h6>
                </div>
                <div class="mt-3">
                    <p class="font-size-12 text-muted mb-1">Telefono</p>
                    <h6 class=""><?php echo $usuario->NTel ?></h6>
                </div>
                <div class="mt-3">
                    <p class="font-size-12 text-muted mb-1">Direccion</p>
                    <h6 class=""><?php echo $usuario->NDireccion .' '. $usuario->NCiudad.'. '.'C.P. '. $usuario->NCP ?>
                    </h6>

                </div>
                <div class="mt-3">
                    <p class="font-size-12 text-muted mb-1">Datos Bancarios</p>
                    <h6 class="">Clabe:
                        <?php echo $usuario->Clabe .'<br> Banco: '. $usuario->Banco.'<br> Beneficiario: '. $usuario->Beneficiario ?>
                    </h6>

                </div>
            </div>
        </div>

    </div>

    <div class="col-md-12 col-xl-9">
        <div class="row">
            <div class="col-md-12 col-xl-4">
                <div class="card">
                    <!-- <div class="card-body">
                        <div class="row align-items-center">
                            <div class="col-8">
                                <p class="mb-2">Ventas del Mes</p>
                                <h4 class="mb-0">3,524</h4>
                            </div>
                            <div class="col-4">
                                <div class="text-right">
                                    <div>
                                        2.06 % <i class="mdi mdi-arrow-up text-success ml-1"></i>
                                    </div>
                                    <div class="progress progress-sm mt-3">
                                        <div class="progress-bar" role="progressbar" style="width: 62%"
                                            aria-valuenow="62" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> -->
                </div>
            </div>

            <div class="col-md-12 col-xl-4">
                <div class="card">
                    <!-- <div class="card-body">
                        <div class="row align-items-center">
                            <div class="col-8">
                                <p class="mb-2">Mes Anterior</p>
                                <h4 class="mb-0">5,362</h4>
                            </div>
                            <div class="col-4">
                                <div class="text-right">
                                    <div>
                                        3.12 % <i class="mdi mdi-arrow-up text-success ml-1"></i>
                                    </div>
                                    <div class="progress progress-sm mt-3">
                                        <div class="progress-bar bg-warning" role="progressbar" style="width: 78%"
                                            aria-valuenow="78" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> -->
                </div>
            </div>

            <div class="col-md-12 col-xl-4">
                <div class="card">
                    <!-- <div class="card-body">
                        <div class="row align-items-center">
                            <div class="col-8">
                                <p class="mb-2">Comicion del Mes??</p>
                                <h4 class="mb-0">$6,245</h4>
                            </div>
                            <-  <div class="col-4">
                                                    <div class="text-right">
                                                        <div>
                                                            2.12 % <i class="mdi mdi-arrow-up text-success ml-1"></i>
                                                        </div>
                                                        <div class="progress progress-sm mt-3">
                                                            <div class="progress-bar bg-success" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                                        </div>
                                                    </div>
                                                </div> --
                        </div>
                    </div> -->
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-body">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs nav-tabs-custom nav-justified" role="tablist">
                    <!-- <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#experience" role="tab">
                            <span class="d-block d-sm-none"><i class="fas fa-home"></i></span>
                            <span class="d-none d-sm-block">Tareas</span>
                        </a>
                    </li> -->
                    <!---------------------------------------------------------------------------------------->
                    <li class="nav-item ">
                        <a class="nav-link active" data-toggle="tab" href="#settings" role="tab">
                            <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span>
                            <span class="d-none d-sm-block">Datos de Contacto</span>
                        </a>
                    </li>
                    <!---------------------------------------------------------------------------------------->
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#revenue" role="tab">
                            <span class="d-none d-sm-block">Datos de Empresa</span>
                        </a>
                    </li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content p-3 text-muted">

                    <div class="tab-pane active" id="settings" role="tabpanel">
                        <div id="settings-chart" class="apex-charts mt-4">
                            <form method="post" action="lib/Proveedores/Editar.php" enctype="multipart/form-data">
                                <div class="row mt-4">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="firstname">Telefono</label>
                                            <input type="text" value="<?php echo $usuario->Telefono ?>"
                                                name="pertelefono" class="form-control" id="firstname"
                                                placeholder="Enter first name">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="lastname">Correo</label>
                                            <input type="text" value="<?php echo $usuario->Correo ?>" name="percorreo"
                                                class="form-control" id="lastname" placeholder="Enter last name">
                                        </div>
                                    </div> <!-- end col -->
                                </div>

                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="userbio">Comentarios</label>
                                            <textarea class="form-control" name="perbio" id="userbio" rows="4"
                                                placeholder="Write something..."><?php echo $usuario->Bio ?></textarea>
                                        </div>
                                    </div> <!-- end col -->
                                </div>


                                <br>
                                <div class="row">

                                    <div class="col-md-6">
                                        <div class="form-group mb-0">
                                            <br>
                                            <label for="userpassword">Foto</label>
                                            <input name="perfoto" type="file" multiple="multiple">
                                        </div>
                                    </div><!-- end col -->
                                </div>
                                <input name="id" type="hidden" value="<?php echo $usuario->ID_Proveedor?>">
                                <input name="idfoto" type="hidden" value="<?php echo $usuario->Foto?>">
                                <br><input class="btn btn-info" type="submit" value="Guardar">
                            </form>
                        </div>
                    </div>
                    <!-----------------END TAB----------------------------------------------------------------------->
                    <div class="tab-pane " id="revenue" role="tabpanel">
                        <form method="post" action="lib/Proveedores/Editar_Empre.php" enctype="multipart/form-data">
                            <div class="row mt-4">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="firstname">Telefono</label>
                                        <input type="text" value="<?php echo $usuario->NTel ?>" name="ntel"
                                            class="form-control" id="firstname" placeholder="Enter first name">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="lastname">Correo</label>
                                        <input type="text" value="<?php echo $usuario->NCorreo ?>" name="ncorreo"
                                            class="form-control" id="lastname" placeholder="Enter last name">
                                    </div>
                                </div> <!-- end col -->
                            </div>

                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="userbio">Comentarios</label>
                                        <textarea class="form-control" name="nbio" id="nbio" rows="4"
                                            placeholder="Write something..."><?php echo $usuario->NBio ?></textarea>
                                    </div>
                                </div> <!-- end col -->
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group mb-0">
                                        <label for="useremail">Direccion</label>
                                        <input type="text" value="<?php echo $usuario->NDireccion ?>" name="ndireccion"
                                            class="form-control" id="useremail" placeholder="Escribe tu direccion">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group mb-0">
                                        <label for="userpassword">Ciudad</label>
                                        <input type="text" value="<?php echo $usuario->NCiudad ?>" name="nciudad"
                                            class="form-control" id="userpassword" placeholder="escribe la ciudad">
                                    </div>
                                </div>
                            </div> <!-- end col -->
                            <br>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group mb-0">
                                        <label for="useremail">Codigo Postal</label>
                                        <input type="text" value="<?php echo $usuario->NCP?>" name="ncp"
                                            class="form-control" id="useremail" placeholder="Enter email">
                                    </div>
                                </div>
                                <br>

                                <div class="col-md-6">
                                    <label for="userpassword">Beneficiario</label>
                                    <input type="text" value="<?php echo $usuario->Beneficiario?>" name="beneficiario"
                                        class="form-control" id="" placeholder="Beneficiario">
                                </div><!-- end col -->
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group mb-0">
                                        <label for="useremail">Clabe</label>
                                        <input type="text" value="<?php echo $usuario->Clabe?>" name="clabe"
                                            class="form-control" id="" placeholder="clabe">
                                    </div>
                                </div>
                                <br>
                                <div class="col-md-6">
                                    <div class="form-group mb-0">
                                        <label for="userpassword">Banco</label>
                                        <input type="text" value="<?php echo $usuario->Banco?>" name="banco"
                                            class="form-control" id="" placeholder="Banco">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group mb-0">
                                        <div class="form-group mb-0">
                                            <br>
                                            <br>
                                            <label for="userpassword">Logo de la Empresa</label>
                                            <input name="nlogo" type="file" multiple="multiple">
                                        </div>

                                    </div>
                                </div>

                                <!-- end col -->
                            </div>
                            <input name="ide" type="hidden" value="<?php echo $usuario->ID_Proveedor?>">
                            <input name="idfotologo" type="hidden" value="<?php echo $usuario->NLogo?>">
                            <center><br><input class="btn btn-info" type="submit" value="Guardar"></center>
                        </form>
                        <!------------------------------------------------------------>
                    </div>
                    <!--End Setting-->


                </div>

            </div>
        </div>

        <!-- <div class="card">
            <div class="card-body">
                <h4 class="card-title mb-4">Ultimas 4 Ventas Recientes</h4>

                <div class="table-responsive">
                    <table class="table table-centered mb-0">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Fecha</th>
                                <th scope="col">Cliente</th>
                                <th scope="col">Monto</th>
                                <th scope="col" colspan="2">Medio Pago</th>
                            </tr>
                        </thead>
                        <tbody>
                            <php 
                                                $sql2 = "SELECT * FROM Ventas WHERE ID_Personal = $id  ORDER BY ID_Venta DESC LIMIT 4";
                                                $query2 = $conexion -> query ($sql2);
                                                $rows = mysqli_num_rows($query2);
                                                if ($rows == 0){
                                                    echo '<tr>"Se encontro: "'.$rows.'" Coincidencias" </tr>';
                                                }else{
                                                    while($venta = mysqli_fetch_array($query2)){
                                                        echo '<tr>';
                                                            echo '<td>'.$venta['ID_Venta'].'</td>';
                                                            echo '<td>'.$venta['Fecha'].'</td>';
                                                            echo '<td>'.$venta['ID_Cliente'].'</td>';
                                                            echo '<td>'.$venta['Total'].'</td>';
                                                            echo '<td><span class="badge badge-soft-success font-size-12">'.$venta['Total'].'</span></td>';
                                                            echo '<td><a href="Nota.php?id='.$venta['ID_Venta'].'" target="_blank" class="btn btn-primary btn-sm">Ver Nota</a></td>';
                                                        echo '</tr>';
                                                    } 
                                                }                                           
                                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div> -->
    </div>
    <?php } ?>
</div>

<!-- end row -->
<?php include_once "lib/Footer.php" ?>