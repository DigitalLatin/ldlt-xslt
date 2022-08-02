<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="text"/>
    <!-- Counts all of the elements in an XML document. Cribbed from https://www.oreilly.com/library/view/xslt/0596000537/apds03.html -->
    <xsl:variable name="newline">
        <xsl:text>
</xsl:text>
    </xsl:variable>
    
    <xsl:key name="elements" match="*" use="name()"/>
    
    <xsl:template match="/">
        <xsl:value-of select="$newline"/>
        <xsl:text>Summary of Elements</xsl:text>
        <xsl:value-of select="$newline"/>
        <xsl:value-of select="$newline"/>
        <xsl:for-each 
            select="//*[generate-id(.)=generate-id(key('elements',name())[1])]">
            <xsl:sort select="name()"/>
            <xsl:for-each select="key('elements', name())">
                <xsl:if test="position()=1">
                    <xsl:text>Element </xsl:text>
                    <xsl:value-of select="name()"/>
                    <xsl:text> occurs </xsl:text>
                    <xsl:value-of select="count(//*[name()=name(current())])"/>
                    <xsl:text> times.</xsl:text>
                    <xsl:value-of select="$newline"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>
        <xsl:value-of select="$newline"/>
        <xsl:text>There are </xsl:text>
        <xsl:value-of select="count(//*)"/>
        <xsl:text> elements in all.</xsl:text>
    </xsl:template>
    
</xsl:stylesheet>