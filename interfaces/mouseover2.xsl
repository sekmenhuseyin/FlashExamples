<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output method="html" />
<xsl:template match="/pictures">
<html>
<head>
<title> Rollover test </title>
<script language="JavaScript" type="text/javascript" src="movein.js">
</script>
</head>
<body>
<xsl:element name="a">
  <xsl:attribute name="href"></xsl:attribute>
  <xsl:attribute name="onMouseOver">movein('<xsl:value-of select="nimage"/>');</xsl:attribute>
  <xsl:attribute name="onMouseOut">movein('<xsl:value-of select="oimage"/>');</xsl:attribute>
  <xsl:attribute name="onClick">return false;</xsl:attribute>
  <xsl:element name="img">
    <xsl:attribute name="src"><xsl:value-of select="oimage"/></xsl:attribute>
    <xsl:attribute name="name">picture1</xsl:attribute>
  </xsl:element>
</xsl:element>


</body>
</html>
</xsl:template>

</xsl:stylesheet>