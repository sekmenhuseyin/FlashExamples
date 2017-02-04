<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output method="html" />
<xsl:template match="/major">
<html>
<head>
<title>Present Major</title>
</head>
<body>
<h2>Required courses</h2><br/>
   <xsl:apply-templates select="/major/required"/>
<h2> Options</h2><br/>
   <xsl:apply-templates select="/major/option"/>
</body>
</html>
</xsl:template>
<xsl:template match="required"> 
 <xsl:value-of select="@cn"/>: <xsl:value-of select="."/>
 <br/>
</xsl:template>
<xsl:template match="option">
Choose <xsl:value-of select="@num"/> from 
<xsl:for-each select="course">
<br/><xsl:value-of select="@cn"/>: <xsl:value-of select="."/>
</xsl:for-each>
<hr/>
</xsl:template>
</xsl:stylesheet>