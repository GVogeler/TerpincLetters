<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs"
  version="2.0">
  <xsl:template match="/">
    <xsl:variable name="folder" select="/data/@directory"/>
    <!-- Auflistung aller Dateinamen -->
    <xsl:for-each select="for $filename in collection(concat($folder, select='*.xml')) return $filename">
      <xsl:value-of select="base-uri(.)"/>
    </xsl:for-each>
    <!-- oder:
      Auslesen aller Dateien
    -->
    <xsl:copy-of select="collection(concat($folder,'/?select=*.xml'))/*"/>
  </xsl:template>
</xsl:stylesheet>