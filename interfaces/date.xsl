<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="date">
<td>
<xsl:variable name="years" select="number(substring(.,1,4))"/>
<xsl:variable name="months" select="number(substring(.,6,2))"/>
<xsl:variable name="days" select="number(substring(.,9,2))"/>
<xsl:value-of select="$months"/>/<xsl:value-of select="$days"/>/<xsl:value-of select="$years"/>
</td>
</xsl:template>
</xsl:stylesheet>