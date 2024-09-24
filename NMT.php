<?php 
include_once 'lib/Header.php';
$idm = $_GET['id'];

include_once "lib/cnx.php";
include_once "lib/conexion.php";
include_once "lib/alerts.php";


?>


<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-flex align-items-center justify-content-between">
            <h4 class="page-title mb-0 font-size-18">Form Repeater</h4>

            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="javascript: void(0);">Forms</a></li>
                    <li class="breadcrumb-item active">Form Repeater</li>
                </ol>
            </div>

        </div>
    </div>
</div>
<!-- end page title -->

<div class="row">
    <div class="col-12">
        <div class="card">
            <?php 
                        if (empty($idm)) {
                    ?>
            <div class="card-body">
                <h4 class="card-title mb-4">Crear Mutualista</h4>
                <form method="post" action="lib/Mutualista/save.php" enctype="multipart/form-data">
                    <div data-repeater-list="group-a">
                        <div data-repeater-item class="row">
                            <div class="mb-3 col-lg-4">
                                <label class="form-label" for="name">Nombre</label>
                                <input type="text" id="naqm" name="nam" class="form-control" required />
                            </div>

                            <div class="mb-3 col-lg-2">
                                <label class="form-label" for="email">Fecha de Inicio</label>
                                <input type="date" name="fi" id="" class="form-control" required>
                            </div>

                            <div class="mb-3 col-lg-2">
                                <label class="form-label" for="subject">Fecha de Termino</label>
                                <input type="date" name="ff" id="" class="form-control" required>
                            </div>
                        </div>
                    </div>

                    <div data-repeater-list="group-b">
                        <div div data-repeater-item class="row">
                            <?php 
                                for ($i=1; $i <=10 ; $i++) { 
                                    # code...
                                    echo '
                                        <div class="mb-4 col-lg-4">
                                            <label class="form-label" for="name">Cliente</label>
                                            <select class="form-control" name="cl'.$i.'" id="">
                                            <option value="" disabled selected >Selecciona</option>
                                                ';
                                                $sqs = "SELECT * FROM Clientes";
                                                $qs = $conexion -> query($sqs);
                                                while ($cliente = mysqli_fetch_array($qs)) {
                                                    echo '<option value="'.$cliente['ID_Cliente'].'">'.$cliente['Nombres'].' '.$cliente['Apellidos'].'</option>';
                                                    
                                                }
                                                
                                                ?>
                            <?php
                                               echo ' 
                                            </select>
                                        </div>

                                        <div class="mb-4 col-lg-4">
                                            <label class="form-label" for="email">Monto</label>
                                            <input type="text" id="email" name="mnt'.$i.'" class="form-control" />
                                        </div>

                                        <div class="mb-4 col-lg-4">
                                            <label class="form-label" for="subject">Tipo pago</label>
                                            <select class="form-control" name="tp'.$i.'" id="">
                                                <option value="" disabled selected >Selecciona</option>
                                                <option value="7">Semanal</option>
                                                <option value="14">Catorcenal</option>
                                                <option value="30">Mensual</option>
                                            </select>
                                        </div>
                                    ';
                                }
                            ?>
                        </div>
                    </div>

                    <?php 
                        }else{
                            $iw = 0;
                            $nma = "SELECT * FROM M_Mutualista WHERE ID_Mutualista = ".$idm;
                            $qma = $conexion -> query($nma);
                            $nmt = mysqli_fetch_array($qma);

                             echo '<div class="card-body">
                <h4 class="card-title mb-4">Crear Mutualista</h4>
                <form method="post" action="lib/Mutualista/save.php" enctype="multipart/form-data">
                    <div data-repeater-list="group-a">
                        <div data-repeater-item class="row">
                            <div class="mb-3 col-lg-4">
                                <label class="form-label" for="name">Nombre</label>
                                <input type="text" id="naqm" name="nam" value="'.$nmt['Nombre'].'" disabled  class="form-control" required />
                            </div>

                            <div class="mb-3 col-lg-2">
                                <label class="form-label" for="email">Fecha de Inicio</label>
                                <input type="date" name="fi" id="" value="'.$nmt['Fecha_Inicio'].'" disabled  class="form-control" required>
                            </div>

                            <div class="mb-3 col-lg-2">
                                <label class="form-label" for="subject">Fecha de Termino</label>
                                <input type="date" name="ff" id="" value="'.$nmt['Fecha_Fin'].'" disabled class="form-control" required>
                            </div>
                        </div>
                    </div>';

                            $sm = "SELECT * FROM M_MDetalles WHERE ID_Mutualista = ".$idm." ORDER BY ID_Detalle ASC";
                            $qm = $conexion -> query($sm);
                            while ($dm = mysqli_fetch_array($qm)) {
                                $iw = $iw + 1;
                    ?>

                   
                    <div data-repeater-list="group-b">
                        <div div data-repeater-item class="row">
                            <div class="mb-4 col-lg-4">
                                <label class="form-label" for="name">Cliente</label>
                                <select class="form-control" name="<?php echo 'cl'.$iw ?>" id="">
                                    <?php 
                                        $smt = "SELECT * FROM Clientes WHERE ID_Cliente = ".$dm['ID_Cliente'];
                                        $qmt = $conexion -> query($smt);
                                        $clis = mysqli_fetch_array($qmt);
                                        echo '<option value="'.$clis['ID_Cliente'].'" selected >'.$clis['Nombres'].' '.$clis['Apellidos'].'</option>';

                                                $sqs = "SELECT * FROM Clientes WHERE ID_Cliente != ".$dm['ID_Cliente'];
                                                $qs = $conexion -> query($sqs);
                                                while ($cliente = mysqli_fetch_array($qs)) {
                                                    echo '<option value="'.$cliente['ID_Cliente'].'">'.$cliente['Nombres'].' '.$cliente['Apellidos'].'</option>';
                                                    
                                                }
                                                
                                                ?>

                                </select>
                            </div>

                            <div class="mb-2 col-lg-2">
                                <label class="form-label" for="email">Monto</label>
                                <input type="number" id="email" value="<?php echo $dm['Cantidad'] ?>" name="<?php echo 'mnt'.$iw ?>" class="form-control" />
                                <input type="hidden" name="edit" value="1">
                                <input type="hidden" name="id" value="<?php echo $idm; ?>">
                                <input type="hidden" name="<?php echo 'iddt'.$iw ?>" value="<?php echo $dm ['ID_Detalle']; ?>">

                            </div>

                            <div class="mb-2 col-lg-2">
                                <label class="form-label" for="subject">Tipo pago</label>
                                <select class="form-control" name="<?php echo 'tp'.$iw ?>" id="">
                                <?php 
                                    switch ($dm['Tiempo_Pago']) {
                                        case "7":
                                            echo '
                                            <option value="7" selected>Semanal</option>
                                            <option value="14">Catorcenal</option>
                                            <option value="30">Mensual</option>
                                            ';
                                            break;
                                        case "14":
                                            # code...
                                            echo '
                                            <option value="7">Semanal</option>
                                            <option value="14" selected>Catorcenal</option>
                                            <option value="30">Mensual</option>
                                            ';
                                            break;
                                        case "30":
                                            # code...
                                            echo '
                                            <option value="7">Semanal</option>
                                            <option value="14">Catorcenal</option>
                                            <option value="30" selected>Mensual</option>
                                            ';
                                            break;
                                        
                                        default:
                                            # code...
                                             echo '
                                            <option value="">Selecciona</option>
                                            <option value="7">Semanal</option>
                                            <option value="14">Catorcenal</option>
                                            <option value="30">Mensual</option>
                                            ';
                                            break;
                                    }
                                ?>
                                </select>
                            </div>
                            <div class="mb-2 col-lg-2">
                                <label class="form-label" for="email">Numero</label>
                                <input type="number" id="number" value="<?php echo $dm['Numero'] ?>" name="<?php echo 'num'.$iw ?>" class="form-control" />
                            </div>
                        </div>
                    </div>


                    <?php
                            }

                        }
                    ?>
                    <br>
                    <center>
                        <button type="submit" class="btn btn-success mt-3 mt-lg-0">Guardar</button>
                    </center>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- end row -->

<?php include_once 'lib/Footer.php'?>