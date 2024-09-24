<?php
include_once "../cnx.php";

    $total = array();
    for($i=1; $i<4; $i++){
        $sqldepa = "SELECT COUNT(ID_Medio) as total FROM Ventas WHERE ID_Medio = ".$i;
        $queridepa = $conexion -> query ($sqldepa);
        $TotalContDepa = mysqli_fetch_array($queridepa);
        $total[] = $TotalContDepa['total'];
        
    }
    echo json_encode($total, JSON_NUMERIC_CHECK);
    

    /* $sql1elec = "SELECT COUNT(ID_AudiApoy) as Total FROM Audiencias ";
        $quer1elec = $conexion -> query ($sql1elec);
            while($elector = mysqli_fetch_array($quer1elec)){

               $data[] = array(x=> $hora,  y=> $total);
               //$lecturas[$i]=>$data;
            
            }


       echo json_encode($data);  */
?>