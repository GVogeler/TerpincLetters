<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns="http://www.w3.org/2001/sw/DataAccess/rf1/result"
  xmlns:t="http://www.tei-c.org/ns/1.0"
  exclude-result-prefixes="xs"
  version="2.0">
  <xsl:output media-type="xml" encoding="UTF-8" indent="yes"/>
  <xsl:variable name="contextinfo" select="/"/>
  <xsl:template match="/">
    <xsl:variable name="folder" select="/data/@directory/string()"/>
    <!-- Auflistung aller Dateinamen -->
<!--    <xsl:for-each select="for $filename in collection(concat($folder , '?select=*.xml')) return $filename">
      <xsl:value-of select="base-uri(.)"/>
    </xsl:for-each>-->
    <!-- oder:
      Auslesen aller Dateien
    -->
    <sparql>
      <head>
        <variable name="container"/>
        <variable name="cid"/>
        <variable name="pid"/>
        <variable name="model"/>
        <variable name="ownerId"/>
        <variable name="createdDate"/>
        <variable name="lastModifiedDate"/>
        <variable name="title"/>
        <variable name="identifier"/>
        <variable name="description"/>
      </head>
      <results>
        <xsl:apply-templates select="collection(concat($folder,'/?select=*.xml'))/*"/>
      </results>
    </sparql>
  </xsl:template>
  <xsl:template match="*" priority="-2"/>
<!--  ToDo: other data schemes (e.g. LIDO) 
  eventually: select by context-declaration
  -->
  <xsl:template match="/t:TEI[.//t:ref[@type='context'][@target=$contextinfo/data/@context]]">
    <result>
      <xsl:copy-of select="$contextinfo/data/container"/>
      <cid><xsl:value-of select="$contextinfo/data/@context"/></cid>
      <pid uri="info:fedora/{.//t:idno[@type='PID'][1]}"/>
      <model uri="info:fedora/cm:TEI"/>
      <xsl:copy-of select="$contextinfo/data/ownerId"/>
      <createdDate datatype="http://www.w3.org/2001/XMLSchema#dateTime"><xsl:value-of select="current-dateTime()"/><xsl:comment>Arbitrary value</xsl:comment></createdDate>
      <lastModifiedDate datatype="http://www.w3.org/2001/XMLSchema#dateTime"><xsl:value-of select="current-dateTime()"/><xsl:comment>Arbitrary value</xsl:comment></lastModifiedDate>
      <title><xsl:value-of select="/t:TEI/t:teiHeader/t:fileDesc/t:titleStmt/t:title"/></title>
      <identifier><xsl:value-of select=".//t:idno[@type='PID'][1]"/></identifier>
      <description bound="false"/>
    </result>
  </xsl:template>
</xsl:stylesheet>