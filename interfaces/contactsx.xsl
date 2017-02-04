<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="date.xsl"/>
<xsl:include href="logo.xsl"/>
  <xsl:output method="html"/>
  <xsl:template match="/mylist">
  <html>
  <head>
  <title>My contact list </title>
  </head>
  <body> 

<br/>
<table border="2">
<tr><td>Name </td> <td> E-mail </td> <td> Date joined Purchase </td></tr>
  <xsl:apply-templates select="contact">
	<xsl:sort select="date"/>
  </xsl:apply-templates>
</table>
<xsl:call-template name="logo"/>
  </body>
 </html>
 </xsl:template>
 <xsl:template match="contact">
<tr>
 <xsl:apply-templates/>
  </tr>
 </xsl:template>
<xsl:template match="name">
<td>
 <xsl:value-of select="."/></td> 
</xsl:template>
<xsl:template match="email">
   <td><a href="{email}"><xsl:value-of select="."/></a>
   </td>
</xsl:template>
</xsl:stylesheet>

