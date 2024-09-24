//var url = "http://my-json-server.typicode.com/apexcharts/apexcharts.js/yearly";
var url = "lib/Dashboard/AuAnual.php";
console.log(url);
const fechay = new Date();
const añoActual = fechay.getFullYear();
console.log(fechay + "<- dwed ->" + añoActual);
$.getJSON(url, function (response) {
  AuAnual.updateSeries([
    { 
      name: "Ventas", //variable de la consul
      data: response,
    },
  ]);

  AuAnual.updateOptions({
    title: {
      text: "",
    },
    subtitle: {
      text: "Ventas del año: " + añoActual,
    },
  });

  //Recorre el json y optiene sus datos
  /* $.each(response, function (index) {
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

var AuAnual = new ApexCharts(document.querySelector("#AuAnual"), options);
AuAnual.render();

