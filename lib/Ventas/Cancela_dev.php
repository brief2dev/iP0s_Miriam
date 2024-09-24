<?php

session_start();

unset($_SESSION["cam"]);
$_SESSION["cam"] = [];
unset($_SESSION["dev"]);
$_SESSION["dev"] = [];

header("Location: ./../../VDev.php?status=2");
?>