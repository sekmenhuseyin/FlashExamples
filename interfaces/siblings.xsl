<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:output method="html"/>
  <xsl:key name="named" match="person" use="name"/>
  <xsl:param name="subj"/>
<xsl:variable name="subjparents" select="key('named', $subj)/par"/>
<xsl:variable name="subjgrandpars">
<xsl:for-each select="$subjparents">
 <xsl:call-template name="fetch_parents">
   <xsl:with-param name="pr" select="."/>
 </xsl:call-template>
</xsl:for-each>
</xsl:variable>

  <xsl:template match="/">
  <html>
  <head>
  <title>Siblings </title>
  </head>
  <body> <h1>Here is the family of 
<xsl:value-of select="$subj"/> </h1> <br/>
<xsl:for-each select="$subjparents">
<br/> A parent is:
  <xsl:apply-templates />
</xsl:for-each>
<p/>Siblings and cousins: <br/>
<xsl:for-each select="//person[name!=$subj]">
    <xsl:variable name="result">
       <xsl:call-template name="check_if_sibling">
		<xsl:with-param name="p" select="."/>
       </xsl:call-template>
    </xsl:variable>
  <xsl:choose>
   <xsl:when test="string($result)!=''">
      <xsl:value-of select="./name"/> is a sibling. <br/>
   </xsl:when>
   <xsl:otherwise>
     <xsl:variable name="result2">
       <xsl:call-template name="check_if_cousin">
         <xsl:with-param name="p" select="."/>
       </xsl:call-template>
     </xsl:variable>
      <xsl:if test="string($result2)!=''">
      <xsl:value-of select="./name"/> is a cousin. <br/>
      </xsl:if>
   </xsl:otherwise>
  </xsl:choose>
</xsl:for-each>
<p/>

<xsl:if test="string($subjgrandpars)!=''">
 Grandparents are 
<xsl:value-of select="substring($subjgrandpars,1,string-length($subjgrandpars)-5)"/>.<br/>
</xsl:if>

</body>
</html>
</xsl:template>
<xsl:template name="fetch_parents">
	<xsl:param name="pr"/>
  <xsl:for-each select="//person">
	<xsl:if test="./name=$pr">
          <xsl:for-each select="par">
		<xsl:value-of select="."/>
		<xsl:text> and </xsl:text>
          </xsl:for-each>
        </xsl:if>
  </xsl:for-each>
</xsl:template>
<xsl:template name="check_if_sibling">
<xsl:param name="p"/>
 <xsl:variable name="pparents" select="$p/par"/>
<xsl:for-each select="$pparents">
  <xsl:variable name="thisone">
  <xsl:value-of select="."/>
  </xsl:variable>
  <xsl:for-each select="$subjparents">
        <xsl:if test="$thisone=.">
       <xsl:value-of select="."/>
    </xsl:if>
  </xsl:for-each>
</xsl:for-each>
</xsl:template>
<xsl:template name="check_if_cousin">
<xsl:param name="p"/>
 <xsl:variable name="pparents" select="$p/par"/>
<xsl:variable name="pgrandpars">
<xsl:for-each select="$pparents">
 <xsl:call-template name="fetch_parents">
   <xsl:with-param name="pr" select="."/>
 </xsl:call-template>
</xsl:for-each>
</xsl:variable>
<xsl:choose>
  <xsl:when test="$pgrandpars=''"/>
  <xsl:when test="$subjgrandpars=''"/>
  <xsl:otherwise>
  <xsl:call-template name="findmatch">
     <xsl:with-param name="alist" select="$pgrandpars"/>
     <xsl:with-param name="blist" select="$subjgrandpars"/>
  </xsl:call-template>
  </xsl:otherwise>
</xsl:choose>
</xsl:template>
<xsl:template name="findmatch">
	<xsl:param name="alist"/>
        <xsl:param name="blist"/>
<xsl:variable name="first" select="substring-before($alist,' and ')"/>
<xsl:variable name="rest" select="substring-after($alist,' and ')"/>
<xsl:choose>
<xsl:when test="contains($blist,concat($first,' and '))">
  <xsl:value-of select="$first"/>
</xsl:when>
<xsl:when test="$rest!=''">
 <xsl:call-template name="findmatch">
  <xsl:with-param name="alist" select="$rest"/>
  <xsl:with-param name="blist" select="$blist"/>
</xsl:call-template>
</xsl:when>
</xsl:choose>
</xsl:template>
</xsl:stylesheet>

