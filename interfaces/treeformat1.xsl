<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
<xsl:template match="/">
<family>
<xsl:for-each select="//person">
<xsl:if test="not(./par)">
 <xsl:call-template name="find_descendants">
   <xsl:with-param name="gn" select="."/>
   <xsl:with-param name="gid" select="./name/@id"/>
   <xsl:with-param name="gname" select="./name"/>
 </xsl:call-template>
</xsl:if>
</xsl:for-each>
</family>
</xsl:template>
<xsl:template name="find_descendants">
<xsl:param name="gn"/>
<xsl:param name="gid"/>
<xsl:param name="gname"/>
<xsl:element name="{$gname}">
<xsl:for-each select="//person">
<xsl:if test="./par[@refid=$gid]">
<xsl:call-template name="find_descendants">
  <xsl:with-param name="gn" select="."/>
  <xsl:with-param name="gid" select="./name/@id"/>
  <xsl:with-param name="gname" select="./name"/>
</xsl:call-template>
</xsl:if>
</xsl:for-each>
</xsl:element>
</xsl:template>
</xsl:stylesheet>

