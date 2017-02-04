<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
 xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output method="html"/>
<xsl:variable name="teams" select="//team[not(.=preceding::team)]"/>
<xsl:variable name="matches" select="//match"/>
<xsl:template match="/results">
 <html>
 <head><title>Results of World Cup
      </title>
<LINK REL="stylesheet" TYPE="text/css" HREF="results.css"/>

</head>
  <body>
 <h2> Results of World Cup </h2>
<table cellpadding="5">
 <tr>
  <th> Team </th>
  <th> Played </th>
  <th> Won    </th>
  <th> Lost   </th>
  <th> Tied   </th>
  <th> For    </th>
  <th> Against </th>
  <th> Points  </th>
 </tr>
<xsl:for-each select ="$teams">
  <xsl:variable name="this" select="."/>
  <xsl:variable name="played" select="count($matches[team=$this])"/>
  <xsl:variable name="won" select="count($matches[team[.=$this]/@score &gt; 
                                                   team[.!=$this]/@score])"/>
  <xsl:variable name="lost" select="count($matches[team[.=$this]/@score &lt; 
                                                   team[.!=$this]/@score])"/>
  <xsl:variable name="tied" select="count($matches[team[.=$this]/@score = team[.!=$this]/@score])"/>
  <xsl:variable name="for" select="sum($matches/team[.=current()]/@score)"/>
  <xsl:variable name="against" select="sum($matches[team=current()]/team/@score)-$for"/>
  <xsl:variable name="points" select="3*$won+$tied"/>
 <tr>
<td><xsl:value-of select="."/></td>
<td><xsl:value-of select="$played"/></td>
<td><xsl:value-of select="$won"/></td>
<td><xsl:value-of select="$lost"/></td>
<td><xsl:value-of select="$tied"/></td>
<td><xsl:value-of select="$for"/></td>
<td><xsl:value-of select="$against"/></td>
<td><xsl:value-of select="$points"/> </td>
</tr>

</xsl:for-each>
</table>
  </body> </html>
</xsl:template>
</xsl:stylesheet>
      