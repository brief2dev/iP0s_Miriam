<?php
header('Content-Type: text/html; charset=UTF-8');
session_start();
if ($_SESSION['loggedin'] != true){
    header('Location: index.php');
    echo $_SESSION['loggedin'];
}else{
    $page = 'Perfil';
    include_once "lib/Header.php" ;
}

$id = $_GET["id"];
include_once "lib/conexion.php";
include_once "lib/cnx.php"; 
include_once "lib/alerts.php";
$sentencia = $base_de_datos->query("SELECT * FROM Personal WHERE ID_Personal =  $id ;");
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
                            <img src="<?php echo $usuario->Foto?>" alt="" class="avatar-lg mx-auto  rounded-circle">
                            <div class="online-circle"><i class="fas fa-circle text-success"></i></div>
                        </div>

                        <!--Nombre Perfil y Puesto-->
                        <div class="mt-3 ">
                            <a href="#"
                                class="text-dark font-weight-medium font-size-16"><?php echo $usuario->Nombre.' '.$usuario->Apellido?></a>
                            <!--Consulta-->
                            <?php $sql = "SELECT * FROM Puestos WHERE ID_Puesto = $usuario->ID_Puesto";
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
                                <h6 class="text-muted">
                                    Total de Ventas:
                                </h6>
                                <h5 class="mb-0">
                                    <?php 
                                        $sqltv = "SELECT COUNT(ID_Venta) as tv FROM Ventas WHERE ID_Personal = ".$usuario->ID_Personal;
                                        $querytv = $conexion -> query($sqltv);
                                        $tv = mysqli_fetch_array($querytv);
                                        echo $tv['tv']; ?>
                                </h5>
                            </div>
                            <!--------------------------------->
                            <div class="col-md-6">
                                <h6 class="text-muted">
                                    Tiempo desde inicio:
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
                    <h6 class=""><?php echo $usuario->Direccion .' '. $usuario->Colonia ?>
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
                <div class="card">
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
                        <form method="post" action="lib/Personal/Editar.php" enctype="multipart/form-data">
                            <div class="row mt-4">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="firstname">Telefono</label>
                                        <input type="text" value="<?php echo $usuario->Telefono ?>" name="pertelefono"
                                            class="form-control" id="firstname" placeholder="Ingrese Tel">
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
                                <div class="col-12">
                                    <div class="form-group">
                                        <!-- <label for="userbio">Bio</label> -->

                                    </div>
                                </div> <!-- end col -->
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group mb-0">
                                        <label for="useremail">Direccion</label>
                                        <input type="text" value="<?php echo $usuario->Direccion ?>" name="perdirecc"
                                            class="form-control" id="useremail" placeholder="Ingrese Direccion">
                                    </div>
                                </div>
                                <!-- <div class="col-md-6">
                                    <div class="form-group mb-0">
                                        <label for="userpassword">Colonia</label>
                                        <input type="text" value="<php echo $usuario->Colonia ?>" name="percol"
                                            class="form-control" id="userpassword" placeholder="Ingrese colonia">
                                    </div>
                                </div> -->
                            </div> <!-- end col -->
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
                            <input name="id" type="hidden" value="<?php echo $usuario->ID_Personal?>">
                            <input name="idfoto" type="hidden" value="<?php echo $usuario->Foto?>">
                            <center><br><input class="btn btn-info" type="submit" value="Guardar"></center>
                        </form>
                        <!------------------------------------------------------------>
                    </div>
                    <!--End Setting-->


                </div>

            </div>
        </div>

        <div class="card">
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
                            <?php 
                                                $sql2 = "SELECT * FROM Ventas WHERE ID_Personal = $id  ORDER BY ID_Venta DESC LIMIT 4";
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
                                                            $sqltp = "SELECT * FROM Medio_Pago WHERE ID_Medio = ".$venta['ID_Medio'];
                                                            $querytp = $conexion -> query($sqltp);
                                                            $tipo = mysqli_fetch_array($querytp);
                                                            echo '<td><span class="badge badge-soft-success font-size-12">'.$tipo['Tipo'].'</span></td>';
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
    </div>
    <?php } ?>
</div>

<!-- end row -->
<?php include_once "lib/Footer.php" ?>