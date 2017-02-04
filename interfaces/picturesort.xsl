<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>
<xsl:template match="/photos">
<html>
<body>
<h1>Picture Archive</h1>
<center>
<table>
<xsl:apply-templates select="picture">
<xsl:sort select="title"/>
</xsl:apply-templates>
</table>
</center>
</body>
</html>
</xsl:template>

<xsl:template match="picture">
<tr>
<td>
<xsl:value-of select="ptitle"/>
<xsl:value-of select="title"/>
</td>
<td>
<xsl:element name="img">
<xsl:attribute name="width">
200
</xsl:attribute>
<xsl:attribute name="src">
<xsl:value-of select="filename"/>
</xsl:attribute>
</xsl:element>
</td>
</tr>
</xsl:template>

</xsl:stylesheet>