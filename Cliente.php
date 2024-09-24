<?php
header('Content-Type: text/html; charset=UTF-8');
session_start();
if ($_SESSION['loggedin'] != true){
    header('Location: index.php');
    echo $_SESSION['loggedin'];
}else{
    $page = 'Cliente';
    include_once "lib/Header.php" ;
}

$id = $_GET["id"];
include_once "lib/conexion.php";
include_once "lib/cnx.php"; 
include_once "lib/alerts.php";
$sentencia = $base_de_datos->query("SELECT * FROM Clientes WHERE ID_Cliente =  $id ;");
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
                            <!--Foto de Perfil-->
                            <img src="assets/images/users/user.png" alt="Cliente"
                                class="avatar-lg mx-auto  rounded-circle">
                            <div class="online-circle"><i class="fas fa-circle text-success"></i></div>
                        </div>

                        <!--Nombre Perfil y Puesto-->
                        <div class="mt-3 ">
                            <a href="#"
                                class="text-dark font-weight-medium font-size-16"><?php echo $usuario->Nombres.' '.$usuario->Apellidos?></a>
                                <br>
                            <!--Consulta-->
                            <?php 
                            if ($usuario->Premium == '1') {
                                echo '<span class="badge badge-success">Cliente Distinguido</span>';
                            }else{
                                echo '<p class="text-body mt-1 mb-1">Cliente</p>';
                            }
                            ?>
                        </div>
                        <div class="row mt-4 border border-left-0 border-right-0 p-3">
                            <!--  <div class="col-md-6">
                                <h6 class="text-muted">
                                    Total de Ventas:
                                </h6>
                                <h5 class="mb-0"><php echo $usuario->Ventas ?></h5>
                            </div> -->
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
                                <h5 class="mb-0"><?php echo round($diaslaborando / (60 * 60 * 24))." Dias"; ?></h5>
                            </div>
                            <!--------------------------------->
                            <br>
                            <div class="col-md-12">
                                <h6 class="text-muted">
                                    <br>
                                    Compras Registradas:
                                </h6>
                                <?php
                                $comp = "SELECT COUNT(ID_Venta) as total FROM ventas WHERE ID_Cliente = ".$id;
                                    $quer = $conexion -> query ($comp);
                                    $tcompr = mysqli_fetch_array($quer);
                                ?>
                                <h5 class="mb-0"><?php echo $tcompr['total']; ?></h5>
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
                    <p class="font-size-12 text-muted mb-1">Correo</p>
                    <h6 class=""><?php echo $usuario->Correo ?></h6>
                </div>

                <div class="mt-3">
                    <p class="font-size-12 text-muted mb-1">Telefono</p>
                    <h6 class=""><?php echo $usuario->Telefono ?></h6>
                </div>

                <div class="mt-3">
                    <p class="font-size-12 text-muted mb-1">Direccion</p>
                    <h6 class=""><?php echo $usuario->Direccion .' '. $usuario->Colonia.' '.'C.P. '. $usuario->CP ?>
                    </h6>

                </div>

            </div>
        </div>

    </div>

    <div class="col-md-12 col-xl-9">
        <div class="row">
            <div class="col-md-12 col-xl-4">
                <div class="card">

                </div>
            </div>

            <div class="col-md-12 col-xl-4">
                <div class="card">

                </div>
            </div>

            <div class="col-md-12 col-xl-4">

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
                    <!--<li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#revenue" role="tab">
                                <span class="d-none d-sm-block">Revenue</span>
                            </a>
                        </li> -->
                    <li class="nav-item ">
                        <a class="nav-link active" data-toggle="tab" href="#settings" role="tab">
                            <span class="d-block d-sm-none"><i class="far fa-envelope"></i></span>
                            <span class="d-none d-sm-block">Datos de Contacto</span>
                        </a>
                    </li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content p-3 text-muted">

                    <!--------------------------------------------------------------------------------------------------------------------------------------->
                    <div class="tab-pane" id="revenue" role="tabpanel">
                        <div id="revenue-chart" class="apex-charts mt-4"></div>
                    </div>

                    <div class="tab-pane active" id="settings" role="tabpanel">
                        <!------------------------------------------------------------>
                        <form method="post" action="lib/Clientes/Editar.php" enctype="multipart/form-data">
                            <div class="row mt-4">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="firstname">Nombre</label>
                                        <input type="text" value="<?php echo $usuario->Nombres ?>" name="pernom"
                                            class="form-control" id="firstname" placeholder="Telefono">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="firstname">Apellidos</label>
                                        <input type="text" value="<?php echo $usuario->Apellidos ?>" name="perape"
                                            class="form-control" id="firstname" placeholder="Telefono">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="firstname">Telefono</label>
                                        <input type="text" value="<?php echo $usuario->Telefono ?>" name="pertelefono"
                                            class="form-control" id="firstname" placeholder="Telefono">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="lastname">Correo</label>
                                        <input type="text" value="<?php echo $usuario->Correo ?>" name="percorreo"
                                            class="form-control" id="lastname" placeholder="alguien@example.com">
                                    </div>
                                </div> <!-- end col -->
                            </div>


                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group mb-0">
                                        <label for="useremail">Direccion</label>
                                        <input type="text" value="<?php echo $usuario->Direccion ?>" name="perdirecc"
                                            class="form-control" id="useremail" placeholder="Direccion">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group mb-0">
                                        <?php 
                                        if ($usuario->Premium == 1) {
                                            # code...
                                            echo '
                                                <label for="useremail">Credito Disponible</label>
                                                <input type="text" value="'.$usuario->Credito.'" required name="percre"
                                                    class="form-control" id="useremail" placeholder="00000">
                                            ';
                                        }
                                        ?>
                                        
                                    </div>
                                </div>
                                <br>
                                <div class="col-md-6">
                                    <div class="form-group mb-0">
                                        <br><br>
                                        <?php
                                        switch ($usuario->Premium) {
                                            case 0:
                                                //echo '<label for="useremail">Premium</label>';
                                                echo ' <div class="custom-control custom-checkbox">
                                                        <input type="checkbox" name="checkp" value="1" class="custom-control-input" id="customCheck1">
                                                        <label class="custom-control-label" for="customCheck1">Usuario Premium.</label>
                                                    </div>';
                                                break;
                                            case 1:
                                                //echo '<label for="useremail">Premium</label>';
                                                echo ' <div class="custom-control custom-checkbox">
                                                        <input type="checkbox" checked name="checkp" value="1" class="custom-control-input" id="customCheck1">
                                                        <label class="custom-control-label" for="customCheck1">Usuario Premium.</label>
                                                    </div>';
                                                break;
                                            default:
                                                # code...
                                                break;
                                        }
                                        ?>
                                       
                                    </div>
                                </div>
                            </div> <!-- end col -->
                            <br>

                            <input name="id" type="hidden" value="<?php echo $usuario->ID_Cliente?>">
                            <br>
                            <center>
                                <input class="btn btn-info" type="submit" value="Guardar">
                            </center>

                        </form>
                        <!------------------------------------------------------------>
                    </div>
                    <!--End Setting-->


                </div>

            </div>
        </div>

        <div class="card">
            <div class="card-body">
                <Center>
                    <h3 class="card-title mb-4">Compras & Creditos</h3>
                </Center>

                <table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap"
                    style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                    <thead>
                        <tr>
                            <th scope="col">Folio</th>
                            <th scope="col">Fecha</th>
                            <th scope="col">ID Cliente</th>
                            <th scope="col">Monto</th>
                            <th scope="col">Destino</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php 
                                $sql2 = "SELECT * FROM Ventas WHERE ID_Cliente = $id ORDER BY ID_Venta DESC LIMIT 10";
                                $query2 = $conexion -> query ($sql2);
                                $rows = mysqli_num_rows($query2);
                                    if ($rows == 0){
                                        echo '<tr>"Se encontro: "'.$rows.'" Coincidencias" </tr>';
                                    }else{
                                        while($venta = mysqli_fetch_array($query2)){
                                            echo '<tr>';
                                            echo '<td>'.$venta['ID_Venta'].'</td>';
                                            echo '<td>'.date('d-m-Y', strtotime($venta['Fecha'])).'</td>';
                                            echo '<td>'.$venta['ID_Cliente'].'</td>';
                                            echo '<td>'.$venta['Total'].'</td>';
                                                $sqlvc = "SELECT * FROM Venta_T WHERE ID_Destino = ".$venta['ID_Destino'];
                                                $queryvc = $conexion -> query($sqlvc);
                                                $destino = mysqli_fetch_array($queryvc);
                                                switch ($venta['ID_Destino']) {
                                                    case '1':
                                                        # code...
                                                        echo '<td><span class="badge badge-soft-success font-size-12">'.$destino['Destino'].'</span></td>';
                                                        break;
                                                    case '2';
                                                         # code...
                                                         echo '<td><span class="badge badge-soft-warning font-size-12">'.$destino['Destino'].'</span></td>';
                                                        break;
                                                    case '4';
                                                         # code...
                                                         echo '<td><span class="badge badge-soft-info font-size-12">'.$destino['Destino'].'</span></td>';
                                                        break;
                                                    default:
                                                        # code...
                                                        break;
                                                }
                                            
                                            echo '<td><a href="Nota.php?id='.$venta['ID_Venta'].'" target="_blank" class="btn btn-primary btn-sm">Ver Nota</a></td>';
                                            echo '</tr>';
                                        } 
                                    }                                           
                            ?>
                    </tbody>
                </table>
            </div>
        </div>





    </div>
    <?php } ?>
</div>

<!-- end row -->
<?php include_once "lib/Footer.php" ?>