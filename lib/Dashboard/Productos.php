<?php
include_once "../cnx.php";
    
    $total = array();
    for($i=5; $i<9; $i++){
        $sqltip = "SELECT COUNT(ID_Venta) as total FROM Ventas WHERE ID_Personal = ".$i;
        $queritip = $conexion -> query ($sqltip);
        $TotalContTip = mysqli_fetch_array($queritip);
        $total[] = $TotalContTip['total'];
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