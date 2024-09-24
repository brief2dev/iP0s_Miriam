<?php
include_once "../cnx.php";

    $total = array();
    $sqldepa = "SELECT * FROM Personal WHERE ID_Personal >= 5 ORDER BY ID_Personal ASC";
    $queridepa = $conexion -> query ($sqldepa);
    while($TotalContDepa = mysqli_fetch_array($queridepa)){
        $total[] = $TotalContDepa['Nombre'];
    }
 
    echo json_encode($total);

    /* $sql1elec = "SELECT COUNT(ID_AudiApoy) as Total FROM Audiencias ";
        $quer1elec = $conexion -> query ($sql1elec);
            while($elector = mysqli_fetch_array($quer1elec)){

               $data[] = array(x=> $hora,  y=> $total);
               //$lecturas[$i]=>$data;
            
            }


       echo json_encode($data);  */
?>