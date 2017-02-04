function moveins(image,idn,caption)
{ 
var n = parseInt(idn);
window.document.images[n-1].src=image;
}
function enlarge(caption,idn){
var n=parseInt(idn);
window.document.f.cap.value=caption;
window.document.images[n-1].width=300;
}
function makesmall(idn) {
var n=parseInt(idn);
window.document.images[n-1].width=100;
window.document.f.cap.value="Click for larger picture.";
}