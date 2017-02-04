<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output method="html"/>
<xsl:template match="/animal">
<xsl:variable name="interval">
<xsl:value-of select="/statevariable[@name='interval']"/></xsl:variable>
<html>
<head>
<title> Virtual <xsl:value-of select="animalname" /></title>
<script language="JavaScript" type="text/javascript">
<xsl:comment>
<xsl:text>
var curstate='</xsl:text><xsl:value-of select="state[@start='yes']/@name"/><xsl:text>';
</xsl:text>
<xsl:for-each select="statevar">
  <xsl:text>var </xsl:text><xsl:value-of select="@name"/>
  <xsl:text>=</xsl:text><xsl:value-of select="."/>
  <xsl:text>;
  </xsl:text>
</xsl:for-each>
var tid;
<xsl:text>var statepictures=new Array();
var statelabels=new Array();
</xsl:text>
<xsl:for-each select="state">
<xsl:text>statepictures['</xsl:text>
<xsl:value-of select="./@name"/>
<xsl:text>']='</xsl:text><xsl:value-of select="./picture"/><xsl:text>';
statelabels['</xsl:text><xsl:value-of select="./@name"/><xsl:text>']='</xsl:text><xsl:value-of select="./label"/><xsl:text>';
</xsl:text>
</xsl:for-each>
<xsl:for-each select="function">
<xsl:value-of select="."/>
</xsl:for-each>
<xsl:text>
function change() 
{ 
</xsl:text>
<xsl:value-of select="intervalaction" />
<xsl:text>switch (curstate) {</xsl:text>
<xsl:for-each select="state"><xsl:text>
  case '</xsl:text><xsl:value-of select="./@name"/><xsl:text>': </xsl:text>
<xsl:for-each select="./switchcondition">
<xsl:text>if (</xsl:text><xsl:value-of select="./condition"/><xsl:text>) {
 curstate='</xsl:text><xsl:value-of select="./truestate"/><xsl:text>';}</xsl:text>
 <xsl:if test="./falsestate">
 <xsl:text>else {
   curstate='</xsl:text><xsl:value-of select="./falsestate"/><xsl:text>';}</xsl:text>
 </xsl:if>
</xsl:for-each>
<xsl:text>break;</xsl:text>
</xsl:for-each>
<xsl:text>}</xsl:text>
<xsl:text>document.f.label.value=statelabels[curstate];
document.pic1.src=statepictures[curstate];
</xsl:text>
<xsl:for-each select="statevar[@show='yes']">
<xsl:text>document.f.</xsl:text><xsl:value-of select="./@name"/><xsl:text>x.value=</xsl:text>
<xsl:value-of select="./@name"/><xsl:text>;
</xsl:text>
</xsl:for-each>
<xsl:for-each select="state[@stopstate='yes']">
<xsl:text>if (curstate=='</xsl:text><xsl:value-of select="./@name"/><xsl:text>'){
    window.clearInterval(tid);}</xsl:text>
</xsl:for-each>
<xsl:text>
}

function start() {
tid=setInterval("change()",interval);
}
function stop() {

window.clearInterval(tid);
}
</xsl:text>
<xsl:for-each select="action">
<xsl:text>function </xsl:text>
<xsl:value-of select="procedurename"/>
<xsl:text>() {
</xsl:text>
<xsl:value-of select="procedure"/>
<xsl:text>}
</xsl:text>
</xsl:for-each>
</xsl:comment>
</script>
<xsl:text>
</xsl:text>
</head>
<body>

<xsl:element name="img">
   <xsl:attribute name="src">
   <xsl:value-of select="state[@start='yes']/picture" /> 
   </xsl:attribute>
   <xsl:attribute name="name">pic1</xsl:attribute> 
</xsl:element>
<br/>
<xsl:element name="form">
  <xsl:attribute name="name">
    <xsl:text>f</xsl:text>
  </xsl:attribute>
  <xsl:element name="input">
    <xsl:attribute name="type">
      <xsl:text>text</xsl:text>
    </xsl:attribute>
    <xsl:attribute name="name">
      <xsl:text>label</xsl:text>
    </xsl:attribute>
    <xsl:attribute name="value">
     <xsl:value-of select="state[@start='yes']/label" />
    </xsl:attribute>
  </xsl:element>
<xsl:for-each select="statevar[@show='yes']">
 <xsl:element name="input">
    <xsl:attribute name="type">
      <xsl:text>text</xsl:text>
    </xsl:attribute>
    <xsl:attribute name="name">
      <xsl:value-of select="./@name"/><xsl:text>x</xsl:text>
    </xsl:attribute>
    <xsl:attribute name="value">
     <xsl:value-of select="." />
    </xsl:attribute>
  </xsl:element>
</xsl:for-each>
</xsl:element>
<hr/>
<xsl:for-each select="action">
<xsl:element name="a">
<xsl:attribute name="href">
  <xsl:text>javascript:</xsl:text><xsl:value-of select="procedurename"/>
  <xsl:text>();</xsl:text>
  </xsl:attribute>
<xsl:value-of select="@label"/>
</xsl:element>
<xsl:text>    </xsl:text>
</xsl:for-each>
<xsl:element name="a">
<xsl:attribute name="href">
  <xsl:text>javascript:start();</xsl:text> 
  </xsl:attribute>
<xsl:text>Start play</xsl:text>
</xsl:element>
<xsl:text>    </xsl:text>
<xsl:element name="a">
<xsl:attribute name="href">
  <xsl:text>javascript:stop();</xsl:text> 
  </xsl:attribute>
<xsl:text>Stop play </xsl:text>
</xsl:element>

</body>
</html>
</xsl:template>
</xsl:stylesheet>




