<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output method="html" />
<xsl:template match="/major">
<html>
<head>
<title>Present Major</title>
<script language="JavaScript" type="text/javascript" src="make.js">
</script>
</head>
<body>
<h2>Required courses</h2><br/>
<form onsubmit="return make(this);">
   <xsl:apply-templates select="/major/required"/>
<h2> Options</h2><br/>
   <xsl:apply-templates select="/major/option"/>
<input type="submit" value="check"/>
</form>
</body>
</html>
</xsl:template>
<xsl:template match="required"> 
  <xsl:element name="input">
  <xsl:attribute name="type">checkbox</xsl:attribute>
  <xsl:attribute name="name">rlist</xsl:attribute>
  <xsl:attribute name="value"><xsl:value-of select="@cn"/></xsl:attribute>
  </xsl:element>
  <xsl:value-of select="."/>
 <br/>
</xsl:template>
<xsl:template match="option">
<xsl:variable name="reqnum" select="position()"/>
 <xsl:element name="input">
  <xsl:attribute name="type">hidden</xsl:attribute>
  <xsl:attribute name="name">ocounts</xsl:attribute>
  <xsl:attribute name="value"><xsl:value-of select="@num"/></xsl:attribute>
  </xsl:element>
Choose <xsl:value-of select="@num"/> from 
<xsl:for-each select="course">
 <xsl:element name="input">
  <xsl:attribute name="type">checkbox</xsl:attribute>
  <xsl:attribute name="name">olist<xsl:value-of select="$reqnum"/></xsl:attribute>
  <xsl:attribute name="value"><xsl:value-of select="@cn"/></xsl:attribute>
  </xsl:element> <xsl:value-of select="."/>
</xsl:for-each>
<br/>
</xsl:template>
</xsl:stylesheet>