<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"> <xsl:output method="html"/>
<xsl:template match="/message">
<html><head><title>Greeting </title> </head>
<body>
<xsl:apply-templates />
</body>
</html>
</xsl:template>
<xsl:template match="greeting">
 <h1><xsl:value-of select="."/>, 
</h1>
</xsl:template>
<xsl:template match="target">
<h3><xsl:value-of select="."/>
</h3>
</xsl:template>

</xsl:stylesheet>
      