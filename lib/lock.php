<?php
session_start();
include_once "conexion.php";
$id = $_SESSION['ids'];
try{
    $sentencia = $base_de_datos->query(" SELECT Foto FROM Personal WHERE ID_Personal =  $id ;");
    $usuarios = $sentencia->fetchAll(PDO::FETCH_OBJ);
}catch(Exception $exeption){
	echo $exeption;
}

?>
<!doctype html>
<html lang="es">


<head>
    <meta charset="utf-8" />
    <title>PV[Lite] 1.1 | Lock </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Blitzc0de" name="Punto de Venta v1.1" />
    <meta content="Themesbrand" name="Blitzc0de" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="assets/images/blitz.ico">

    <!-- Bootstrap Css -->
    <link href="../assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="../assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="../assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />

</head>

<body>
    <div class="home-btn d-none d-sm-block">
        <a href="index.html" class="text-dark"><i class="fas fa-home h2"></i></a>
    </div>
    <div class="account-pages my-5 pt-sm-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6 col-xl-5">
                    <div class="card overflow-hidden">
                        <div class="bg-login text-center">
                            <div class="bg-login-overlay"></div>
                            <div class="position-relative">
                                <h5 class="text-white font-size-20">Pantalla Bloqueada</h5>
                                <p class="text-white-50 mb-0">Por seguridad Ingrese su contraseña</p>
                                <a href="index.html" class="logo logo-admin mt-4">
                                    <img src="../assets/images/companies/blitz.png" alt="" height="30">
                                </a>
                            </div>
                        </div>
                        <div class="card-body pt-5">
                        <?php foreach($usuarios as $usuario){ ?>
                            <div class="p-2">
                                <form class="form-horizontal" action="check.php" method="post">

                                    <div class="user-thumb text-center mb-4">
                                    
                                        <img src="data:;base64,<?php echo $usuario->Foto?>" class="rounded-circle " alt="thumbnail" width="200" height="200">
                                        <h3 class="font-size-15 mt-3"><?php echo $_SESSION['username']; ?></h3>
                                    </div>

                                    <div class="form-group">
                                        <label for="userpassword">Password</label>
                                        <input type="password" name="pass" class="form-control" id="userpassword" placeholder="Ingrese la Contraseña">
                                    </div>

                                    <input name="user" type="hidden" value="<?php echo $_SESSION['username']; ?>">

                                    <div class="form-group row mb-0">
                                        <div class="col-12 text-right">
                                            <button class="btn btn-primary w-md waves-effect waves-light" type="submit">Unlock</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="mt-5 text-center">
                        <p>No eres <?php echo $_SESSION['username']; ?>?<a href="../index.php" class="font-weight-medium text-primary"> Click aqui </a> </p>
                        <p><script>document.write(new Date().getFullYear())</script>  Design & Develop by <i class="mdi mdi-heart text-danger"></i> ©<a href="https://blitzc0de.com" target="_blank"> Blitzc0de</a></p>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <!-- JAVASCRIPT -->
    <script src="../assets/libs/jquery/jquery.min.js"></script>
    <script src="../assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/libs/metismenu/metisMenu.min.js"></script>
    <script src="../assets/libs/simplebar/simplebar.min.js"></script>
    <script src="../assets/libs/node-waves/waves.min.js"></script>

    <script src="../assets/js/app.js"></script>

</body>


</html>