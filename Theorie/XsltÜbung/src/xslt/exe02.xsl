<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>

    <xsl:param name="position_defense" select="'defense'"/>
    <xsl:param name="position_playground" select="'playground'"/>
    <xsl:param name="position_attack" select="'attack'"/>

    <xsl:template match="/">
        <positions>
            <position type="{$position_attack}">
                <xsl:apply-templates select="euro/teams/team">
                    <xsl:with-param name="pos">
                        <xsl:value-of select="$position_attack"/>
                    </xsl:with-param>
                </xsl:apply-templates>
            </position>
            <position type="{$position_playground}">
                <xsl:apply-templates select="euro/teams/team">
                    <xsl:with-param name="pos">
                        <xsl:value-of select="$position_playground"/>
                    </xsl:with-param>
                </xsl:apply-templates>
            </position>
            <position type="{$position_defense}">
                <xsl:apply-templates select="euro/teams/team">
                    <xsl:with-param name="pos">
                        <xsl:value-of select="$position_defense"/>
                    </xsl:with-param>
                </xsl:apply-templates>
            </position>
        </positions>
    </xsl:template>

    <xsl:template match="team">
        <xsl:param name="pos"/>
        <team>
            <xsl:attribute name="code">
                <xsl:value-of select="nation/short-name"/>
            </xsl:attribute>
            <xsl:apply-templates select="position[attribute::type=$pos]/player"/>
        </team>
    </xsl:template>

    <xsl:template match="player">
        <player>
            <xsl:value-of select="concat(name/last-name, ' ', name/first-name)"/>
        </player>
    </xsl:template>


</xsl:stylesheet>