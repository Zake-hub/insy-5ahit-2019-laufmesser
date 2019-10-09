<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <magzine>
            <report>
                <head>
                    <authors>
                        <xsl:apply-templates select="report/authors/child::*"/>
                    </authors>
                    <pages>
                        <xsl:value-of select="//pages"/>
                    </pages>
                    <url>
                        <xsl:value-of select="normalize-space(//homepage)"/>
                    </url>
                </head>
                <body>
                    <xsl:apply-templates select="//description/authors"/>
                    <xsl:copy-of select="//content"/>
                </body>
            </report>
        </magzine>
    </xsl:template>

    <xsl:template match="author|sampler">
        <author>
            <xsl:for-each select="child::*">
                <xsl:value-of select='concat(text(), " ")' />
            </xsl:for-each>
        </author>
    </xsl:template>

    <xsl:template match="authors">
        <authors>
            <xsl:for-each select="node()">
                <xsl:choose>
                    <xsl:when test="self::aref">
                        <xsl:variable name="id">
                            <xsl:value-of select="@id"/>
                        </xsl:variable>
                        <xsl:variable name="author" select="/report/authors/*[@id = $id]"/>
                        <!--xsl:value-of select="$author"/-->
                        <xsl:if test="$author/name">
                            <xsl:value-of select="$author/name"/>
                        </xsl:if>
                        <xsl:value-of select="concat($author/first-name, ' ', $author/middle-name, ' ', $author/last-name)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="."/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </authors>
    </xsl:template>


</xsl:stylesheet>