<?xml version="1.0" encoding="UTF-8" ?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output method="html" /> 
<xsl:param name="whichcat" /> 
<xsl:param name="whichones"/>
<xsl:template match="/">
<html>
<head>
  <title>List of <xsl:value-of select="$whichones" /> </title> 
  </head>
<body>
<h1><xsl:value-of select="$whichcat"/>:
   <xsl:value-of select="$whichones" />  </h1>
<xsl:for-each select="//book">
<xsl:if test="(($whichcat='author') and (author=$whichones)) or
              (($whichcat='title') and (title=$whichones)) or
		(($whichcat='publisher') and (publisher=$whichones)) or
		(($whichcat='year') and (year=$whichones))">
<hr/>
  <b><xsl:value-of select="title"/></b> by <br/>
  <xsl:for-each select="author">
    <xsl:value-of select="."/> <br/>
  </xsl:for-each>
 Published by <br/>
  <xsl:value-of select="publisher"/> in <xsl:value-of select="year"/>
 </xsl:if>
 </xsl:for-each> 
  </body>
  </html>
  </xsl:template>
  </xsl:stylesheet>