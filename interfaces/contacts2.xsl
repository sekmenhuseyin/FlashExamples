<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:output method="html"/>
  <xsl:template match="/">
  <html>
  <head>
  <title>My contact list </title>
  </head>
  <body> <h1>Here is my contact list </h1> <br/>
<table border="2">
<tr><th>Name </th> <th> E-mail </th> </tr>
 <xsl:for-each select="mylist/contact">
  <xsl:sort select="name"/>
    <tr><td>
     <xsl:value-of select="name"/></td> 
     <xsl:choose>
     <xsl:when test="name='Jeanine Meyer'">
     <td bgcolor="red"> 
      <xsl:value-of select="email"/></td>
     </xsl:when>
     <xsl:otherwise>
       <td>
   <xsl:value-of select="email"/></td>
     </xsl:otherwise>
     </xsl:choose>
     
    </tr>
  </xsl:for-each>
</table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>

