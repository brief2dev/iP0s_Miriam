var url = "lib/Dashboard/GetProductos.php";
var url1 = "lib/Dashboard/Productos.php";
console.log(url);
console.log(url1);

$.getJSON(url1, function (response) {
  produc.updateSeries(response);
  console.log(response);
}); //END getJSON
//-----------------------------------------------
$.getJSON(url, function (response1) {
  produc.updateOptions({ labels: response1 });
  console.log(response1);
}); //END getJSON
//-----------------------------------------------

var options = {
  chart: {
    width: 380,
    type: "pie",
  },
  series: [],
  labels: [],
  colors: [
    "#304ffe",
    "#00b8d4",
    "#76ff03",
    "#0088a3",
    "#ff3d00",
    "#aa00ff",
    "#66ffa6",
    "#f57f17",
    "#4fc3f7",
    "#ba68c8",
    "#6d6d6d",
  ],
};

var produc = new ApexCharts(document.querySelector("#produc"), options);
produc.render();
