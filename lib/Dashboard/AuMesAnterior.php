<?php
include_once "../cnx.php";

    const hora = 'Hora';
    const x = 'x';
    const y = 'y';

    $data = array();
    $sql1elec = "SELECT COUNT(ID_Venta) as Total, Fecha as Fech FROM Ventas WHERE MONTH(Fecha) = MONTH(CURDATE()- INTERVAL 1 MONTH) GROUP BY Fecha";
        $quer1elec = $conexion -> query ($sql1elec);
            while($elector = mysqli_fetch_array($quer1elec)){
               $hora=$elector['Fech'];
               $total=$elector['Total'];
               $data[] = array(x=> $hora,  y=> $total);
               //$lecturas[$i]=>$data;
            
            }

    /* for ($i=0;$i<count($lecturas);$i++){     
        
         }  */

       echo json_encode($data);
?>