<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:fo="http://www.w3.org/1999/XSL/Format">

<xsl:output doctype-public="-//WAPFORUM//DTD WML 1.3//EN"
            doctype-system="http://www.wapforum.org/DTD/wml13.dtd" />

<xsl:template match="/results">
 <wml>
   <xsl:apply-templates select="/results/match">
   <xsl:sort select="@feature" order="descending"/>
   </xsl:apply-templates>
 </wml>
</xsl:template>

<xsl:template match="match">
  <xsl:text>
  </xsl:text>
  <card id="{concat('m',position())}"> 
   <p>
   <xsl:value-of select="date"/> <br/>
  
     <xsl:value-of select="team[1] "/>
     <xsl:value-of select="team[1]/@score " />
     <xsl:text>,  </xsl:text>
     <xsl:value-of select="team[2] "/>
     <xsl:value-of select="team[2]/@score " /> 
   </p>
  <do type="prev" name="next" label="Next">
<xsl:variable name="nextp" select="position()+1" />
<xsl:variable name="nextpn" select="concat('#m',$nextp)" />
  <go href= "{$nextpn}" />
  </do>
  <do type="options" name="prev" label="Prev">
  <prev/>
  </do>
  </card>
</xsl:template>
</xsl:stylesheet>
      