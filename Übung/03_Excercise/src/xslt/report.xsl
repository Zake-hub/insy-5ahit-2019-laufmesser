<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:param name="sixteen" select="'sixteen'"/>
    <xsl:param name="eight" select="'eight'"/>
    <xsl:param name="four" select="'four'"/>
    <xsl:param name="two" select="'two'"/>
    <xsl:template match="/">
        <report>
            <last-sixteen>
                <xsl:apply-templates select="//matches/last-sixteen//team">
                    <xsl:with-param name="size">
                        <xsl:value-of select="$sixteen"/>
                    </xsl:with-param>
                </xsl:apply-templates>
            </last-sixteen>
            <last-eight>
                <xsl:apply-templates select="//matches/last-eight//team">
                    <xsl:with-param name="size">
                        <xsl:value-of select="$eight"/>
                    </xsl:with-param>
                </xsl:apply-templates>
            </last-eight>
            <last-four>
                <xsl:apply-templates select="//matches/last-four//team">
                    <xsl:with-param name="size">
                        <xsl:value-of select="$four"/>
                    </xsl:with-param>
                </xsl:apply-templates>
            </last-four>
            <last-two>
                <xsl:apply-templates select="//matches/last-two//team">
                    <xsl:with-param name="size">
                        <xsl:value-of select="$two"/>
                    </xsl:with-param>
                </xsl:apply-templates>
            </last-two>
        </report>
    </xsl:template>
    <xsl:template match="team">
        <xsl:param name="size"/>
        <xsl:variable name="name">
            <xsl:value-of select="."/>
        </xsl:variable>
        <xsl:element name="{$size}">
            <xsl:attribute name="code">
                <xsl:value-of select="text()"/>
            </xsl:attribute>
            <name>
                <xsl:value-of select="//euro/teams/team/nation[short-name=$name]/name"/>
            </name>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>