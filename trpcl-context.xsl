<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Project: GAMS Projekttemplate
    Company: ZIM-ACDH (Zentrum für Informationsmodellierung - Austrian Centre for Digital Humanities)
 -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
    xmlns:s="http://www.w3.org/2001/sw/DataAccess/rf1/result" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:t="http://www.tei-c.org/ns/1.0" xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
    xmlns:dc="http://purl.org/dc/elements/1.1/" exclude-result-prefixes="#all">

    <!--<xsl:output method="xml" doctype-system="about:legacy-compat" encoding="UTF-8" indent="no"/>-->


    <xsl:include href="trpcl-static.xsl"/>

    <xsl:template name="content">

        <section class="row ">
            <article class="col-md-5 ">
               
                    <xsl:call-template name="contexts"/>
                
            </article>
            <article class="col-md-7 ">
                <div class="card">
                    <div class="card-body">
                    <div id="results">
                        <ol class="result">
                            <xsl:call-template name="results"/>
                        </ol>
                    </div>
                    </div>
                </div>
            </article>
        </section>


    </xsl:template>

    <xsl:template name="contexts">

        <xsl:if test="$mode=''"> 
            
                    <div class="card">
                        <div class="card-body">
                            <h3>Project</h3>
                            <p>Intro Text</p>
                            <p>Intro Text</p>
                            <p>Intro Text</p>
                            <p>Intro Text</p>
                            <img src="https://via.placeholder.com/150" class="img-fluid"
                            />
                        </div>
                        
                        
                    </div>
              
            
                    
                      
              
                
                
         
        </xsl:if>
              
        
        <xsl:if test="$mode='collection'">
            <div id="MainMenu" class="card">
            <div class="card-body">
                <h3>Sammlungsbereiche</h3>
                <a href="#demo1" class="list-group-item" data-toggle="collapse" data-parent="#MainMenu"><span class="glyphicon glyphicon-chevron-down chevron-down-context"><xsl:text> </xsl:text></span><span
                        class="context-item-number">22</span>Item 1</a>
                <div id="demo1" class="sublinks collapse">
                    <a href="#SubMenu1" class="list-group-item small" data-toggle="collapse" data-parent="#SubMenu1"><span class="glyphicon glyphicon-chevron-down chevron-down-context"><xsl:text> </xsl:text></span>Subitem 1</a>
                    <div class="collapse list-group-submenu" id="SubMenu1">
                        <a href="#" class="list-group-item small" data-parent="#SubMenu1">Subitem 1 a</a>
                        <a href="#" class="list-group-item small" data-parent="#SubMenu1">Subitem 2 b</a>
                    </div>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                </div>
                <a href="#demo2" class="list-group-item" data-toggle="collapse"
                    data-parent="#MainMenu"><span class="glyphicon glyphicon-chevron-down chevron-down-context"><xsl:text> </xsl:text></span><span class="context-item-number">44</span>Item
                    2</a>
                <div id="demo2" class="sublinks collapse">
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                </div>
                <a href="#" class="list-group-item"><span class="glyphicon glyphicon-chevron-down chevron-down-context"><xsl:text> </xsl:text></span><span class="context-item-number"
                        >0</span>Item 3</a>
                <a href="#demo3" class="list-group-item" data-toggle="collapse"
                    data-parent="#MainMenu"><span class="glyphicon glyphicon-chevron-down chevron-down-context"><xsl:text> </xsl:text></span><span class="context-item-number">22</span>Item
                    4</a>
                <div id="demo3" class="sublinks collapse">
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                </div>
                <a href="#demo4" class="list-group-item" data-toggle="collapse"
                    data-parent="#MainMenu"><span class="glyphicon glyphicon-chevron-down chevron-down-context"><xsl:text> </xsl:text></span><span class="context-item-number">22</span>Item
                    5</a>
                <div id="demo4" class="sublinks collapse">
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                    <a class="list-group-item small">Subitem 1</a>
                    <a class="list-group-item small">Subitem 2</a>
                </div>
            </div>
        </div>
        </xsl:if>
     



        <!--<ul class="nav nav-list accordion" id="sidenav-accordion">
            <div style="width: 303px; height:500px">
                <li class="accordion-heading">
                    <a data-toggle="collapse" data-target="#content-area1">Context</a>
                    <!-\- data-target: verweist auf Aufklappbereich; = ID -\->
                    <ul style="overflow-y: scroll; min-height: 200px; max-height: 200px;"
                        class="nav nav-list collapse" id="content-area1" data-toggle="collapse">
                        <!-\- min-height & max-height: fixiert die Box mit der Scrollbar -\->
                        <li>
                            <a href="#" title="Title">Context2</a>
                        </li>
                        <li>
                            <a href="#" title="Title">Context2</a>
                        </li>
                    </ul>
                </li>
                <li class="accordion-heading">
                    <a data-toggle="collapse" data-target="#content-area2">Context</a>
                    <ul style="overflow-y:scroll; min-height: 200px; max-height: 200px;"
                        class="nav nav-list collapse" id="content-area2">
                        <li>
                            <a data-toggle="collapse" data-target="#content-area3">Context2</a>
                            <ul data-toggle="collapse" class="nav nav-list collapse"
                                id="content-area3">
                                <li>
                                    <a href="#" title="Title">Context3</a>
                                </li>
                                <li>
                                    <a href="#" title="Title">Context3</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a data-toggle="collapse" data-target="#content-area4">2.3</a>
                            <ul data-toggle="collaps.in" class="nav nav-list collapse"
                                id="content-area4">
                                <li>
                                    <a href="#" title="Title">2.3.1</a>
                                </li>
                                <li>
                                    <a href="#" title="Title">2.3.2</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a data-toggle="collapse" data-target="#content-area5">2.4</a>
                            <ul data-toggle="collapse" class="nav nav-list collapse"
                                id="content-area5">

                                <li>
                                    <a href="#" title="Title">2.4.3</a>
                                </li>
                                <li>
                                    <a href="#" title="Title">2.4.4</a>
                                </li>
                                <li>
                                    <a href="#" title="Title">2.4.5</a>
                                </li>
                                <li>
                                    <a href="#" title="Title">2.4.6</a>
                                </li>
                                <li>
                                    <a href="#" title="Title">2.4.7</a>
                                </li>
                                <li>
                                    <a href="#" title="Title">2.4.8</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </div>
        </ul>-->
        <!--   </div>
        </article>-->
    </xsl:template>


    <xsl:template name="results">
        <p class="results">
            <a target="_blank">
                <xsl:attribute name="href">
                    <xsl:value-of select="concat('/', $cid, '/sdef:Context/getPDF')"/>
                </xsl:attribute>Ergebnis als PDF <img class="icons"
                    src="./templates/img/pdf_icon.png" height="18"
                    alt="Ergebnis als PDF" title="Ergebnis als PDF"/>
            </a>
            <br/>

            <a target="_blank">
                <xsl:attribute name="href">
                    <xsl:value-of select="concat('/', $cid, '/sdef:Map/', 'get')"/>
                    <!-- get: GAMS KML Viewer -->
                    <!-- getDariah: DARIAH GeoBrowser -->
                    <!-- getPlatin: PLATIN place and time navigator -->
                    <!-- bei geobrowser und platin können über parameter optionen eingestellt werden (zb welcher kartenhintergrund), dann muss man den link so zusammensetzen und nicht über methode aufrufen -->
                </xsl:attribute>Ergebnis auf Karte <img class="icons"
                    src="./templates/img/kml.gif" height="15"
                    alt="Ergebnis auf Karte" title="Ergebnis auf Karte"/></a>
        </p>
        <h3><xsl:value-of select="/s:sparql/s:results/s:result[1]/s:container"/></h3>
        <p>Anzahl der gefundenen Einträge: <xsl:value-of select="count(s:sparql/s:results/s:result)"
            /></p>
        <xsl:for-each select="s:sparql/s:results/s:result">
            <li>
                <xsl:choose>
                    <xsl:when test="position() mod 2 = 0">
                        <xsl:attribute name="class">
                            <xsl:text>results odd</xsl:text>
                        </xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="class">
                            <xsl:text>results even</xsl:text>
                        </xsl:attribute>
                    </xsl:otherwise>
                </xsl:choose>
                <a>
                    <xsl:attribute name="href">
                        <xsl:value-of select="concat('/', ./s:identifier)"/>
                    </xsl:attribute>
                    <img width="100" height="80"
                        class="results">
                        <xsl:attribute name="src">
                            <xsl:value-of
                                select="concat('/', ./s:identifier, '/THUMBNAIL')"/>

                        </xsl:attribute>
                    </img>
                </a>
                <span class="results">
                    <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="concat('/', ./s:identifier)"/>
                        </xsl:attribute>
                        <xsl:value-of select="./s:title"/>
                    </a>
                </span>
                <br/>
                <span class="permalink">
                    <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="concat('/', ./s:identifier)"/>
                        </xsl:attribute>
                        <xsl:text>Permalink: </xsl:text><xsl:value-of select="concat('/', ./s:identifier)"/>
                    </a>
                </span>
                <span class="icon-span">
                    <xsl:choose>
                        <xsl:when test="./s:model/@uri='info:fedora/cm:TEI'"><a target="_blank">
                        <xsl:attribute name="href">
                            <xsl:value-of
                                select="concat('/', ./s:identifier, '/TEI_SOURCE')"/>

                        </xsl:attribute>
                        <img src="./templates/img/tei_icon.jpg" 
                            height="18" alt="TEI-Dokument" title="TEI-Dokument"/>
                        </a>
                        </xsl:when>
                        <xsl:when test="./s:model/@uri='info:fedora/cm:LIDO'">
                            <a target="_blank" class="icons">
                        <xsl:attribute name="href">
                            <xsl:value-of
                                select="concat('/', ./s:identifier, '/LIDO_SOURCE')"/>
                        </xsl:attribute>
                        <img src="./templates/img/lido_icon.png" 
                            height="18" alt="LIDO-Dokument" title="LIDO-Dokument"/>
                    </a></xsl:when>
                        <xsl:when test="./s:model/@uri='info:fedora/cm:PDF'">
                            <a target="_blank" class="icons">
                        <xsl:attribute name="href">
                            <xsl:value-of
                                select="concat('/', ./s:identifier, '/sdef:TEI/getPDF')"/>
                        </xsl:attribute>
                        <img src="./templates/img/pdf_icon.png" 
                            height="18" alt="Druckversion" title="Druckversion"/>
                    </a>
                    </xsl:when>
                    </xsl:choose>
                </span>

            </li>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
