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
                        <h2>Informazioni sul manoscritto e sulle scelte di codifica</h2>
                            <p><xsl:apply-templates select="//tei:msDesc/tei:history"/></p>
                            <p><xsl:apply-templates select="//tei:editionStmt"/></p>
                            <p><xsl:apply-templates select="//tei:publicationStmt"/></p>
                            <ul>
                                <xsl:apply-templates select="//tei:encodingDesc/tei:editorialDecl"/>
                            </ul>
                            <p><xsl:apply-templates select="//tei:sourceDesc/tei:msDesc"/></p>
                    </div>
                    <div id="pagine">
                        <h2>Pagine codificate</h2>
                        <xsl:apply-templates select="//tei:body"/>
                    </div>
                    <div id="citazioni">
                        <h2>Organizzazioni e persone citate nel testo</h2>
                        <xsl:apply-templates select="//tei:standOff/tei:listOrg"/>
                    </div>
                </div>
            </body>

            <footer>
                <p>Questo sito è stato realizzato da Luca Pagnesi per il corso di Codifica di Testi dell'Università di Pisa.</p>
		        <p>Anno accademico 2022/2023</p>
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
    </xsl:template>

    <xsl:template match="tei:encodingDesc/tei:editorialDecl">
        <xsl:element name="li"><xsl:value-of select="tei:correction"/></xsl:element>
        <xsl:element name="li"><xsl:value-of select="tei:normalization"/></xsl:element>
        <xsl:element name="li"><xsl:value-of select="tei:punctuation"/></xsl:element>
        <xsl:element name="li"><xsl:value-of select="tei:hyphenation"/></xsl:element>
        <xsl:element name="li"><xsl:value-of select="tei:interpretation"/></xsl:element>
        <xsl:element name="li"><xsl:value-of select="tei:segmentation"/></xsl:element>
    </xsl:template>
    

</xsl:stylesheet>