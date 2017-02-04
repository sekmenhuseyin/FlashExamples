function displaypicture(title,framestyle){
  // load the xslt file
//alert("in displaypicture, title is "+title+" framestyle is "+framestyle);
try {
var xslt = new ActiveXObject("Msxml2.XSLTemplate");
var xslDoc = new ActiveXObject("Msxml2.FreeThreadedDOMDocument");
var xslProc;
xslDoc.async = false;
xslDoc.resolveExternals = false;
xslDoc.load("picturedisplay.xsl");
xslt.stylesheet = xslDoc;
var xmlDoc = new ActiveXObject("Msxml2.DOMDocument");
xmlDoc.async = false;
xmlDoc.resolveExternals = false;
xmlDoc.load("picturearchive.xml");
xslProc = xslt.createProcessor();
xslProc.input = xmlDoc;
xslProc.addParameter("title", title);
xslProc.addParameter("framechoice",framestyle);
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
  myXMLHTTPRequest.open("GET", "picturedisplay.xsl", false);
  myXMLHTTPRequest.send(null);

  xslStylesheet = myXMLHTTPRequest.responseXML;
  xsltProcessor.importStylesheet(xslStylesheet);

  // load the xml file
  myXMLHTTPRequest = new XMLHttpRequest();
  myXMLHTTPRequest.open("GET", "picturearchive.xml", false);
  myXMLHTTPRequest.send(null);
  xmlDoc = myXMLHTTPRequest.responseXML;

  // set the parameter using the parameter passed to the outputgroup function
  xsltProcessor.setParameter(null,"title",title);
  xsltProcessor.setParameter(null,"framechoice",framestyle);
  var fragment = xsltProcessor.transformToFragment(xmlDoc,document);
  document.getElementById("answer").innerHTML = "";
   myDOM = fragment;
  document.getElementById("answer").appendChild(fragment);
}
catch(e) {
  alert("Unable to do xml/xsl processing");
}
}
return false;
}

