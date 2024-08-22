<?php 
header('Content-Type: text/html; charset=UTF-8');
//Iniciar una nueva sesión o reanudar la existente.
session_start();
//Si existe la sesión "cliente"..., la guardamos en una variable.
if ($_SESSION['loggedin'] != true){
    header('Location: index.php');//Aqui lo redireccionas al lugar que quieras.
    echo $_SESSION['loggedin'];
}else{
    $page = Dashboard; 
    include_once "lib/Header.php" ; 
}
include_once "lib/conexion.php";
include_once "lib/cnx.php";
include_once "lib/alerts.php";
$mes = date('n')-1;
$mesAnterior = date('n', strtotime('-2 month'));
const NombreMeses = [
  "Enero",
  "Febrero",
  "Marzo",
  "Abril",
  "Mayo",
  "Junio",
  "Julio",
  "Agosto",
  "Septiembre",
  "Octubre",
  "Noviembre",
  "Diciembre",
]; 

?>



<!--Titulo y Encabezado-->
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-flex align-items-center justify-content-between">
            <h4 class="page-title mb-0 font-size-18">Estadisticas</h4>
            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item active">Informes</li>
                </ol>
            </div>
        </div>
    </div>
</div>

<!-- end page title -->
<h2>Ventas & Pagos</h2>
<div class="row">
    <!-- apoyo -->
    <div class="col-xl-6">
        <div class="card">
            <div class="card-body">
                <div class="media">
                    <div class="avatar-sm font-size-20 mr-3">
                        <span class="avatar-title bg-soft-primary text-primary rounded">
                            <i class="mdi mdi-cash"></i>
                        </span>
                    </div>
                    <div class="media-body">
                        <div class="font-size-16 mt-2">Destacados</div>
                    </div>
                </div>
                <div class="row">
                    <div class="" id="produc">

                    </div>

                </div>
            </div>
        </div>
    </div>

    <!-- Dept -->
    <div class="col-xl-6">
        <div class="card">
            <div class="card-body">
                <div class="media">
                    <div class="avatar-sm font-size-20 mr-3">
                        <span class="avatar-title bg-soft-primary text-primary rounded">
                            <i class="mdi mdi-bank"></i>
                        </span>
                    </div>
                    <div class="media-body">
                        <div class="font-size-16 mt-2">Medios de Pago</div>

                    </div>
                </div>
                <div class="row">
                    <div class="" id="mPago">

                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- Seccion 2 -->
<br>
<h2>Historico</h2>
<div class="row">
    <!-- Este Mes -->
    <div class="col-xl-4">
        <div class="card">
            <div class="card-body">
                <div class="media">
                    <div class="avatar-sm font-size-20 mr-3">
                        <span class="avatar-title bg-soft-primary text-primary rounded">
                            <i class="mdi mdi-calendar"></i>
                        </span>
                    </div>
                    <div class="media-body">
                        <div class="font-size-16 mt-2">Este Mes: <?php echo NombreMeses[$mes]; ?>
                        <?php
                            $sqlmes = "SELECT SUM(Total) as totalm FROM Ventas WHERE ID_Destino = 1 AND MONTH(Fecha) = MONTH(CURDATE()) AND YEAR(Fecha) = YEAR(CURDATE())";
                            $querymes = $conexion -> query ($sqlmes);
                            $mes = mysqli_fetch_array($querymes);
                            echo '<h4> $ '.$mes['totalm'].'</h4>';
                            ?>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="" id="AuEsteMes">

                    </div>

                    <div class="col-7">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Mes Anterior -->
    <div class="col-xl-4">
        <div class="card">
            <div class="card-body">
                <div class="media">
                    <div class="avatar-sm font-size-20 mr-3">
                        <span class="avatar-title bg-soft-primary text-primary rounded">
                            <i class="mdi mdi-calendar-multiple"></i>
                        </span>
                    </div>
                    <div class="media-body">
                        <div class="font-size-16 mt-2">Mes Anterior: <?php echo NombreMeses[$mesAnterior]; ?>
                            <?php
                            $sqlmesa = "SELECT SUM(Total) as totalma FROM Ventas WHERE ID_Destino = 1 AND MONTH(Fecha) = MONTH(CURDATE())-1 AND YEAR(Fecha) = YEAR(CURDATE())";
                            $querymesa = $conexion -> query ($sqlmesa);
                            $mesa = mysqli_fetch_array($querymesa);
                            echo '<h4> $ '.$mesa['totalma'].'</h4>';
                            ?>
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="" id="AuMesAnterior">
                    </div>
                    <div class="col-7">

                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Anual -->
    <div class="col-xl-4">
        <div class="card">
            <div class="card-body">
                <div class="media">
                    <div class="avatar-sm font-size-20 mr-3">
                        <span class="avatar-title bg-soft-primary text-primary rounded">
                            <i class="mdi mdi-calendar-question"></i>
                        </span>
                    </div>
                    <div class="media-body">
                        <div class="font-size-16 mt-2">Año:
                            <script>
                            document.write(new Date().getFullYear())
                            </script>
                            <?php
                            $sql5 = "SELECT SUM(Total) as totalano FROM Ventas WHERE ID_Destino = 1 AND YEAR(Fecha) = YEAR(CURDATE())";
                            $query5 = $conexion -> query ($sql5);
                            $vano = mysqli_fetch_array($query5);
                            echo '<h4> $ '.$vano['totalano'].'</h4>';
                            ?>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="" id="AuAnual">
                    </div>
                    <div class="col-7">

                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- end Seccion 2 -->
<!-------------------------------------------------------------------->
<!--ROW 2-->
<div class="row">
    <!--Contenedor 4 -->
    <div class="col-lg-6">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title mb-4">Movimientos Financieros</h4>
                <ul class="list-unstyled activity-wid">
                    <!-------------------------------------------------------------------->
                    <?php
                                $sql0 = "SELECT DATE_FORMAT(Fecha,'%d/%m/%Y') AS Fecha, Descripcion, ID_Caja_T, Monto FROM Caja ORDER BY ID_Caja DESC LIMIT 8 ";
                                $query0 = $conexion -> query ($sql0);
                                    while($caja = mysqli_fetch_array($query0)){
                                        if ($caja["ID_Caja_T"] == 1){
                                            $cajatipo = "Ingreso";
                                        }else{
                                            if($caja["ID_Caja_T"] == 2){
                                            $cajatipo = "Retiro";
                                            }
                                        }
                                        echo'
                                        <li class="activity-list">
                                        <div class="activity-icon avatar-xs">
                                            <span class="avatar-title bg-soft-primary text-primary rounded-circle">
                                                <i class="mdi mdi-calendar-edit"></i></span>
                                        </div>
                                        <div class="media">
                                            <div class="mr-3">
                                                <h5 class="font-size-14">'.$caja["Fecha"].'<i
                                                        class="mdi mdi-arrow-right text-primary align-middle ml-2"></i></h5>
                                            </div>
                                            <div class="media-body">
                                                <div>
                                                    <strong> '.$cajatipo.' $'.$caja["Monto"].' : </strong>'.$caja["Descripcion"].'
                                                </div>
                                            </div>
                                        </div>
                                    </li>';
                                    }
                            ?>


                    <!-------------------------------------------------------------------->
                </ul>
            </div>
        </div>
    </div>
    <!--END Contenedor 4 -->
    <!-------------------------------PRODUCTOS------------------------------------->
    <!--Contenedor 5 con 4 Widgets-->
    <div class="col-lg-6">
        <!--Widgets 1 -->
        <div class="card">
            <div class="card-body">
                <h4 class="card-title mb-4">Productos bajo Stock</h4>
                <div class="text-center">
                    <div class="row">
                        <!--Producto 1-->
                        <?php
                        $sql6 = "SELECT * FROM Productos WHERE Existencia < 5 LIMIT 12";
                        $query6 = $conexion -> query ($sql6);
                        while($produc = mysqli_fetch_array($query6)){
                            echo'
                            <div class="col-sm-3">
                                <div class="pt-3">
                                    <div class="avatar-sm mx-auto font-size-16">
                                        <span class="avatar-title bg-soft-primary text-primary rounded-circle">
                                        <img src="data:;base64,'.$produc['Foto'].'" width="50" height="50" alt="">
                                        <!-- <i class="mdi mdi-monitor"></i> -->
                                        </span>
                                    </div>
                                    <div class="mt-3">
                                    <a href="Producto_Form.php?id='.$produc['ID_Producto'].'"'.'target="_blank">
                                        <h5 class="mb-1">'.$produc["Nombre"].'</h5> </a>
                                        <p class="text-truncate">Existencia: '.$produc["Existencia"].'</p>
                                    </div>
                                </div>
                            </div>
                            ';
                        }
                        ?>

                    </div>
                </div>
            </div>
        </div>
    </div> <!-------------------------------Clientes Credito------------------------------------->
    <div class="col-lg-12">
        <!--Widgets 1 -->
        <div class="card">
            <div class="card-body">
                <h4 class="card-title mb-4">Clientes proximos a vencer</h4>
                <div class="text-center">
                    <div class="row">
                        <?php
                        $sqlC = "SELECT * FROM Abonos WHERE fecha";
                        $queryC = $conexion -> query ($sqlC);
                        while($listC = mysqli_fetch_array($queryC)){
                            echo'
                            ';
                           
                        }
                        ?>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-lg-12">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title mb-4">Ultimos movimientos</h4>

            <div class="table-responsive">
                <table class="table table-centered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Suc.</th>
                            <th>Personal</th>
                            <th>Dia</th>
                            <th>Comentario</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php 
                            //obtiene los datos de la venta
                            $sql = "SELECT * FROM Ventas ORDER BY ID_Venta DESC LIMIT 5";
                            $query = $conexion -> query ($sql);
                                while($venta = mysqli_fetch_array($query)){
                                    //echo $venta['Total'];//-----------------------------
                                    //obtiene los datos del vendedor con el id retornado de ventas
                                    $sql1 = "SELECT * FROM Personal WHERE ID_Personal = ".$venta['ID_Personal'];
                                    $query1 = $conexion -> query ($sql1);
                                        while($vendedor = mysqli_fetch_array($query1)){
                                            //echo $vendedor['Nombre'];//---------------------------
                                            //obtiene la sucursal con el id del vendedor retornado de los datos del vendedor
                                            $sql2 = "SELECT Nombre FROM Sucursales WHERE ID_Sucursal = ".$vendedor['ID_Sucursal'];
                                            $query2 = $conexion -> query ($sql2);
                                                while ($sucursal = mysqli_fetch_array($query2)){
                                                    //echo $sucursal['Nombre'];//---------------------------
                                                    //obtiene el medio de pago con el id retornado po la venta
                                                    $sql3 = "SELECT Tipo FROM Medio_Pago WHERE ID_Medio = ".$venta['ID_Medio'];
                                                    $query3 = $conexion -> query ($sql3);
                                                    //echo $sql3;
                                                        while ($medio = mysqli_fetch_array($query3)){
                                                            echo '<tr>';
                                                            echo '<td>'.$venta['ID_Venta'].'</td>';
                                                            echo '<td>'.$sucursal['Nombre'].'</td>';
                                                            echo '<td>'.$vendedor['Nombre'].' '.$vendedor['Apellido'].'</td>';
                                                            echo '<td>'.$venta['Fecha'].' '.$venta['Hora'].'</td>';
                                                            echo '<td>'.$venta['Comentarios'].'</td>';
                                                            echo '<td> <a href="Nota.php?id='.$venta['ID_Venta'].'"'.'target="_blank">'.'$ ' .$venta['Total'].'</a> </td>';
                                                            echo '</tr>';
                                                            }
                                                    }
                                            }
                                    }
                        ?>

                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
    <!--END Contenedor 8 con 5 Widgets-->
    <!-------------------------------EMPLEADOS------------------------------------->
    <!--Contenedor 6 con 4 Widgets-->
    <!-- <div class="col-lg-4">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title mb-4">Empleados del Mes</h4>

                <div class="media">
                    <div class="media-body">
                        <p class="mb-2">Ventas Sucursal 1</p>
                        <h4>289</h4>
                        -- <p class="mb-0"><span class="badge badge-soft-success mr-2">
                                0.6%
                                <i class="mdi mdi-arrow-up"></i> </span> From previous period</p> -
                    </div>
                </div>

                <div class="mt-3 social-source">
                    --Empleado 1--
                    <div class="media align-items-center social-source-list">
                        <div class="avatar-xs mr-4">
                            <span class="avatar-title rounded-circle">
                                <img src="assets/images/users/avatar-5.jpg" width="40" height="40" alt="">
                                -- <i class="mdi mdi-facebook"></i> --
                            </span>
                        </div>
                        <div class="media-body">
                            <p class="mb-1">Alondra</p>
                            <h5 class="mb-0">89 Ventas</h5>
                        </div>
                        <div>
                            2.06 % <i class="mdi mdi-arrow-up text-success ml-1"></i>
                        </div>
                    </div>


                </div>

            </div>
        </div>
    </div> -->
    <!--END Contenedor 5 con 4 Widgets-->
</div>
<!-- END ROW 2 -->
<!-------------------------------------------------------------------->





<?php 
include_once "lib/Footer.php" ;
?>