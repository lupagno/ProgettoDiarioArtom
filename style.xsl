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
                    <div>
                        <div id="header-title">
                            <h1><xsl:apply-templates select="//tei:titleStmt"/></h1>
                        </div>

                        <ul id="header-ul">
                            <li>
                                <a href="#info" class="nav-link">Informazioni</a>
                            </li>
                            <li>
                                <a href="#manoscritto" class="nav-link">Descrizione del manoscritto</a>
                            </li>
                            <li>
                                <a href="#p136" class="nav-link">Pagina 136</a>
                            </li>
                            <li>
                                <a href="#p137" class="nav-link">Pagina 137</a>
                            </li>
                            <li>
                                <a href="#p138" class="nav-link">Pagina 138</a>
                            </li>
                            <li>
                                <a href="#listOrg" class="nav-link">Organizzazioni</a>
                            </li>
                            <li class="nav-item">
                                <a href="#listPers" class="nav-link">Persone</a>
                            </li>
                        </ul>
                    </div>
                </header>

                <div class="main">
                    
                    <div id="info">

                        <div id="info-left">
                            <h2>Alcune informazioni sul progetto</h2>
                            <p><xsl:apply-templates select="//tei:msDesc/tei:history"/></p>
                            <p><xsl:apply-templates select="//tei:editionStmt"/></p>
                            <p><xsl:apply-templates select="//tei:publicationStmt"/></p>
                        </div>

                        <div id="info-right">
                            <h2>Scelte di codifica</h2>
                            <ul class="codifica-list">
                                <xsl:apply-templates select="//tei:encodingDesc/tei:editorialDecl"/>
                            </ul>  
                        </div>
                        
                    </div>

                    <div id="manoscritto">
                        <h2>Descrizione del manoscritto</h2>
                        <p><xsl:apply-templates select="//tei:sourceDesc/tei:msDesc"/></p>
                    </div>

                    <div id="pages">
                        <h2>Pagine codificate</h2>
                        <xsl:apply-templates select="//tei:body"/>
                    </div>

                    <div id="cit">
                        <div id="org-cit">
                            <h2>Organizzazioni citate nel testo</h2>
                            <xsl:apply-templates select="//tei:standOff/tei:listOrg"/>
                        </div>

                        <div id="per-cit">
                            <h2>Persone citate nel testo</h2>
                            <xsl:apply-templates select="//tei:standOff/tei:listPerson"/>
                        </div>
                    </div>
                    
                </div>

            </body>

            <footer>
                <div id="footer">
                    <p>Webpage realizzata da Daniele Melaccio (mat.620382) per l'esame di Codifica di Testi, tenuto dal prof. Angelo Mario Del Grosso.</p>
                    <p>Corso di Laurea Triennale in Informatica Umanistica</p>
                </div>
            </footer>

        </html>

    </xsl:template>