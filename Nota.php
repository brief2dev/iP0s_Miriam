<?php 
header('Content-Type: text/html; charset=UTF-8');
session_start();
if ($_SESSION['loggedin'] != true){
    header('Location: index.php');
    echo $_SESSION['loggedin'];
}else{
    $page = 'Nota';
    include_once "lib/Header.php" ;
}

$id = $_GET['id'];

include_once "lib/cnx.php";
include_once "lib/conexion.php";
$sentencia = $base_de_datos->query("SELECT * FROM Ventas WHERE ID_Venta =  $id ;");
$ventas = $sentencia->fetchAll(PDO::FETCH_OBJ);
?>

<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-flex align-items-center justify-content-between">
            <h4 class="page-title mb-0 font-size-18">Recibos</h4>
            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Venta</a></li>
                    <li class="breadcrumb-item active">Nota</li>
                </ol>
            </div>

        </div>
    </div>
</div>
<!-- end page title -->
<!--Ticket-->
<div class="row">
    <?php foreach($ventas as $venta){ ?>
    <div class="col-lg-12">
        <div class="card">
            <div class="card-body">
                <div class="invoice-title">
                    <br>
                    <h4 class="float-right font-size-22">Venta #0<?php echo $id; ?> </h4>
                    <div class="mb-4">
                        <!--ewe logo-->
                        <?php 
                        $sqlsucurs = "SELECT * FROM Personal WHERE ID_Personal = ".$venta->ID_Personal;
                        $querysucurs = $conexion -> query ($sqlsucurs);
                        $sucursales = mysqli_fetch_array($querysucurs);

                        $sqlog = "SELECT * FROM Sucursales WHERE ID_Sucursal = ".$sucursales['ID_Sucursal'];
                        $queryog = $conexion -> query ($sqlog);
                        $logoss = mysqli_fetch_array($queryog);
                        
                        echo '<img src="'.$logoss['Logo'].'" alt="logo" height="120" />';
                        ?>

                        <Center>
                            <p>
                            <h1>Nota de compra</h1>
                            </p>
                        </Center>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-6">
                        <address>
                            <strong>Cliente:</strong><br>
                            <?php 
                                                    $sql = $base_de_datos->query("SELECT * FROM Clientes WHERE ID_Cliente = ".$venta->ID_Cliente);
                                                    $clientes = $sql->fetchAll(PDO::FETCH_OBJ);
                                                    foreach($clientes as $cliente){
                                                        echo $cliente->Nombres.' '.$cliente->Apellidos.'<br>';
                                                        echo $cliente->Telefono.'<br>';
                                                        echo $cliente->Direccion.', '.$cliente->Colonia.'<br>';
                                                        echo $cliente->Localidad.' '.$cliente->Estado.'';
                                                        $correocliente = $cliente->Correo;
                                                    }
                                                    ?>
                        </address>
                    </div>
                    <div class="col-6 text-right">
                        <address>
                            <strong>Vendedor(a):</strong><br>
                            <?php 
                                                $sql1 = $base_de_datos->query("SELECT * FROM Personal WHERE ID_Personal = ".$venta->ID_Personal);
                                                $personal = $sql1->fetchAll(PDO::FETCH_OBJ);
                                                foreach($personal as $vendedor){
                                                    echo $vendedor->Nombre.' '.$vendedor->Apellido.'<br>';
                                                    $idsuc = $vendedor->ID_Sucursal;
                                                }
                                                $sql2 = $base_de_datos->query("SELECT * FROM Sucursales WHERE ID_Sucursal = ".$idsuc);
                                                    $Sucursal = $sql2->fetchAll(PDO::FETCH_OBJ);
                                                    foreach($Sucursal as $tienda){
                                                        echo $tienda->Nombre.'<br>';
                                                        echo $tienda->Direccion.' '.$tienda->Colonia.'<br>';
                                                        echo $tienda->Municipio.' '.$tienda->Estado.'';
                                                    }
                                                ?>
                        </address>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6 mt-3">
                        <address>
                            <strong>Medio de Pago:</strong><br>
                            <?php 
                                                    $consu= $base_de_datos->query("SELECT * FROM Medio_Pago WHERE ID_Medio = ".$venta->ID_Medio);
                                                    $medio = $consu->fetchAll(PDO::FETCH_OBJ);
                                                    foreach($medio as $pago){
                                                        if($pago->Tipo == 'Tarjeta'){
                                                            echo $pago->Tipo.'<br>';
                                                            echo 'xxxx-xxxx-xxxx-xxxx <br>';
                                                            echo $correocliente;
                                                        }else{
                                                            echo $pago->Tipo.'<br>';
                                                            echo $correocliente;
                                                        }
                                                    }
                                                    ?>
                        </address>
                    </div>
                    <div class="col-6 mt-3 text-right">
                        <address>
                            <strong>Fecha de Compra:</strong><br>
                            <?php echo date("d-m-Y", strtotime($venta->Fecha)); ?><br>
                            <?php echo date("g:i a", strtotime($venta->Hora)); ?><br><br>
                        </address>
                    </div>
                </div>
                <div class="py-2 mt-3">
                    <h3 class="font-size-15 font-weight-bold">Detalles de la Venta</h3>
                </div>
                <div class="table-responsive">
                    <table class="table table-nowrap">
                        <thead>
                            <tr>
                                <th style="width: 70px;">SKU</th>
                                <th>Producto</th>
                                <th>Descripcion</th>
                                <th class="text-right">Cantidad</th>
                                <th class="text-right">Pecio</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!--PRODUCTOS-->
                            <?php
                                            $sql3 = "SELECT * FROM Venta_Detalle WHERE ID_Venta = ".$id;
                                            $query3 = $conexion -> query ($sql3);
                                            while ($detalles = mysqli_fetch_array($query3)){
                                                $sql4 = "SELECT ID_Producto, Descripcion, Nombre, PrecioVenta FROM Productos WHERE ID_Producto = ".$detalles['ID_Producto'];
                                                $query4 = $conexion -> query ($sql4);
                                                while ($produc = mysqli_fetch_array($query4)){
                                                    echo '<tr>';
                                                        echo '<td>'.$produc['ID_Producto'].'</td>';
                                                        echo '<td>'.$produc['Nombre'].'</td>';
                                                        echo '<td>'.$produc['Descripcion'].'</td>';
                                                        echo '<td class="text-right">'.$detalles['Cantidad'].'</td>';
                                                        echo '<td class="text-right">'.$produc['PrecioVenta'].'</td>';
                                                    echo '</tr>';
                                                } 
                                            } 
                                            ?>
                            <!--END PRODUCTOS-->

                            <!--PRECIO-->
                            <tr>
                                <td colspan="4" class="text-right">Sub Total</td>
                                <td class="text-right">$<?php echo $venta->Subtotal ?></td>
                            </tr>
                            <tr>
                                <td colspan="4" class="border-0 text-right">
                                    <strong>Descuento</strong>
                                </td>
                                <td class="border-0 text-right">-(<?php echo $venta->Descuento_porcent ?>%)
                                    $<?php echo $venta->Descuento_efect ?>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" class="border-0 text-right">
                                    <h4><strong>Total</strong></h4>
                                </td>
                                <td class="border-0 text-right">
                                    <h4 class="m-0">$<?php echo $venta->Total ?></h4>
                                </td>
                            </tr>
                            <!--END PRECIO-->
                        </tbody>
                    </table>
                </div>
                <div class="d-print-none">
                    <div class="float-right">
                        <a href="javascript:window.print()" class="btn btn-success waves-effect waves-light"><i
                                class="fa fa-print"></i> Imprimir Nota</a>
                        <a href="Ticket.php?id=<?php echo $id; ?>" target="_blank"
                            class="btn btn-success waves-effect waves-light"><i class="fa fa-print"></i> Imprimir
                            Ticket</a>
                        <!-- <a href='mailto:<php echo $correocliente;?>' class="btn btn-primary w-md waves-effect waves-light">Copia a Cliente</a> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php } ?>
    <!--END VENTAS-->
</div>
<!-- end row -->
<!-------------------------------------------------------------------->


<?php include_once "lib/Footer.php" ?>