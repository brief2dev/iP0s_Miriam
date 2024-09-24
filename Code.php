<?php 
header('Content-Type: text/html; charset=UTF-8');
//Iniciar una nueva sesión o reanudar la existente.
session_start();
//Si existe la sesión "cliente"..., la guardamos en una variable.
if ($_SESSION['loggedin'] != true){
    header('Location: index.php');//Aqui lo redireccionas al lugar que quieras.
    echo $_SESSION['loggedin'];
}else{
    $page = Generador; 
    include_once "lib/Header.php" ; 
}
include_once "lib/conexion.php";
include_once "lib/cnx.php";
include_once "lib/alerts.php";

if($_SESSION['cargo'] == 1){
    //$sentencia = $base_de_datos->query("SELECT * FROM Salidas WHERE foto = 1 ORDER BY ID_Salida DESC LIMIT 4;");
    //$usuarios = $sentencia->fetchAll(PDO::FETCH_OBJ);
}else{
    //$sentencia = $base_de_datos->query("SELECT * FROM Salidas WHERE ID_Departamento = ".$_SESSION['depa']." AND foto = 1 ORDER BY ID_Salida DESC");
    //$usuarios = $sentencia->fetchAll(PDO::FETCH_OBJ);
    //echo $sentencia;
}
?>

<div class="row">
    <div class="col-12">
        <div class="page-title-box d-flex align-items-center justify-content-between">
            <h4 class="page-title mb-0 font-size-18">Generador</h4>
            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item active">Codigos</li>
                </ol>
            </div>
        </div>
    </div>
</div>
<!-- end page title -->

<!-- ROW 1-->
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-5">
                        <p class="text-muted font-weight-medium mt-1 mb-2">Generador de Codigos de Barras</p>
                        <form method="get" action="Code.php">
                            <div class="row">
                                <label>Codigo</label>
                                <input maxlength="10" type="text" name="barcodeText" class="form-control">
                            </div>
                            <div class="row">
                                <label>Nombre del producto</label>
                                <input type="text" name="nproduct" class="form-control">
                            </div>

                            <!-- <div class="row">
                                <label>Tipo de código de barra</label>
                                <select name="barcodeType" id="barcodeType" class="form-control">
                                    <option value="code39">Code 39</option>
                                    <option value="codabar">Code bar</option>
                                    <option value="code128">Code 128</option>
                                </select>
                            </div>

                            <div class="row">
                                <label>Orientación</label>
                                <select name="barcodeDisplay" class="form-control" required>
                                    <option value="horizontal">Horizontal</option>
                                    <option value="vertical">Vertical</option>
                                </select>
                            </div> -->
                            <br>
                            <div class="row">
                                <input type="hidden" name="barcodeType" id="barcodeType" value="code39">
                                <input type="hidden" name="barcodeDisplay" id="barcodeDisplay" value="horizontal">
                                <input type="hidden" name="barcodeSize" id="barcodeSize" value="40">
                                <input type="hidden" name="printText" id="printText" value="true">
                                <br>
                                <center>
                                    <input type="submit" name="generateBarcode" value="Generar Código">
                                </center>
                                
                            </div>
                        </form>
                    </div>
                    <div class="col-1">
                    </div>

                    <div class="col-6 ">
                        <?php 
                                    /* $barcodeText = trim($_POST['barcodeText']);
                                    $barcodeType=$_POST['barcodeType'];
                                    $barcodeDisplay=$_POST['barcodeDisplay'];
                                    $barcodeSize=$_POST['barcodeSize'];
                                    $printText=$_POST['printText']; */

                                    $barcodeText = trim($_GET['barcodeText']);
                                    $NProducto=$_GET['nproduct'];
                                    $barcodeType=$_GET['barcodeType'];
                                    $barcodeDisplay=$_GET['barcodeDisplay'];
                                    $barcodeSize=$_GET['barcodeSize'];
                                    $printText=$_GET['printText'];
                                    

                                    if($barcodeText != '') {
                                        echo '<div class="alert alert-success" style="text-align: center";>';
                                        //echo 'src="lib/c0de/barc0de.php?text='.$barcodeText.'&codetype='.$barcodeType.'&orientation='.$barcodeDisplay.'&size='.$barcodeSize.'&print='.$printText.'&producto='.$NProducto.'" ';
                                        echo '<br>';
                                        echo '<img id="c0debar" class="barcode" alt="'.$barcodeText.'"
                                            src="lib/c0de/barc0de.php?text='.$barcodeText.'&codetype='.$barcodeType.'&orientation='.$barcodeDisplay.'&size='.$barcodeSize.'&print='.$printText.'&producto='.$NProducto.'" />';
                                        echo '</div>';

                                        echo  '<div style="text-align:center; font-size:15px; font-family: Source Sans Pro, Arial, sans-serif;">
                                                    <a href="https://www.blitzc0de.com" title="Barcode Software by blitz" target="_blank"">
                                                        <!-- logos are optional -->
                                                        
                                                    </a>
                                                    <br>
    
                                                   <!-- <a id="print" class="btn btn-success"
                                                        href="javascript:window.printImage(c0debar)" >
                                                        <i class="fa fa-print"></i>
                                                    </a>-->
                                                    <a id="save" class="btn btn-info"
                                                        href="lib/c0de/barc0de.php?text='.$barcodeText.'&codetype='.$barcodeType.'&orientation='.$barcodeDisplay.'&size='.$barcodeSize.'&print='.$printText.'&producto='.$NProducto.'" download="'.$NProducto.'">
                                                        <i class="fa fa-download"></i>
                                                    </a>
                                                </div>';

                                    }else{
                                        echo '<div>
                                                <div class="alert alert-danger">
                                                    <Center> Introduzca el nombre del producto para generar el código </Center>
                                                    <a href="https://www.blitzc0de.com" title="Barcode Software by blitz" target="_blank"">
                                                        <br>
                                                </div>
                                                        <!-- logos are optional -->
                                                        <Center>
                                                        <img alt="Blitzc0de" border="0" width="70" heigth ="70" src="assets/images/companies/blitz.png">
                                                        <br>
                                                        Blitzc0de 
                                                        </Center>
                                                    </a>
                                             </div>';
                                    }
                            ?>
                    </div>
                </div>
            </div>

            <div class="row">
                <!-- si se requiere un campo mas abajo de se pone dentro de este div -->
            </div>
        </div>
    </div>
    <!------------------------------------------------------------------------------->
</div>
<!------------------------------------------------------------------------------->
</div>
<!-- END ROW 1-->


<?php 
include_once "lib/Footer.php" ;
?>