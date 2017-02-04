<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>
<xsl:template match="/">
<family>
<xsl:for-each select="//person">
<xsl:if test="not(./par)">
 <xsl:call-template name="find_descendants">
   <xsl:with-param name="gid" select="./name/@id"/>
   <xsl:with-param name="gname" select="./name"/>
   <xsl:with-param name="dashes" select="''"/>
 </xsl:call-template>
</xsl:if>
</xsl:for-each>
</family>
</xsl:template>
<xsl:template name="find_descendants">
<xsl:param name="gid"/>
<xsl:param name="gname"/>
<xsl:param name="dashes"/>
<p>
<xsl:value-of select="$dashes"/>
<xsl:value-of select="$gname"/> 
<xsl:for-each select="//person">
<xsl:if test="./par[@refid=$gid]">
<xsl:call-template name="find_descendants">
  <xsl:with-param name="gid" select="./name/@id"/>
  <xsl:with-param name="gname" select="./name"/>
  <xsl:with-param name="dashes" select="concat('---',$dashes)"/>
</xsl:call-template>
</xsl:if>
</xsl:for-each>
</p>
</xsl:template>
</xsl:stylesheet>

