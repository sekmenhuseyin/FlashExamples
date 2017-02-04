<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:output method="html"/>
  <xsl:template match="/mylist">
  <html>
  <head>
  <title>My contact list </title>
  </head>
  <body> <h1>Here is my contact list </h1> <br/>
  <xsl:apply-templates/>
  <br/> That's all.
  </body>
 </html>
 </xsl:template>
 <xsl:template match="contact">
  <b><xsl:value-of select="name"/></b> <br/>
   Email is: <xsl:value-of select="email"/>
  <hr/>
 </xsl:template>
</xsl:stylesheet>
