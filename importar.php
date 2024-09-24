<?php
set_time_limit(600);
ini_set('memory_limit', '-1');
header('Content-Type: text/html; charset=UTF-8');
$fecha = date("Y-m-d");
$semana =date("W",strtotime($fecha));
include_once "lib/Header.php" ;
include_once "lib/cnx.php";
?>

<!-- start page title -->
<div class="row">
    <div class="col-12">
        <div class="page-title-box d-flex align-items-center justify-content-between">
            <h4 class="page-title mb-0 font-size-18"></h4>
            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <!-- <li class="breadcrumb-item"><a href="javascript: void(0);">Layouts</a></li>
                                        <li class="breadcrumb-item active">Preloader</li> -->
                </ol>
            </div>
            <div class="page-title-right">
                <ol class="breadcrumb m-4">
                    <!-- <li class="breadcrumb-item"><a href="javascript: void(0);"></a></li>
                                        <li class="breadcrumb-item active"></li> -->
                </ol>
            </div>
        </div>
    </div>
</div>
<!-- end page title -->
<div class="row">
    <div class="">
        <div class="card">
            <div class="form-group col-md-10">
                <form name="importa" method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>"
                    enctype="multipart/form-data">
                    <br>
                    <h4>Seleccione Archivo Excel a Importar </h4>

                    <br>
                    <input type="file" class="form-control" name="excel" />
                    <br>

                    <br>

                    <!--   <script>
                                        function nombre(fic) {
                                            fic = fic.split('\\');
                                            alert(fic[fic.length - 1]);
                                        }
                                        </script> -->
                    <input type='submit' class="btn btn-primary" name='enviar' value="Importar" />
                    <input type="hidden" class="form-control" value="upload" name="action" />

                </form>
            </div>
            <div class="card-body">
                <?php
                                        include("lib/cnx.php");
                                        extract($_POST);
                                        
                                        if ($action == "upload") {
                                            //cargamos el archivo al servidor con el mismo nombre
                                            //solo le agregue el sufijo bak_ 
                                            $archivo = $_FILES['excel']['name'];
                                            $tipo = $_FILES['excel']['type'];
                                            $destino = "bak_" . $archivo;
                                            if (copy($_FILES['excel']['tmp_name'], $destino)){
                                                //echo "Archivo Cargado Con Éxito";
                                                $nombrearchivo = pathinfo($archivo, PATHINFO_FILENAME);
                                                /* $sqlarchivo = "SELECT ID_Circuito FROM Circuitos WHERE Nombre = '".$nombrearchivo."'";
                                                //echo $sqlarchivo ;
                                                $querarchivo = $conexion -> query ($sqlarchivo);
                                                $idcircuito = mysqli_fetch_array($querarchivo); */
                                            }
                                            else{
                                                echo "Error Al Cargar el Archivo";
                                            }
                                            if (file_exists("bak_" . $archivo)) {
                                                /** Clases necesarias */
                                                require_once $_SERVER['DOCUMENT_ROOT']."/APIs/ExcToMysql/Classes/PHPExcel.php";
                                                require_once $_SERVER['DOCUMENT_ROOT']."/APIs/ExcToMysql/Classes/PHPExcel/Reader/Excel2007.php";
                                                // Cache
                                                $cacheMethod = PHPExcel_CachedObjectStorageFactory:: cache_to_phpTemp;
                                                $cacheSettings = array( ' memoryCacheSize ' => '8MB');
                                                PHPExcel_Settings::setCacheStorageMethod($cacheMethod, $cacheSettings);
                                                // Cargando la hoja de cálculo
                                                $objReader = new PHPExcel_Reader_Excel2007();
                                                //$objReader = PHPExcel_IOFactory::createReader('Excel2007');
                                                $objPHPExcel = $objReader->load("bak_" . $archivo);
                                                $objFecha = new PHPExcel_Shared_Date();
                                                // Asignar hoja de excel activa
                                                $objPHPExcel->setActiveSheetIndex(0);
                                                $sheetData = $objPHPExcel->getActiveSheet()->toArray(null,null,true,true);//obtiene el numero de filas del doc
                                                $filasexcel = count($sheetData);
                                                //echo count($sheetData);

                                                // Llenamos el arreglo con los datos  del archivo xlsx
                                                for ($i = 1; $i <= $filasexcel; $i++) {

                                                    $_DATOS_EXCEL[$i]['NOMBRE'] = $objPHPExcel->getActiveSheet()->getCell('B' . $i)->getValue();
                                                    $_DATOS_EXCEL[$i]['PCOMPRA'] = $objPHPExcel->getActiveSheet()->getCell('C' . $i)->getValue();
                                                    $_DATOS_EXCEL[$i]['PVENTA'] = $objPHPExcel->getActiveSheet()->getCell('D' . $i)->getValue();
                                                    $_DATOS_EXCEL[$i]['CODIGO'] = $objPHPExcel->getActiveSheet()->getCell('I' . $i)->getValue();
                                                    $_DATOS_EXCEL[$i]['CATEGORIA'] = $objPHPExcel->getActiveSheet()->getCell('J' . $i)->getValue();
                                                    $_DATOS_EXCEL[$i]['PROVEE'] = $objPHPExcel->getActiveSheet()->getCell('K' . $i)->getValue();
                                                    $_DATOS_EXCEL[$i]['EXISTENCIA'] = $objPHPExcel->getActiveSheet()->getCell('N' . $i)->getValue();

                                                    $_DATOS_EXCEL[$i]['FECHA'] = '2018-03-13';
                                                    //$_DATOS_EXCEL[$i]['PCOMPRA'] = $objPHPExcel->getActiveSheet()->getCell('B' . $i)->getValue();
                                                   //_------------------------------FECHAS-----------------------------------
                                                     //$Fecha_excel = $objPHPExcel->getActiveSheet()->getCell('V'.$i);
                                                    /* $_DATOS_EXCEL[$i]['FESTATUS'] = $Fecha_excel->getValue();
                                                        if($_DATOS_EXCEL[$i]['FESTATUS'] == ''){
                                                           $_DATOS_EXCEL[$i]['FESTATUS'] = '2018-03-13';
                                                        }else{
                                                            if(PHPExcel_Shared_Date::isDateTime($Fecha_excel)){
                                                                $_DATOS_EXCEL[$i]['FESTATUS'] = date($format = "Y-m-d", PHPExcel_Shared_Date::ExcelToPHP($_DATOS_EXCEL[$i]['FESTATUS']));
                                                            }
                                                        } */
                                                        

                                                    /* $Hora_excel = $objPHPExcel->getActiveSheet()->getCell('C'.$i);
                                                    $_DATOS_EXCEL[$i]['Hora'] = $Hora_excel->getValue();
                                                        if(PHPExcel_Shared_Date::isDateTime($Hora_excel)){
                                                        $_DATOS_EXCEL[$i]['Hora'] = date($format = "H:i:s", PHPExcel_Shared_Date::ExcelToPHP($_DATOS_EXCEL[$i]['Hora']));
                                                        } */
                                                        
                                                }
                                            }
                                            //si por algo no cargo el archivo bak_  12602
                                            else {
                                                echo "Necesitas primero importar el archivo";
                                            }
                                            $errores = 0;
                                            //recorremos el arreglo multidimensional 
                                            //para ir recuperando los datos obtenidos
                                            //del excel e ir insertandolos en la BD
                                            foreach ($_DATOS_EXCEL as $campo => $valor) {
                                                //$sql = "INSERT INTO Categorias (Nombre, Importado) VALUES ( '";   //todas las columnas de lo contrario se especifica cuales columnas reciben datos
                                                $sql = "INSERT INTO Productos (Nombre, PrecioCompra, PrecioVenta, Codigo, ID_Categoria, ID_Proveedor, Existencia, Fecha_Ingreso, ID_Sucursal, Importado) VALUES ( '";
                                                foreach ($valor as $campo2 => $valor2) {

                                                    $sql = $sql. $valor2."','";
                                                }
                                                $sql = $sql."5',' by <⚡︎> Blitzc0de'); ";    
                                                //$sql = $sql." by <⚡︎> Blitzc0de'); ";                                       
                                                //echo $sql;   //verica la consulta
                                                
                                                $result = mysqli_query($conexion, $sql);
                                                if (!$result) {
                                                    //echo "Error al insertar registro " . $campo;
                                                    $errores+=1;
                                                    echo $sql;
                                                }


                                            }
                                            //echo $sql;
                                            echo "<strong><center>ARCHIVO IMPORTADO CON EXITO, EN TOTAL $campo REGISTROS Y $errores ERRORES</center></strong>";
                                            //una vez terminado el proceso borramos el archivo que esta en el servidor el bak_
                                            unlink($destino);
                                        }
                                        ?>
            </div>

            <div class="row justify-content-end">

            </div>
        </div>
    </div>
</div>
<?php include_once "lib/Footer.php" ?>