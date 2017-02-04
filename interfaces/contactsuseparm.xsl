<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:output method="html"/>
  <xsl:param name="subj"/>
  <xsl:template match="/">
  <html>
  <head>
  <title>Faculty </title>
  </head>
  <body> <h1>Here is the 
<xsl:value-of select="$subj"/>
faculty  </h1> <br/>
<table border="2">
<tr><th>Name </th> <th> E-mail </th> </tr>
 <xsl:for-each select="mylist/contact">
  <xsl:sort select="name"/>
   <xsl:choose>
     <xsl:when test="discipline=$subj">
    <tr><td>
     <xsl:value-of select="name"/></td> 
     <td>
         <xsl:value-of select="email"/></td>
      </tr>
     </xsl:when>
    </xsl:choose>
  </xsl:for-each>
</table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>

