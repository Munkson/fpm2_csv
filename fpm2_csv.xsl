<?xml version="1.0" encoding="utf-8" ?>
<!-- 
     COPYRIGHT 2020 Hirohsi Kubo <hkubo@jiubao.jp>, All rights reserved.

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

 -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" > 
 <xsl:output method="text" encoding="UTF-8" disable-output-escaping="yes"/>
 <xsl:variable name="quote" >&quot;</xsl:variable><!-- Variable definition of double-quote. To be referred to as $quote afterward -->
 
 <xsl:template match="FPM"> 
    <xsl:apply-templates/>
  </xsl:template> 
  <xsl:template match="LauncherList"/> 
  <xsl:template match="PasswordList"> 
<xsl:apply-templates/>
  </xsl:template>
  <!-- 
       Column definition: category,title,user,password,url,notes
  -->
  <xsl:template match="PasswordItem">
    <!-- category -->
    <xsl:call-template name="csvitemout" ><!-- category tag item output with double-quotation escaped. -->
    <xsl:with-param name="csvitem" select="category"/>
    </xsl:call-template>,<!-- title --><xsl:call-template name="csvitemout" >
    <!-- title tag item output with double-quotation escaped. -->
    <xsl:with-param name="csvitem" select="title"/>
    </xsl:call-template>,<!-- user --><xsl:call-template name="csvitemout" >
    <!-- user tag item output with double-quotation escaped. -->
    <xsl:with-param name="csvitem" select="user"/>
    </xsl:call-template>,<!-- password --><xsl:call-template name="csvitemout" >
    <!-- password tag item output with double-quotation escaped. -->
    <xsl:with-param name="csvitem" select="password"/>
    </xsl:call-template>,<!-- url --><xsl:call-template name="csvitemout" >
    <!-- url tag item output with double-quotation escaped. -->
    <xsl:with-param name="csvitem" select="url"/>
</xsl:call-template>,<!-- notes --><xsl:call-template name="csvitemout" >
<!-- notes tag item output with double-quotation escaped. -->
    <xsl:with-param name="csvitem" select="notes"/>
</xsl:call-template><!-- end of  item output
 --><xsl:text disable-output-escaping = "yes" >&#10;</xsl:text>
</xsl:template>

<!-- if double quotation is needed, enclose the item with the double quotes -->
<xsl:template name="csvitemout" match="*">
  <xsl:param name="csvitem"></xsl:param>
  <xsl:choose>
    <xsl:when test="contains($csvitem, $quote)">&quot;<xsl:call-template name="csvquote" ><xsl:with-param name="colitem" select="$csvitem"/></xsl:call-template>&quot;</xsl:when>
    <xsl:when test="contains($csvitem, ',')">&quot;<xsl:value-of select="$csvitem"/>&quot;</xsl:when>
    <xsl:when test="contains($csvitem, '&#10;')">&quot;<xsl:value-of select="$csvitem"/>&quot;</xsl:when>
<xsl:otherwise><xsl:value-of select="$csvitem"/></xsl:otherwise>
</xsl:choose>
</xsl:template>

<!-- output with double quote escaping -->
<xsl:template name="csvquote">
    <xsl:param name="colitem"></xsl:param>
    <xsl:choose>
    <xsl:when test="contains($colitem, $quote)">
      <xsl:value-of select="substring-before($colitem, $quote)"/>&quot;&quot;<xsl:call-template name="csvquote" ><xsl:with-param name="colitem" select="substring-after($colitem, $quote)"/></xsl:call-template><!--
    --></xsl:when>
    <xsl:otherwise><xsl:value-of select="$colitem"/></xsl:otherwise>
    </xsl:choose>
</xsl:template> 
</xsl:stylesheet>
