<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output indent="yes" method="xml"/>
    <xsl:template match="/">
        <report>
            <xsl:apply-templates select="//groups/group[not(team = //last-two//team)]/team"></xsl:apply-templates>
            <xsl:apply-templates mode="finalist" select="//last-two//team"></xsl:apply-templates>

        </report>
    </xsl:template>

    <xsl:template match="team">
        <xsl:variable name="name">
            <xsl:value-of select="."/>
        </xsl:variable>
        <xsl:element name="team">
            <xsl:attribute name="group">
                <xsl:value-of select="//euro/groups/group[team = $name]/@id"/>
            </xsl:attribute>
            <xsl:attribute name="code">
                <xsl:value-of select="$name"/>
            </xsl:attribute>

        </xsl:element>
    </xsl:template>

    <xsl:template mode="finalist" match="team">
        <xsl:variable name="name">
            <xsl:value-of select="."/>
        </xsl:variable>
        <xsl:element name="team">
            <xsl:attribute name="group">
                <xsl:value-of select="//euro/groups/group[team = $name]/@id"/>
            </xsl:attribute>
            <xsl:attribute name="code">
                <xsl:value-of select="$name"/>
            </xsl:attribute>
            <name>
                <xsl:value-of select="//nation[short-name =  $name]/name/text()"/>
            </name>
            <opponents>
                <xsl:apply-templates select="//groups/group/team[not(text() = $name)]"></xsl:apply-templates>
            </opponents>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>