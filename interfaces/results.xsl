<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
 xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output method="html"/>
<xsl:template match="/results">
 <html>
 <head><title>Results of World Cup
      </title>
<LINK REL="stylesheet" TYPE="text/css" HREF="results.css"/>

</head>
  <body>
   <xsl:apply-templates select="/results/match">
    <xsl:sort select="@feature" order="descending"/>
    
   </xsl:apply-templates>
  </body> </html>
</xsl:template>
<xsl:template match="match[@feature='yes']">
 <h2><xsl:value-of select="headline"/><br/> </h2>
 <table>
 <td>
 <xsl:value-of select="story"/>  </td>
 <td><img src="{picture}" /> </td>
</table>
 
 <p>Scores follow....</p>
</xsl:template>
<xsl:template match="match">
  <h3>
    <xsl:value-of select="team[1]"/> versus <xsl:value-of select="team[2]"/>
  </h3>
  <p>Played on <xsl:value-of select="date"/> </p>
  <p>Result: 
     <xsl:value-of select="team[1] "/>
     <xsl:value-of select="team[1]/@score " />
     <xsl:text>,  </xsl:text>
     <xsl:value-of select="team[2] "/>
     <xsl:value-of select="team[2]/@score " />
  </p>
</xsl:template>
</xsl:stylesheet>
      