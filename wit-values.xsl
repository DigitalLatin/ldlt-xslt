<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="text"/>
    <!-- List all values of attribute wit -->
    <xsl:variable name="newline">
        <xsl:text>
</xsl:text>
    </xsl:variable>
    <xsl:template match="/">
        <xsl:for-each select="//@wit">
            <xsl:value-of select="." />
            <xsl:value-of select="$newline"/>        
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>