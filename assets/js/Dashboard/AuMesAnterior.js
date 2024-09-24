//var url = "http://my-json-server.typicode.com/apexcharts/apexcharts.js/yearly";
var url = "lib/Dashboard/AuMesAnterior.php";
console.log(url);
const fechama = new Date(); 
const mesAnterior = fechama.getMonth()-1; 
console.log(fechama + "<- dwed ->" + mesAnterior);

$.getJSON(url, function (response) {
  AuMesAnterior.updateSeries([
    {
      name: "Ventas", //variable de la consul
      data: response,
    },
  ]);

  AuMesAnterior.updateOptions({
    title: {
      text: "",
    },
    subtitle: {
      text: "Ventas del mes de: " + NombreMeses[mesAnterior],
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

var AuMesAnterior = new ApexCharts(document.querySelector("#AuMesAnterior"), options);
AuMesAnterior.render();

