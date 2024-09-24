function printImage(image) {
    var printWindow = window.open('', 'Print Window', 'width=150,Height=100 resizable=YES ');
    printWindow.document.write('<html><head><title>Print c0de</title>');
    printWindow.document.write('</head><body ><img src=\'');
    printWindow.document.write(image.src);
    printWindow.document.write('\' /  ></body></html>');
    printWindow.document.close();
    printWindow.print();
}