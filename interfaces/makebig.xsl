<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output method="html" />
<xsl:template match="/sets">
<html>
<head>
<title> Rollover test </title>
<script language="JavaScript" type="text/javascript" src="moveinsplus.js">
</script>
</head>
<body>
Pictures <br/>
<form name="f">
<input type="text" size="100" name="cap" value="Click for larger picture"/>
</form>
   <xsl:apply-templates select="/sets/set"/>
</body>
</html>
</xsl:template>
<xsl:template match="set"> 
<xsl:variable name="imagenum" select="position()"/>
  <xsl:element name="a">
  <xsl:attribute name="href">javascript:enlarge('<xsl:value-of select="caption"/>','<xsl:value-of select="$imagenum"/>');</xsl:attribute>
  <xsl:attribute name="onMouseOver">moveins('<xsl:value-of           select="nimage"/>','<xsl:value-of select="$imagenum"/>');</xsl:attribute>
  <xsl:attribute name="onMouseOut">moveins('<xsl:value-of           select="oimage"/>','<xsl:value-of select="$imagenum"/>'); makesmall('<xsl:value-of select="$imagenum"/>');</xsl:attribute>
   <xsl:element name="img">
    <xsl:attribute name="src"><xsl:value-of select="oimage"/></xsl:attribute>
    <xsl:attribute name="width">100</xsl:attribute>
  </xsl:element>
 </xsl:element>
 <br/>
</xsl:template>
</xsl:stylesheet>