//var url = 'http://my-json-server.typicode.com/apexcharts/apexcharts.js/yearly';
var url = "lib/Dashboard/AuEsteMes.php";
console.log(url);
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
const fechae = new Date(); 
const mesActual = fechae.getMonth();
$.getJSON(url, function (response) {
  AuEsteMes.updateSeries([
    { 
      name: "Ventas", //variable de la consul
      data: response,
    },
  ]);

  AuEsteMes.updateOptions({
    title: {
      text: "",
    },
    subtitle: {
      text: "Ventas del mes de: " + NombreMeses[mesActual],
    },
  });

  //Recorre el json y optiene sus datos
 /*  $.each(response, function (index) {
    console.log("x: " + response[index].x + " y: " + response[index].y);
    
  }); */

  
}); //END getJSON
//-----------------------------------------------
 var options = {
  chart: {
    type: "area",
  },
  dataLabels: {
    enabled: false,
  },
  series: [],
  title: {
    text: "Cargando!",
  },
  subtitle: {
    text: "Cargando!",
  },
  noData: {
    text: "Sin Datos!!",
  },
};

var AuEsteMes = new ApexCharts(document.querySelector("#AuEsteMes"), options);
AuEsteMes.render(); 
