<?php
date_default_timezone_set('America/Merida');
/* $DB = "u665967788_Berel"; 
$user = "u665967788_Berel_Ticul";
$pass = "sC*12Bg2"; */
/* $DB = "ModaMiriam"; 
$user = "root";
$pass = "Blitzc0de"; */


$DB = "Miriam"; 
$user = "root";
$pass = "Blitzc0de";
try{
	$base_de_datos = new PDO('mysql:host=localhost;dbname=' . $DB, $user, $pass);
	$base_de_datos->query("set names utf8;");
    $base_de_datos->setAttribute(PDO::ATTR_EMULATE_PREPARES, FALSE);
    $base_de_datos->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $base_de_datos->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_OBJ);
}catch(Exception $e){
	echo "Ocurrió algo con la base de datos: " . $e->getMessage();
}
if(!$base_de_datos){
    echo 'Error';
}else{
    //echo 'Conectado';
}
?>