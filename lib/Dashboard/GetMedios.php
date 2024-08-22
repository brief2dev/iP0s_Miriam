<?php
include_once "../cnx.php";

    $total = array();
    try{
         $sqldepa = "SELECT Tipo FROM Medio_Pago ORDER BY ID_Medio ASC";
    $queridepa = $conexion -> query ($sqldepa);
    while($TotalContDepa = mysqli_fetch_array($queridepa)){
        $total[] = $TotalContDepa['Tipo'];
    }
 
    echo json_encode($total);
    }catch(Exeption $e){
        echo $e;
    }
   

    /* $sql1elec = "SELECT COUNT(ID_AudiApoy) as Total FROM Audiencias ";
        $quer1elec = $conexion -> query ($sql1elec);
            while($elector = mysqli_fetch_array($quer1elec)){

               $data[] = array(x=> $hora,  y=> $total);
               //$lecturas[$i]=>$data;
            
            }


       echo json_encode($data);  */
?>