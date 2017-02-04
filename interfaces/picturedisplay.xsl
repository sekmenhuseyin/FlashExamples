<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:output method="html"/>
  <xsl:param name="title"/>
  <xsl:param name="framechoice"/>
  <xsl:template match="/">
  <html>
  <head>
  <title><xsl:value-of select="$title"/></title>
  <LINK REL="stylesheet" TYPE="text/css" HREF="pictures.css" /> 
  </head>
  <body> 

 <xsl:for-each select="photos/picture[title=$title]">
 
 <div id="framebase">
     <xsl:choose>
             <xsl:when test="$framechoice='red wood'">
              <img src="redtop.gif"/>
             </xsl:when>
             <xsl:when test="$framechoice='silver'">
                    <img src="silvertop.gif" />
             </xsl:when>
             <xsl:when test="$framechoice='blue'">
                    <img src="bluetop.gif" />
             </xsl:when>
      </xsl:choose>
  <div id="picture">
 	<xsl:element name="img">
	    <xsl:attribute name="src"><xsl:value-of select="filename"/></xsl:attribute>
	    <xsl:attribute name="width">300</xsl:attribute>
        </xsl:element>
 </div>
 </div>
 
 
  </xsl:for-each>
<br/>
<h1>
<xsl:value-of select="$title"/>
 </h1> 
</body>
</html>
</xsl:template>
</xsl:stylesheet>

