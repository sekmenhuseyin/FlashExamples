<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html"/>
  <xsl:template match="/mylist">
  <html>
  <head>
  <title>My contact list </title>
  </head>
  <body> <h1>Here is my contact list </h1> <br/>
<table border="2">
<tr><td>Name </td> <td> E-mail </td> </tr>
  <xsl:apply-templates/>
 
</table>
  </body>
 </html>
 </xsl:template>
 <xsl:template match="contact">
<tr><td>
 <xsl:value-of select="name"/></td> 
   <td><xsl:element name="a">
      <xsl:attribute name="href">mailto:
      <xsl:value-of select="email"/>
      </xsl:attribute>
      <xsl:value-of select="email"/>
      </xsl:element>
   </td>
  </tr>
 </xsl:template>
</xsl:stylesheet>

