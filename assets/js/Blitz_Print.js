function Blitz_Print(url) {
    console.log(url);
  var iframe = document.createElement("iframe");
  // iframe.id = 'pdfIframe'
  iframe.className = "pdfIframe";
  document.body.appendChild(iframe);
  //iframe.style.display = "none";
  iframe.src = url;
  iframe.onload = function () {
    setTimeout(function () {
      iframe.focus();
      iframe.contentWindow.print();
      //URL.revokeObjectURL(url);
      // document.body.removeChild(iframe)
    }, 300);
  };
  
  // URL.revokeObjectURL(url)
}
