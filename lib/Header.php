<?php
date_default_timezone_set('America/Merida');
session_start();
include_once "lib/cnx.php";
?>
<!doctype html>
<html lang="es">
<!--Dashboard--> 
<head>
    <meta charset="utf-8" />
    <title>Miriam | <?php echo $page ?> </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Blitzc0de" name="iP0s v1.6" />
    <meta content="SYS" name="Blitzc0de" />
    <meta name="theme-color" content="#e55a48">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

    <!-- Sweet Alert- -->
    <!--<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>-->
    <script src="assets\js\offline\swws.js"></script>

    <!--<script src="assets/js/offline/jquery.min.js"></script>-->
    <script src="assets/js/offline/sweetalert.min.js"></script>
    <!-- App favicon -->
    <!-- link rel="shortcut icon" href="assets/images/t00.ico" -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/ac.ico">

    <!-- DataTables -->
    <link href="assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/libs/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css" />

    <!-- Responsive datatable examples -->
    <link href="assets/libs/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css" />

    <!-- Bootstrap Css -->
    <link href="assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet"/>

</head>


<body data-layout="detached" data-topbar="colored">


    <div class="container-fluid">
        <!-- Begin page -->
        <div id="layout-wrapper">

            <header id="page-topbar">
                <div class="navbar-header">
                    <div class="container-fluid">
                        <div class="float-right">
                            <!-------------------------------------------------------->

                            <!-------------------------------------------------------->

                            <!-------------------------------------------------------->

                            <div class="dropdown d-none d-lg-inline-block ml-1">
                                <button type="button" class="btn header-item noti-icon waves-effect"
                                    data-toggle="fullscreen">
                                    <i class="mdi mdi-fullscreen"></i>
                                </button>
                            </div>
                            <!--------------------------Notificaciones Seccion------------------------------>

                            <div class="dropdown d-inline-block">
                                <!-- <button type="button" class="btn header-item noti-icon waves-effect" id="page-header-notifications-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="mdi mdi-bell-outline"></i>
                                    <span class="badge badge-danger badge-pill">3</span>
                                </button> -->
                                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right p-0"
                                    aria-labelledby="page-header-notifications-dropdown">
                                    <div class="p-3">
                                        <div class="row align-items-center">
                                            <div class="col">
                                                <h6 class="m-0"> Notificaciones </h6>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- <div data-simplebar style="max-height: 230px;">
                                    -------------------------Notificacion Nueva-------------------------------
                                        <a href="#" class="text-reset notification-item">
                                            <div class="media">
                                                <div class="avatar-xs mr-3">
                                                    <span class="avatar-title bg-primary rounded-circle font-size-16">
                                                        <i class="bx bx-cart"></i>
                                                    </span>
                                                </div>
                                                <div class="media-body">
                                                    <h6 class="mt-0 mb-1">Your order is placed</h6>
                                                    <div class="font-size-12 text-muted">
                                                        <p class="mb-1">If several languages coalesce the grammar</p>
                                                        <p class="mb-0"><i class="mdi mdi-clock-outline"></i> 3 min ago</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                        -------------------------END Notificacion Nueva------------------------------
                                    </div> -->
                                    <div class="p-2 border-top"></div>
                                </div>
                            </div>
                            <!--------------------------END Notificaciones Seccion------------------------------>


                            <!----------------here mod---------------------------------------->
                            <?php
                            $sql = "SELECT * FROM Personal WHERE ID_Personal = "."'".$_SESSION['ids']."'";
                            $query = $conexion -> query ($sql);
                            //echo $sql;
                            while($usuario = mysqli_fetch_array($query)){
                                $sql1 = "SELECT * FROM Puestos WHERE ID_Puesto = ".$usuario['ID_Puesto'];
                                $query1 = $conexion -> query ($sql1);    
                                while($cargo = mysqli_fetch_array($query1)){   
                                echo '
                            <div class="dropdown d-inline-block">
                            <br>
                                <button type="button" class="btn header-item waves-effect" id="page-header-user-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <img class="rounded-circle header-profile-user" src="'.$usuario['Foto'].'" alt="Header Avatar"> 
                                    <span class="d-none d-xl-inline-block ml-1">'.$usuario['Nombre'].'</span>
                                    <i class="mdi mdi-chevron-down d-none d-xl-inline-block"></i>
                                </button>';
                                ?>
                            <div class="dropdown-menu dropdown-menu-right">
                                <!-- item-->
                                <a class="dropdown-item"
                                    href="<?php echo "Perfil.php?id=" . $usuario['ID_Personal']?>"><i
                                        class="bx bx-user font-size-16 align-middle mr-1"></i> Mi Perfil</a>
                                <!-- <a class="dropdown-item"
                                    href="<php echo "Empresa.php?id=" . $usuario['ID_Sucursal']?>"><i
                                        class="bx bx-wallet font-size-16 align-middle mr-1"></i> Mi Empresa</a> -->
                                <!-- <a class="dropdown-item" href="#"><i class="mdi mdi-lock mr-1"></i> Bloquear Sesion</a> -->
                                <!-- <a class="dropdown-item d-block" href="#"><span class="badge badge-success float-right">11</span><i class="bx bx-wrench font-size-16 align-middle mr-1"></i> Settings</a>
                                    <a class="dropdown-item" href="#"><i class="bx bx-lock-open font-size-16 align-middle mr-1"></i> Lock screen</a>  -->
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item text-danger" href="lib/logout.php"><i
                                        class="bx bx-power-off font-size-16 align-middle mr-1 text-danger"></i> Cerrar
                                    Sesión</a>
                            </div>
                            <?php
                                echo '
                            </div>
                            <!-------------------------------------------------------->
                            <div class="dropdown d-inline-block">
                                <button type="button" class="btn header-item noti-icon right-bar-toggle waves-effect">
                                    <i class="mdi mdi-settings-outline"></i>
                                </button>
                            </div>

                        </div>
                        <!-------------------------------------------------------->
                        <div>
                            <!-- LOGO -->
                            <div class="navbar-brand-box">
                            <br>
                                <a href="" class="logo logo-dark">
                                    <span class="logo-sm">
                                        <img src="assets/images/logo-sm.png" alt="" height="20">
                                    </span>
                                    <span class="logo-lg">
                                        <img src="assets/images/logo-dark.png" alt="" height="17">
                                    </span>
                                </a>

                                <a href="#" class="logo logo-light">
                                    <span class="logo-sm">
                                    
                                        <img src="assets/images/companies/mm1.png" alt="" height="100">
                                    </span>
                                    <span class="logo-lg">
                                        <img src="assets/images/companies/mm1.png" alt="" height="100">
                                    </span>
                                </a>
                            </div>
                            <!-------------------------------------------------------->

                            <button type="button" class="btn btn-sm px-3 font-size-16 header-item toggle-btn waves-effect" id="vertical-menu-btn">
                                <i class="fa fa-fw fa-bars"></i>
                            </button>

                            <!-- App Search-->
                            <!--  <form class="app-search d-none d-lg-inline-block">
                                <div class="position-relative">
                                    <input type="text" class="form-control" placeholder="Search...">
                                    <span class="bx bx-search-alt"></span>
                                </div>
                            </form> -->

                            <!--MEGAMENU-->

                            <div class="dropdown dropdown-mega d-none d-lg-inline-block ml-2">
                                <button type="button" class="btn header-item waves-effect" data-toggle="dropdown" aria-haspopup="false" aria-expanded="false">
                                    Soporte
                                    <i class="mdi mdi-chevron-down"></i>
                                </button>
                                <div class="dropdown-menu dropdown-megamenu">
                                    <div class="row">
                                        <!--Contacto-->
                                        <div class="col-sm-6">
                                            <h5 class="font-size-14 mt-0">Contacto</h5>
                                            <div class="px-lg-2">
                                                <div class="row no-gutters">
                                                    <div class="col">
                                                        <a class="dropdown-icon-item" href="https://www.facebook.com/DWEIT" target="_blank">
                                                            <img src="assets/images/brands/facebook.png" alt="Siguenos en Facebook">
                                                            <span>Facebook</span>
                                                        </a>
                                                    </div>
                                                    <div class="col">
                                                        <a class="dropdown-icon-item" href="https://wa.me/message/5SQVG7FCUXSGL1" target="_blank">
                                                            <img src="assets/images/brands/whatsapp.png" alt="Mandanos un Whatsapp">
                                                            <span>WhatsApp</span>
                                                        </a>
                                                    </div>
                                                    <div class="col">
                                                        <a class="dropdown-icon-item" href="https://t.me/ARojas93" target="_blank">
                                                            <img src="assets/images/brands/telegrama.png" alt="Telegram">
                                                            <span>Telegram</span>
                                                        </a>
                                                    </div>
                                                </div>

                                                <div class="row no-gutters">
                                                    <div class="col">
                                                        <a class="dropdown-icon-item" href="tel:9971018985" target="_blank">
                                                            <img src="assets/images/brands/llamada.png" alt="Llamanos">
                                                            <span>Teléfono</span>
                                                        </a>
                                                    </div>
                                                    <div class="col">
                                                        <a class="dropdown-icon-item" href="mailto:app-support@blitzc0de.com?Subject=Soporte PV">
                                                            <img src="assets/images/brands/correo-electronico.png" alt="Correo">
                                                            <span>e-Mail</span>
                                                        </a>
                                                    </div>
                                                    <div class="col">
                                                        <!-- <a class="dropdown-icon-item" href="#">
                                                            <img src="assets/images/brands/slack.png" alt="slack">
                                                            <span>Slack</span>
                                                        </a>-->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!---------------------------------------------------------->
                                        <!--BANNER-->
                                       <!-- <div class="col-sm-6">
                                            <div>
                                                <div class="card text-white mb-0 overflow-hidden text-white-50" style="background-image: url("assets/images/megamenu-img.png");background-size: cover;">
                                                    <div class="card-img-overlay"></div>
                                                    <div class="card-body">
                                                        <div class="row">
                                                            <div class="col-xl-6">
                                                                <h4 class="text-white mb-3">Oferta</h4>

                                                                <h5 class="text-white-50">Ahorra hasta <span class="font-size-24 text-white">50 %</span> Menos</h5>
                                                                <p>Compra el paquete anual</p>
                                                                <div class="mb-4">
                                                                    <a href="#" class="btn btn-success btn-sm">Completa tu pedido ya!!</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div> -->
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </header>
            <!-- ========== Left Sidebar Start ewe========== -->
            <div class="vertical-menu">
            <br>

                <div class="h-100">

                    <div class="user-wid text-center py-4">
                                    <div class="user-img">
                                        <img src="'.$usuario['Foto'].'" alt="" class="avatar-md mx-auto rounded-circle">
                                    </div>
                                    <div class="mt-3">
                                        <a href="#" class="text-dark font-weight-medium font-size-16">'.$usuario['Nombre'].' '.$usuario['Apellido'].'</a>
                                        <p class="text-body mt-1 mb-0 font-size-13">'.$cargo['Nombre'].'</p>';
                                            $sql2 = "SELECT * FROM Puestos WHERE ID_Puesto = ".$usuario['ID_Puesto'];
                                            $query2 = $conexion -> query ($sql2);
                                            while($dept = mysqli_fetch_array($query2)){
                                                echo '
                                                <p class="text-body mt-1 mb-0 font-size-13">'.$dept['Cargo'].'</p>
                                                </div>
                                                </div>';
                                            }     
                                        }                
            }
            ?>

                            <!--- Sidemenu -->
                            <div id="sidebar-menu">
                                <!-- Left Menu Start -->

                                <ul class="metismenu list-unstyled" id="side-menu">

                                    <!-------------------------------------------------------------------->
                                    <?php include_once "lib/menu.php"; ?>
                                    <!-------------------------------------------------------------------->

                                </ul>
                            </div>
                            <!-- Sidebar -->
                        </div>
                    </div>
                    <!-- Left Sidebar End -->

                    <!-- ============================================================== -->
                    <!-- Start right Content here -->
                    <!-- ============================================================== -->
                    <div class="main-content">

                        <div class="page-content">