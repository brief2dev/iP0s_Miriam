let params = new URLSearchParams(location.search); //obtinene un vlir de get y lo pone en variable js
var prodId = params.get("idv");
var statuss = params.get("status");
var destino = params.get("venta");

if (statuss == 1) {
  console.log("ewe" + destino);
  switch (destino) {
    case "1":
      //VENTA
      var urlpdfprint = "Ticket.php?id=" + prodId;
      venta_ticket();
      break;
    case "0":
      //ABONO
      var urlpdfprint = "T_Comprobante.php?id=" + prodId;
      abono_ticket();
      break;
    case "3":
      //CORTE
      var urlpdfprint = "T_CajaC.php?id=" + prodId;
      corte_ticket();
      break;
    case "4":
      //CAMBIO
      var urlpdfprint = "T_Camb.php?id=" + prodId;
      cambio_ticket();
      break;
    case "5":
      //Mutualista
      var urlpdfprint = "T_Mut.php?mt=1&id=" + prodId;
      mutualista_ticket();
      break;


    default:
      break;
  }
}

function venta_ticket() {
  Swal.fire({
    title: "Venta realizada Correctamente!",
    text: "Imprimir ticket?",
    type: "success",
    icon: "success",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    confirmButtonText: " SI",
    cancelButtonText: "NO",
  }).then((resultado) => {
    if (resultado.value) {
      // Hicieron click en "Sí"
      Blitz_Print(urlpdfprint);
      //window.open('Ticket.php?id=' + prodId, '_blank');
    } else {
      // Dijeron que no
      console.log("*NO se elimina la venta*");
    }
  });
}
function cambio_ticket() {
  Swal.fire({
    title: "Cambios Guardados!",
    text: "Imprimir ticket?",
    type: "success",
    icon: "success",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    confirmButtonText: " SI",
    cancelButtonText: "NO",
  }).then((resultado) => {
    if (resultado.value) {
      // Hicieron click en "Sí"
      Blitz_Print(urlpdfprint);
      //window.open('Ticket.php?id=' + prodId, '_blank');
    } else {
      // Dijeron que no
      console.log("*NO se elimina la venta*");
    }
  });
}
function abono_ticket() {
  Swal.fire({
    title: "Abono Guardado",
    text: "Imprimir Comprobante?",
    type: "success",
    icon: "success",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    confirmButtonText: " SI",
    cancelButtonText: "NO",
  }).then((resultado) => {
    if (resultado.value) {
      // Hicieron click en "Sí"
      Blitz_Print(urlpdfprint);
      //window.open('Ticket.php?id=' + prodId, '_blank');
    } else {
      // Dijeron que no
      console.log("*NO se elimina la venta*");
    }
  });
}
function corte_ticket() {
  Swal.fire({
    title: "Correcto!!",
    text: "Imprimir Comprobante?",
    type: "success",
    icon: "success",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    confirmButtonText: " SI",
    cancelButtonText: "NO",
  }).then((resultado) => {
    if (resultado.value) {
      // Hicieron click en "Sí"
      Blitz_Print(urlpdfprint);
      //window.open('Ticket.php?id=' + prodId, '_blank');
    } else {
      // Dijeron que no
      console.log("*NO se elimina la venta*");
    }
  });
}
function mutualista_ticket() {
  Swal.fire({
    title: "Abono guardado",
    text: "Imprimir ticket",
    type: "success",
    icon: "success",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    confirmButtonText: " SI",
    cancelButtonText: "NO",
  }).then((resultado) => {
    if (resultado.value) {
      // Hicieron click en "Sí"
      Blitz_Print(urlpdfprint);
      //window.open('Ticket.php?id=' + prodId, '_blank');
    } else {
      // Dijeron que no
      console.log("*NO se elimina la venta*");
    }
  });
}

