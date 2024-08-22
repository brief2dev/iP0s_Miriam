<!----------------------------------Alerts-------------------------------------------->
<?php
			                if(isset($_GET["code"])){
				                if($_GET["code"] === "1"){
					    ?>
<script>
function alerta() {
    swal({
        position: 'top-end',
        icon: 'success',
        title: "Correcto!",
        text: "Datos Agregados Crorrectamente ",
        showConfirmButton: false,
        timer: 1800
    });
}
alerta();
</script>
<?php
                                }
                                if($_GET["code"] === "2"){
                        ?>
<script>
function alerta() {
    swal({
        title: "Oops!",
        text: "Ocurrio un error al procesar los datos",
        icon: "error",
        type: "error",
        confirmButtonColor: "#3b5de7",
    });
}
alerta();
</script>
<?php
                                }
                                if($_GET["code"] === "3"){
                        ?>
<script>
function alerta() {
    swal({
        title: "Eliminado con Exito!",
        text: "",
        icon: "warning",
        type: "warning",
        confirmButtonColor: false,
    });
}
alerta();
</script>
<?php
                                }
                                 if($_GET["code"] === "4"){
                                     ?>
<script>
function alerta() {
    swal({
        title: "El Codigo del Producto ya existe!",
        text: "",
        icon: "warning",
        type: "warning",
        confirmButtonColor: false,
    });
}
alerta();
</script>
                                     <?php
                                     }
                            }
                        ?>
<!------------------------------END Alerts------------------------------------------->