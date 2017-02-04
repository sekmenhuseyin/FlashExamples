<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>
<xsl:template match="/photos">
<html>
<body>
<h1>Picture Archive</h1>
<center>

<xsl:apply-templates select="picture">
<xsl:sort select="title"/>
</xsl:apply-templates>

</center>
</body>
</html>
</xsl:template>

<xsl:template match="picture">
<xsl:if test="(position() mod 2)=1">
<br/>
</xsl:if>
<td>
<xsl:element name="img">
<xsl:attribute name="width">
200
</xsl:attribute>
<xsl:attribute name="src">
<xsl:value-of select="filename"/>
</xsl:attribute>
</xsl:element>
<br/>
<xsl:value-of select="ptitle"/>
<xsl:value-of select="title"/>
</td>
<xsl:if test="(position() mod 2) = 0">
<br/>
</xsl:if>
</xsl:template>

</xsl:stylesheet>