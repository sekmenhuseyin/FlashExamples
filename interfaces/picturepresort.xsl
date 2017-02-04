<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml"/>
<xsl:template match="/photos">
<xsl:element name="photos">
<xsl:apply-templates select="picture"/>
</xsl:element>
</xsl:template>

<xsl:template match="picture">

<xsl:choose>
<xsl:when test="substring(title,1,4)='The '">

<xsl:element name="ptitle">
<xsl:value-of select="substring(title,1,4)"/>
</xsl:element>
<xsl:element name="title">
<xsl:value-of select="substring(title,5)"/>
</xsl:element>
</xsl:when>
<xsl:when test="substring(title,1,3)='An '">

<xsl:element name="ptitle">
<xsl:value-of select="substring(title,1,3)"/>
</xsl:element>
 
<xsl:element name="title">
<xsl:value-of select="substring(title,4)"/>
</xsl:element>
</xsl:when>
<xsl:when test="substring(title,1,2)='A '">

<xsl:element name="ptitle">
<xsl:value-of select="substring(title,1,2)"/>
</xsl:element>
 
<xsl:element name="title">
<xsl:value-of select="substring(title,3)"/>
</xsl:element>
</xsl:when>
<xsl:otherwise>

<xsl:element name="title">
<xsl:value-of select="title"/>

</xsl:element>
</xsl:otherwise>
</xsl:choose>

<xsl:apply-templates select="filename"/>
<xsl:apply-templates select="person"/>

</xsl:template>

<xsl:template match="filename">

<xsl:element name="filename">
<xsl:value-of select="."/>
</xsl:element>
</xsl:template>
<xsl:template match="person">

<xsl:element name="person">
<xsl:value-of select="."/>
</xsl:element>
</xsl:template>
</xsl:stylesheet>