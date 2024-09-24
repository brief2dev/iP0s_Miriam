<?php
if (!isset($_POST["Codigo"])) {
    return;
}

$codigo = $_POST["Codigo"];
include_once "./../conexion.php";
$sentencia = $base_de_datos->prepare("SELECT * FROM Productos WHERE Codigo = ? LIMIT 1;");
$sentencia->execute([$codigo]);
$producto = $sentencia->fetch(PDO::FETCH_OBJ);
# Si no existe, salimos y lo indicamos
if (!$producto) {
    header("Location: ./../../VDev.php?status=4");
    exit;
}
# Si no hay existencia...

session_start();
# Buscar producto dentro del cartito
$indice = false;
for ($i = 0; $i < count($_SESSION["dev"]); $i++) {
    if ($_SESSION["dev"][$i]->Codigo === $codigo) {
        $indice = $i;
        break;
    }
}
# Si no existe, lo agregamos como nuevo
if ($indice === false) {
    $producto->Cantidad = 1;
    $producto->total = $producto->PrecioVenta;
    array_push($_SESSION["dev"], $producto);
} else {
    # Si ya existe, se agrega la cantidad
    # Pero espera, tal vez ya no haya
    $cantidadExistente = $_SESSION["dev"][$indice]->Cantidad;
    # si al sumarle uno supera lo que existe, no se agrega
    if ($cantidadExistente + 1 > $producto->Existencia) {
        header("Location: ./../../VDev.php?status=5");
        exit;
    }
    $_SESSION["dev"][$indice]->Cantidad++;
    $_SESSION["dev"][$indice]->total = $_SESSION["dev"][$indice]->Cantidad * $_SESSION["dev"][$indice]->PrecioVenta;
}
header("Location: ./../../VDev.php");
