<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <familytree>
            <xsl:apply-templates select="//descendant::name">
                <xsl:sort select="count(ancestor::*)" data-type="number" order="descending" />
            </xsl:apply-templates>
        </familytree>
    </xsl:template>

    <xsl:template match="name">
        <xsl:if test="position() = 1">
            <person>
                <name>
                    <xsl:value-of select="text()"/>
                </name>
                <child>
                    <xsl:apply-templates select="parent::person/parent::parents/preceding-sibling::name"/>
                </child>
            </person>
        </xsl:if>
        <xsl:if test="position() = 2">
            <person>
                <name>
                    <xsl:value-of select="text()"/>
                </name>
                <child>
                    <xsl:apply-templates select="parent::person/parent::parents/preceding-sibling::name"/>
                </child>
            </person>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>