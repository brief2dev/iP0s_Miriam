<?php
include_once "../cnx.php";
const NombreMeses = [
  "Enero",
  "Febrero",
  "Marzo",
  "Abril",
  "Mayo",
  "Junio",
  "Julio",
  "Agosto",
  "Septiembre",
  "Octubre",
  "Noviembre",
  "Diciembre",
]; 
    const hora = 'Hora';
    const x = 'x';
    const y = 'y';

    $data = array();
    $sql1elec = "SELECT COUNT(ID_Venta) as Total, MONTH(Fecha) as Mes FROM Ventas WHERE YEAR(Fecha) = YEAR(CURDATE()) GROUP BY MONTH(Fecha)";
        $quer1elec = $conexion -> query ($sql1elec);
            while($elector = mysqli_fetch_array($quer1elec)){
               $hora=NombreMeses[$elector['Mes']-1];
               $total=$elector['Total'];
               $data[] = array(x=> $hora,  y=> $total);
               //$lecturas[$i]=>$data;
            
            }

    /* for ($i=0;$i<count($lecturas);$i++){     
        
         }  */

       echo json_encode($data);
?>