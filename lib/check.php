
<?php
session_start();
include_once "cnx.php";

$username = $_POST['user'];
$password = $_POST['pass'];

if (empty($username)){
   //echo "Ingrese un nombre de usuario!!!";
   header("Location: ./../index.php?code=1");
}else{
if(empty($password)|| $password == " "){
      //echo "El campo de Contraseña no puede etar vacio!!!";
      header("Location: ./../index.php?code=2");
}
else{
         //echo "Datos correctos";
   $sql = "SELECT * FROM Personal WHERE Nombre = '$username' AND visible = 1 AND Baja = 0";
   $query = $conexion -> query ($sql);

   $login = $query->fetch_array(MYSQLI_ASSOC);
   if ($password==$login['Pass']) { 
      $_SESSION['loggedin'] = true;
      $_SESSION['username'] = $username;
      $_SESSION['ids'] = $login['ID_Personal'];//obtiene el id de usuario loguado para ventas
      $_SESSION['suc'] = $login['ID_Sucursal'];//Obtiene el id del departamento
      $_SESSION['cargo'] = $login['ID_Puesto'];
      $_SESSION['start'] = time();
      $_SESSION['expire'] = $_SESSION['start'] + (10* 60);
      if($_SESSION['cargo']==2){
         header('Location: GenAutoPay.php');
         //header('Location: ../Dashboard.php');//redirecciona a la dashboard admin
      }else{
         header('Location: GenAutoPay.php');
         //header('Location: ../Dashboard.php');//redirecciona a la dashboard del usuario
      }
      
   } else { 
      header("Location: ./../index.php?code=2");
   }
   mysqli_close($conexion); 
   }
}
 ?>