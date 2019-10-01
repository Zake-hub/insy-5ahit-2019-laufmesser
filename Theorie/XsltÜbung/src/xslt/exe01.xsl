<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <teams>
            <xsl:apply-templates select="/euro/teams/team">
                <xsl:with-param name="info">
                    <xsl:value-of select="'Steint'"/>
                </xsl:with-param>
            </xsl:apply-templates>
        </teams>
    </xsl:template>

    <xsl:template match="team">

        <xsl:param name="info"/>

        <xsl:variable name="code">
            <xsl:value-of select="nation/short-name"/>
        </xsl:variable>
        <xsl:variable name="team" select=".">
        </xsl:variable>

        <team>
            <xsl:attribute name="code">
                <xsl:value-of select="$code"/>
            </xsl:attribute>
            <xsl:attribute name="group">
                <xsl:value-of select="//groups/group[team = $code]/@id"/>
            </xsl:attribute>

            <xsl:attribute name="info">
                <xsl:value-of select="$info"/>
            </xsl:attribute>
            <players>
                <xsl:for-each select="//player[ancestor::team = $team]">
                    <player>
                        <xsl:value-of select="concat(name/last-name, ' ', name/first-name)"/>
                    </player>
                </xsl:for-each>
            </players>


            <xsl:value-of select="nation/name"/>
        </team>
    </xsl:template>

</xsl:stylesheet>