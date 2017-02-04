function displayitems(category,item){
  // load the xslt file

try {
var xslt = new ActiveXObject("Msxml2.XSLTemplate");
var xslDoc = new ActiveXObject("Msxml2.FreeThreadedDOMDocument");
var xslProc;
xslDoc.async = false;
xslDoc.resolveExternals = false;
xslDoc.load("displayitemsbycat.xsl");
xslt.stylesheet = xslDoc;
var xmlDoc = new ActiveXObject("Msxml2.DOMDocument");
xmlDoc.async = false;
xmlDoc.resolveExternals = false;
xmlDoc.load("books.xml");
xslProc = xslt.createProcessor();
xslProc.input = xmlDoc;
xslProc.addParameter("whichcat", category);
xslProc.addParameter("whichones",item);
xslProc.transform();
document.write(xslProc.output);
}
catch(e) {
try{
var xslStylesheet;
var xsltProcessor = new XSLTProcessor();
var myDOM;
var xmlDoc;
  var myXMLHTTPRequest = new XMLHttpRequest();
  myXMLHTTPRequest.open("GET", "displayitemsbycat.xsl", false);
  myXMLHTTPRequest.send(null);

  xslStylesheet = myXMLHTTPRequest.responseXML;
  xsltProcessor.importStylesheet(xslStylesheet);

  // load the xml file
  myXMLHTTPRequest = new XMLHttpRequest();
  myXMLHTTPRequest.open("GET", "books.xml", false);
  myXMLHTTPRequest.send(null);
  xmlDoc = myXMLHTTPRequest.responseXML;

  // set the parameter using the parameter passed to the outputgroup function
  xsltProcessor.setParameter(null,"whichcat",category);
   xsltProcessor.setParameter(null,"whichones",item);
  var fragment = xsltProcessor.transformToFragment(xmlDoc,document);
  document.getElementById("answer").innerHTML = "";
   myDOM = fragment;
  document.getElementById("answer").appendChild(fragment);
}
catch(e) {
  alert("Unable to do xml/xsl processing");
}
}

}