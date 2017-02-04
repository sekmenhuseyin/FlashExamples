<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output method="html" />
<xsl:template match="/sets">
<html>
<head>
<title> Rollover test </title>
<script language="JavaScript" type="text/javascript" src="moveins.js">
</script>
</head>
<body>
Pictures <br/>
   <xsl:apply-templates select="/sets/set"/>
</body>
</html>
</xsl:template>
<xsl:template match="set"> 
<xsl:variable name="imagenum" select="position()"/>
  <xsl:element name="a">
  <xsl:attribute name="href"></xsl:attribute>
  <xsl:attribute name="onMouseOver">moveins('<xsl:value-of           select="nimage"/>','<xsl:value-of select="$imagenum"/>');</xsl:attribute>
  <xsl:attribute name="onMouseOut">moveins('<xsl:value-of           select="oimage"/>','<xsl:value-of select="$imagenum"/>');</xsl:attribute>
  <xsl:attribute name="onClick">return false;</xsl:attribute>
  <xsl:element name="img">
    <xsl:attribute name="src"><xsl:value-of select="oimage"/></xsl:attribute>
  </xsl:element>
 </xsl:element>
 <br/>
</xsl:template>
</xsl:stylesheet>