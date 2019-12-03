<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="utils.meaning" >
		
		<xsl:param name="key"/>
		
		<xsl:choose>
		
			<xsl:when test="$key = 'andWhere'">
				<xsl:text>.andWhere</xsl:text>	
			</xsl:when>
			<xsl:when test="$key = 'andWhereIsNull'">
				<xsl:text>.andWhereIsNull</xsl:text>	
			</xsl:when>
			<xsl:when test="$key = 'andWhereIsNotNull'">
				<xsl:text>.andWhereIsNotNull</xsl:text>		
			</xsl:when>
			<xsl:when test="$key = 'andWhereBetween'">
				<xsl:text>.andWhereBetween</xsl:text>	
			</xsl:when>
			<xsl:when test="$key = 'orWhere'">
				<xsl:text>.orWhere</xsl:text>	
			</xsl:when>
			<xsl:when test="$key = 'orWhereIsNull'">
				<xsl:text>.orWhereIsNull</xsl:text>	
			</xsl:when>
			<xsl:when test="$key = 'orWhereIsNotNull'">
				<xsl:text>.orWhereIsNotNull</xsl:text>		
			</xsl:when>
			<xsl:when test="$key = 'orWhereBetween'">
				<xsl:text>.orWhereBetween</xsl:text>	
			</xsl:when>
			<xsl:when test="$key = 'having'">
				<xsl:text>.having</xsl:text>		
			</xsl:when>
			<xsl:when test="$key = 'where'">
				<xsl:text>.where</xsl:text>	
			</xsl:when>
			
			<xsl:when test="$key = 'WHERE_EQUAL'">
				
				<xsl:text>," = ",</xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'WHERE_GT'">
				
				<xsl:text>," &gt; ",</xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'WHERE_LT'">
				
				<xsl:text>," &lt; ",</xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'WHERE_DIF'">
				
				<xsl:text>, " &lt;&gt; ", </xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'AND'">
				
				<xsl:text> &amp;&amp; </xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'OR'">
				
				<xsl:text> || </xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'EQ'">
				
				<xsl:text> == </xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'NEQ'">
				
				<xsl:text> != </xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'LT'">
				
				<xsl:text> &lt; </xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'LTE'">
				
				<xsl:text> &lt;= </xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'GT'">
				
				<xsl:text> &gt; </xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'GTE'">
				
				<xsl:text> &gt;= </xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'um'">
				
				<xsl:text>.findOne</xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'todos'">
				
				<xsl:text>.findAll</xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'TODOSS'">
				
				<xsl:text>.all();</xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'UMM'">
				
				<xsl:text>.one();</xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'TRUE'">
				
				<xsl:text> true </xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'WHERE_EQ'">
				
				<xsl:text>,"=",</xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'WHERE_DIF'">
				
				<xsl:text>,"&lt;&gt;",</xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'WHERE_LIKE'">
				
				<xsl:text>,"LIKE",</xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'FALSE'">
				
				<xsl:text> false </xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'WHILE'">
				
				<xsl:text></xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'UNTIL'">
				
				<xsl:text>!</xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'BREAK'">
				
				<xsl:text>break;</xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'CONTINUE'">
				
				<xsl:text>continue;</xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'ADD'">
				
				<xsl:text>+</xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'MINUS'">
				
				<xsl:text>-</xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'MULTIPLY'">
				
				<xsl:text>*</xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'DIVIDE'">
				
				<xsl:text>/</xsl:text>
					
			</xsl:when>
			
			<xsl:when test="$key = 'POWER'">
				
				<xsl:text>^</xsl:text>
					
			</xsl:when>
		
		</xsl:choose>
		
	</xsl:template>
	
</xsl:stylesheet>