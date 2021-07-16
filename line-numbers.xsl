<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0"
    xmlns:rng="http://relaxng.org/ns/structure/1.0" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:teix="http://www.tei-c.org/ns/Examples" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    exclude-result-prefixes="a rng tei teix" version="2.0">
    
    <xsl:output method="xml" omit-xml-declaration="yes"/>
    <!-- This template will add an @n to all <l> and autoincrement them. -->
    <xsl:template match="tei:l">
            <xsl:if test="not(@n)"><xsl:copy>
            <xsl:attribute name="n">
                <xsl:value-of select="count(preceding::tei:l) +1"/>
            </xsl:attribute>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
            </xsl:if>
    </xsl:template>
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>