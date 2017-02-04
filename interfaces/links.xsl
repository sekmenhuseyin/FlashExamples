<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:output method="html"/>
  <xsl:template match="/mylist">
  <html>
  <head>
  <title>My links</title>
  </head>
  <body> <h1>Here are the websites I use the most</h1> <br/>
<table border="1">
<tr><td>Name </td> <td> Link </td> </tr>
  <xsl:apply-templates/>
 
</table>
  </body>
 </html>
 </xsl:template>
 <xsl:template match="favorite">
<tr><td>
 <xsl:value-of select="name"/></td> 
   <td> 
     <xsl:element name="a">
      <xsl:attribute name="href">
          <xsl:value-of select="url"/>
      </xsl:attribute>
        <xsl:value-of select="prompt"/>
     </xsl:element>
</td>
  </tr>
 </xsl:template>
</xsl:stylesheet>