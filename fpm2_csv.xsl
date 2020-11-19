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
 <xsl:value-of select="category"/>,<xsl:value-of select="title"/>,<xsl:value-of select="user"/>,<xsl:value-of select="password"/>,<xsl:value-of select="url"/>,"<xsl:value-of select="notes"/>"<xsl:text disable-output-escaping = "yes" >&#10;</xsl:text>
  </xsl:template> 
</xsl:stylesheet>
