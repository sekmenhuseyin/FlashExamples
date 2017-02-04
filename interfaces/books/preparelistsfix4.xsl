<?xml version="1.0" encoding="UTF-8" ?> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output method="html" /> 
<xsl:param name="whichcat" /> 
<xsl:template match="/">
<html>
<head>
  <title>List of <xsl:value-of select="$whichcat" />s </title> 
  <script language="JavaScript" type="text/javascript" src="display.js">
</script>
  </head>
<body>
<h1><i>
   <xsl:value-of select="$whichcat" />s </i> </h1>
 <xsl:choose>
 <xsl:when test="'author'=$whichcat"> 
  <xsl:variable name="list" select="//author[not(.=preceding::author)]"/>
 <xsl:for-each select="$list">
  <xsl:element name="a">
  <xsl:attribute name="href">
  javascript:displayitems('<xsl:value-of select="$whichcat"/>','<xsl:value-of select="."/>');
  </xsl:attribute>
  <xsl:value-of select="."/>
  </xsl:element>
  <br/>
  </xsl:for-each>
 
 </xsl:when>
  <xsl:when test="'title'=$whichcat">

  <xsl:variable name="list" select="//title[not(.=preceding::title)]"/>
   <xsl:for-each select="$list">
   <b>
   <xsl:element name="a">
   <xsl:attribute name="href">
     javascript:displayitems('<xsl:value-of select="$whichcat"/>','<xsl:value-of select="."/>');
  </xsl:attribute>
    <xsl:value-of select="."/>
    </xsl:element>
    </b>
    <br/>
  </xsl:for-each>
  
 </xsl:when>
  <xsl:when test="'publisher'=$whichcat">

  <xsl:variable name="list" select="//publisher[not(.=preceding::publisher)]"/>
   <xsl:for-each select="$list">
   <xsl:element name="a">
   <xsl:attribute name="href">
     javascript:displayitems('<xsl:value-of select="$whichcat"/>','<xsl:value-of select="."/>');
  </xsl:attribute>
    <xsl:value-of select="."/>
    </xsl:element>
    <br/>
  </xsl:for-each>
 </xsl:when>
  <xsl:when test="'year'=$whichcat">

  <xsl:variable name="list" select="//year[not(.=preceding::year)]"/>
   <xsl:for-each select="$list">
   <i>
   <xsl:element name="a">
   <xsl:attribute name="href">
     javascript:displayitems('<xsl:value-of select="$whichcat"/>','<xsl:value-of select="."/>');
  </xsl:attribute>
    <xsl:value-of select="."/>
    </xsl:element>
    </i>
    <br/>
  </xsl:for-each>
 </xsl:when>
 
 </xsl:choose>
<p>If items do not appear, click on refresh and then make choice.</p> 
 
  </body>
  </html>
  </xsl:template>
  </xsl:stylesheet>