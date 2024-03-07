<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <Students>
            <xsl:for-each-group select="Students/Student" group-by="@year">
                <xsl:for-each select="current-group()">
                    <xsl:variable name="averageGrades" select="avg((@grade1, @grade2, @grade3))"/>
                    <Student name="{concat(@firstName, ' ', @lastName)}"
                             finalGrade="{round($averageGrades)}"
                             graduated="{if ($averageGrades >= 5) then 'true' else 'false'}"
                             year="{@year}"
                             assignedNumber="{position()}"/>
                </xsl:for-each>
            </xsl:for-each-group>
        </Students>
    </xsl:template>
</xsl:stylesheet>
