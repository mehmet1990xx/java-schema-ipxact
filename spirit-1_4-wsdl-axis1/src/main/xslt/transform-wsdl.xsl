<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="3.0" xmlns:xsd="http://www.w3.org/2001/XMLSchema">

    <!--
      -  This file helps transform the original WSDL for use with AXIS 1.4
      -
      -  SPDX: MIT
      -
      -  The MIT License
      -
      -  Copyright (c) 2023 Darryl L. Miles
      -
      -  Permission is hereby granted, free of charge, to any person obtaining a copy
      -  of this software and associated documentation files (the "Software"), to deal
      -  in the Software without restriction, including without limitation the rights
      -  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
      -  copies of the Software, and to permit persons to whom the Software is
      -  furnished to do so, subject to the following conditions:
      -
      -  The above copyright notice and this permission notice shall be included in all
      -  copies or substantial portions of the Software.
      -
      -  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
      -  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
      -  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
      -  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
      -  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
      -  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
      -  SOFTWARE.
      -
      -->
    <xsl:output omit-xml-declaration="no"/>

    <xsl:template match="node()|@*">
        <xsl:copy>
            <apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>

    <!-- REPLACE xsd:union inside xsd:simpleType -->
    <xsl:template match="*:simpleType[@name='spiritURI']/*:union[@memberTypes='xsd:string']">
        <!-- XSD change by dlmiles, AXIS1 generation error on the original -->
        <!-- This is not really xsd:union unless you have multiple memberTypes specified ? -->
        <xsd:restriction base="xsd:string"/><!-- REPLACED WITH -->
        <!-- <xsd:union memberTypes="xsd:string"/> -->
    </xsl:template>

</xsl:stylesheet>
