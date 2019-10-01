<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <result>
            <xsl:apply-templates select="euro/groups/group"/>
        </result>
    </xsl:template>
    <xsl:template match="group">
        <group>
            <xsl:attribute name="id">
                <xsl:value-of select="@id"/>
            </xsl:attribute>
            <xsl:apply-templates select="team"/>
        </group>
    </xsl:template>
    <xsl:template match="team">
        <xsl:param name="code" select="text()"/>
        <team code="{$code}">
            <xsl:attribute name="round">
                <xsl:value-of select="count(//matches//team[text()=$code])+1"/>
            </xsl:attribute>
        </team>
    </xsl:template>
</xsl:stylesheet>