<?php
date_default_timezone_set('America/Merida');
/* $DB = "u665967788_Berel"; 
$user = "u665967788_Berel_Ticul";
$pass = "sC*12Bg2"; */
$DB = "iP0s_Acuario"; 
$user = "Blitzc0de";
$pass = "Server*902";

$conexion = new mysqli("l187.155.190.231", $user, $pass, $DB);
if (!$conexion) {
    echo 'Error';
} else{
    echo 'Conectado';
} 
$conexion->set_charset("utf8");
?>