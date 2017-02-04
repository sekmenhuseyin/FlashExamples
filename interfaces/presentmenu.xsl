<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:output method="html"/>
   <xsl:template match="/">
  <html>
  <head>
  <title>Photo Store menu</title>
  <script language="JavaScript" type="text/javascript" src="displaypicture.js"/> 
  <script>
  function makeorder() {
   var title;
   var framestyle;
   var i;
   for (i=0;i&lt;document.f.choice.length;i++)  {
      if (document.f.choice[i].checked) {
        title = document.f.choice[i].value;
      }
   }
   selectbox = document.f.frametypes;
   framestyle = selectbox.options[selectbox.selectedIndex].value;
   //alert("You ordered "+title+" in frame "+framestyle);
   displaypicture(title,framestyle);
  }
  </script>
  
  </head>
  <body> 
<form name="f" onsubmit="makeorder();">
 <xsl:for-each select="//picture">
 <xsl:element name="input">
   <xsl:attribute name="type">radio</xsl:attribute>
   <xsl:attribute name="name">choice</xsl:attribute>
   <xsl:attribute name="value"><xsl:value-of select="title"/></xsl:attribute>
 </xsl:element>
 <xsl:element name="img">
    <xsl:attribute name="src"><xsl:value-of select="filename"/></xsl:attribute>
    <xsl:attribute name="width">100</xsl:attribute>
 </xsl:element> 
 </xsl:for-each>
<br/>
<xsl:element name="select">
 <xsl:attribute name="name">frametypes</xsl:attribute>
<xsl:for-each select="//frametype">

 <xsl:element name="option">
  <xsl:attribute name="value">
		<xsl:value-of select="framename"/> </xsl:attribute>
		<xsl:value-of select="framename"/>
 </xsl:element>
 </xsl:for-each>
</xsl:element>
<input type="submit" value="ORDER"/>
</form>
</body>
</html>
</xsl:template>
</xsl:stylesheet>

