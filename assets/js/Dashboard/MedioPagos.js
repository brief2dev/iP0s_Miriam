var url = "lib/Dashboard/GetMedios.php";
var url1 = "lib/Dashboard/MedioPagos.php";
console.log(url);
console.log(url1);

$.getJSON(url1, function (response) {
  mPago.updateSeries(response);
  console.log("serie: "+response);
  //console.log("constante " + [0, 2, 1, 1, 0, 0, 3, 0]);
}); //END getJSON
//-----------------------------------------------
$.getJSON(url, function (response1) {
  mPago.updateOptions({ labels: response1 });
  console.log("label "+response1);
});//END getJSON
//-----------------------------------------------


var options = {
  chart: {
    width: 380,
    type: "pie",
  },
  series: [],
  labels: [],
  
};
var mPago = new ApexCharts(document.querySelector("#mPago"), options);
mPago.render();

//Recorre el json y optiene sus datos

  /* $.each(response, function (index) {

  }); */