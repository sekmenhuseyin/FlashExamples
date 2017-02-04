<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">


<xsl:output method="html"/>
<xsl:template match="/lyrics">
<html><head><title>Singing </title></head>
<body>
<xsl:call-template name="singverse">
  <xsl:with-param name="counter">
  <xsl:value-of select="@start"/>
  </xsl:with-param>
</xsl:call-template>
</body>
</html>
</xsl:template> 

<xsl:template name="singverse">
<xsl:param name="counter" />
<br/>
<xsl:copy-of select="$counter"/> <xsl:value-of select="verse1" />
<br/>
<xsl:copy-of select="$counter"/><xsl:value-of select="verse2" />
<br/>
<xsl:value-of select="verse3" />
<br/>
<xsl:variable name="next" select="$counter - 1" />
<xsl:copy-of select="$next"/> <xsl:value-of select="verse1" />
<br/> **** <br/>
<xsl:if test="$next >=1" >
<xsl:call-template name="singverse">
  <xsl:with-param name="counter" select="$next" />
</xsl:call-template>
</xsl:if>
</xsl:template>


</xsl:stylesheet>
      