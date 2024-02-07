<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0">

    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:apply-templates select="//tei:titleStmt"/>
                </title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
                <link rel="stylesheet" type="text/css" href="CSS/codifica_pagine.css"></link>
                <script src="JS/codifica_pagine.js"></script>
            </head>
            <body>
                <header>
                    <div id="header-title">
                        <h1><xsl:apply-templates select="//tei:titleStmt"/></h1>
                    </div>
                    <ul id="header-ul">
                        <li>
                            <a href="#info">Informazioni</a>
                        </li>
                        <li>
                            <a href="#p136">Pagina 136</a>
                        </li>
                        <li>
                            <a href="#p137">Pagina 137</a>
                        </li>
                        <li>
                            <a href="#p138">Pagina 138</a>
                        </li>
                        <li>
                            <a href="#citazioni">Citazioni</a>
                        </li>
                    </ul>
                </header>

                <div class="main">
                    <div id="info">
                        <div id="msInfo">
                            <h2>Informazioni sul manoscritto</h2>
                            <div>
                                <xsl:apply-templates select="//tei:sourceDesc/tei:msDesc"/>
                            </div>
                        </div>
                        <div id="encodingInfo">
                            <h2>Scelte di codifica</h2>
                            <ul>
                                <xsl:apply-templates select="//tei:encodingDesc/tei:editorialDecl"/>
                            </ul>
                        </div>
                    </div>
                    <div id="pagine">
                        <h2>Pagine codificate</h2>
                        <xsl:apply-templates select="//tei:body"/>
                    </div>
                    <div id="citazioni">
                        <h2>Organizzazioni e persone citate nel testo</h2>
                        <xsl:apply-templates select="//tei:standOff/tei:listOrg"/>
                        <xsl:apply-templates select="//tei:standOff/tei:listPerson"/>
                    </div>
                </div>
            </body>
            <footer>
                <div>
                    <xsl:apply-templates select="//tei:editionStmt"/>
                    <xsl:apply-templates select="//tei:publicationStmt"/>
                </div>
                <div>
                    <p>Questo sito è stato realizzato per il corso di Codifica di Testi dell'Università di Pisa.</p>
		            <p>Anno accademico 2022/2023</p>
                    <p>MAT. 559109</p>
                </div>
            </footer>
        </html>
    </xsl:template>

    <xsl:template match="tei:titleStmt">
        <xsl:value-of select="tei:title"/>
    </xsl:template>

    <xsl:template match="tei:msDesc/tei:history">
        <xsl:value-of select="."/>
    </xsl:template>

    <xsl:template match="tei:editionStmt">
        <xsl:element name="p">
            <xsl:value-of select="tei:edition"/>
        </xsl:element>
        <xsl:element name="p">
            <xsl:value-of select="tei:respStmt[1]"/>
        </xsl:element>
        <xsl:element name="p">
            <xsl:value-of select="tei:respStmt[2]"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:publicationStmt">
        <xsl:element name="p">
            <xsl:value-of select="tei:publisher/tei:orgName"/>
            <xsl:element name="br"></xsl:element>
            <xsl:value-of select="tei:address/tei:street"/>
            <xsl:element name="br"></xsl:element>
            <xsl:value-of select="tei:address/tei:postCode"/>
            <xsl:element name="br"></xsl:element>
            <xsl:value-of select="tei:address/tei:settlement"/>
            <xsl:element name="br"></xsl:element>
            <xsl:value-of select="tei:availability"/> - <xsl:value-of select="tei:date"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:sourceDesc/tei:msDesc">
        <xsl:element name="p">
            Documento cartaceo conservato a <xsl:value-of select="tei:msIdentifier/tei:settlement"/> presso la <xsl:value-of select="tei:msIdentifier/tei:institution/tei:orgName"/>.
            <xsl:element name="br"></xsl:element>
            <xsl:value-of select="tei:msIdentifier/tei:collection"/> - <xsl:value-of select="tei:msIdentifier/tei:idno"/>
        </xsl:element>
        <xsl:element name="p">
            <xsl:value-of select="tei:physDesc/tei:objectDesc/tei:supportDesc/tei:support"/>
        </xsl:element>
        <xsl:element name="p">
            <xsl:value-of select="tei:physDesc/tei:objectDesc/tei:supportDesc/tei:extent"/>
        </xsl:element>
        <xsl:element name="p">
            <xsl:value-of select="tei:physDesc/tei:objectDesc/tei:supportDesc/tei:foliation"/>
        </xsl:element>
        <xsl:element name="p">
            <xsl:value-of select="tei:physDesc/tei:objectDesc/tei:supportDesc/tei:collation"/>
        </xsl:element>
        <xsl:element name="p">
            <xsl:value-of select="tei:physDesc/tei:objectDesc/tei:supportDesc/tei:condition"/>
        </xsl:element>
        <xsl:element name="p">
            <xsl:value-of select="tei:physDesc/tei:objectDesc/tei:layoutDesc"/>
        </xsl:element>
        <xsl:element name="p">
            <xsl:value-of select="tei:physDesc/tei:handDesc"/>
        </xsl:element>
        <xsl:element name="p">
            <xsl:value-of select="tei:physDesc/tei:accMat"/>
        </xsl:element>
        <xsl:element name="p">
            <xsl:value-of select="tei:history"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:encodingDesc/tei:editorialDecl">
        <xsl:element name="li"><xsl:value-of select="tei:correction"/></xsl:element>
        <xsl:element name="li"><xsl:value-of select="tei:normalization"/></xsl:element>
        <xsl:element name="li"><xsl:value-of select="tei:punctuation"/></xsl:element>
        <xsl:element name="li"><xsl:value-of select="tei:hyphenation"/></xsl:element>
        <xsl:element name="li"><xsl:value-of select="tei:interpretation"/></xsl:element>
        <xsl:element name="li"><xsl:value-of select="tei:segmentation"/></xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:surface">
        <xsl:element name="div">
            <xsl:attribute name="class">pagina-fac</xsl:attribute>
            <xsl:element name="img">
                <xsl:attribute name="src"><xsl:value-of select="tei:graphic/@url"/></xsl:attribute>
                <xsl:attribute name="alt"><xsl:value-of select="@xml:id"/></xsl:attribute>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:body">
        <xsl:for-each-group select="tei:div/tei:ab/tei:s/node() | tei:div//tei:pb" group-starting-with="tei:pb">
            <xsl:variable name="pagina">
                <xsl:value-of select="@n"/>
            </xsl:variable>
            <xsl:element name="div">
                <xsl:attribute name="class">pagina-n-cont</xsl:attribute>
                <xsl:attribute name="id">p<xsl:value-of select="$pagina"/></xsl:attribute>
                <xsl:element name="h3">Pagina <xsl:value-of select="$pagina"/></xsl:element>
                <xsl:element name="div">
                    <xsl:attribute name="class">buttons</xsl:attribute>
                    <xsl:element name="button">
                        <xsl:attribute name="onclick">toggleErr(<xsl:value-of select="$pagina"/>)</xsl:attribute>
                        Errori
                    </xsl:element>
                    <xsl:element name="button">
                        <xsl:attribute name="onclick">toggleDel(<xsl:value-of select="$pagina"/>)</xsl:attribute>
                        Cancellature
                    </xsl:element>
                    <xsl:element name="button">
                        <xsl:attribute name="onclick">toggleAbbr(<xsl:value-of select="$pagina"/>)</xsl:attribute>
                        Abbreviazioni
                    </xsl:element>
                </xsl:element>
                <xsl:element name="div">
                    <xsl:attribute name="class">pagina-cont</xsl:attribute>
                    <xsl:apply-templates select="//tei:surface[@n=$pagina]"/>
                    <xsl:element name="div">
                        <xsl:attribute name="class">pagina-text</xsl:attribute>
                        <xsl:apply-templates select="current-group()"/>
                    </xsl:element>  
                </xsl:element>
            </xsl:element>
        </xsl:for-each-group> 
    </xsl:template>

    <xsl:template match="tei:s/tei:persName">
        <xsl:element name="span">
            <xsl:attribute name="class">pers</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:s/tei:orgName">
        <xsl:element name="span">
            <xsl:attribute name="class">org</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:del">
        <xsl:element name="span">
            <xsl:attribute name="class">deleted</xsl:attribute>
            <xsl:attribute name="style">display: none;</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:seg">
        <xsl:variable name="trs">
                <xsl:value-of select="@xml:id"/>
            </xsl:variable>
        <xsl:element name="span">
            <xsl:attribute name="id"><xsl:value-of select="$trs"/></xsl:attribute>
            <xsl:attribute name="class">transposition</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:add">
        <xsl:element name="span">
            <xsl:attribute name="class">add</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="tei:sic">
        <xsl:element name="span">
            <xsl:attribute name="class">error</xsl:attribute>
            <xsl:attribute name="style">display: none;</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:corr">
        <xsl:element name="span">
            <xsl:attribute name="class">correction</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:expan">
        <xsl:element name="span">
            <xsl:attribute name="class">expanded</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:abbr">
        <xsl:element name="span">
            <xsl:attribute name="class">short</xsl:attribute>
            <xsl:attribute name="style">display: none;</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:lb">
        <xsl:element name="br"></xsl:element>
        <xsl:element name="span">
            <xsl:attribute name="class">line-break</xsl:attribute>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:standOff/tei:listOrg">
        <xsl:for-each select="tei:org">
            <xsl:element name="div">
                <xsl:element name="h3">
                    <xsl:value-of select="tei:orgName"/> 
                </xsl:element>
                <xsl:element name="p">
                    <xsl:value-of select="tei:desc"/>
                </xsl:element>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="tei:standOff/tei:listPerson">
        <xsl:for-each select="tei:person">
            <xsl:element name="div">
                <xsl:element name="h3">
                    <xsl:value-of select="tei:persName"/> 
                </xsl:element>
                <xsl:if test="tei:note" > 
                    <xsl:element name="p">
                        <xsl:value-of select="tei:note"/>
                    </xsl:element>
                </xsl:if>
                </xsl:element>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>