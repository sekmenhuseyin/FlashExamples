<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:output method="html"/>
  <xsl:param name="sortby" select="'name'"/>
  <xsl:template match="/">
  <html>
  <head>
  <title>Faculty </title>
  </head>
  <body> <h1>Here is the listed sorted by 
<xsl:value-of select="$sortby"/>.</h1> <br/>
<table border="2">
<tr><th>Name </th> <th> E-mail </th> <th> Discipline </th> </tr>
 <xsl:apply-templates select="//contact">
            <xsl:sort select="*[name(.)=$sortby]"/>
 </xsl:apply-templates>
</table>
</body>
</html>
</xsl:template>
<xsl:template match="contact">
  <tr>
       <td><xsl:value-of select="name"/></td> 
     <td><xsl:value-of select="email"/></td>
     <td><xsl:value-of select="discipline"/></td>
      </tr>
</xsl:template>
</xsl:stylesheet>

