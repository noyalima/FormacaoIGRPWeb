<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="blockly.element.logic_operation">
		
   		<xsl:variable name="valorA">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="value[@name='A']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="operator">
			<xsl:call-template name="utils.meaning">
				<xsl:with-param name="key" select="field[@name='OP']"/>
			</xsl:call-template>
		</xsl:variable>
	
		<xsl:variable name="valorB">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="value[@name='B']"/>
			</xsl:call-template>
		</xsl:variable>
	
		<xsl:value-of select="concat($valorA,$operator,$valorB)"></xsl:value-of>
			
	</xsl:template>
	
	<xsl:template name="blockly.element.logic_compare">
	
		<xsl:variable name="valorA">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="value[@name='A']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="operator">
			<xsl:call-template name="utils.meaning">
				<xsl:with-param name="key" select="field[@name='OP']"/>
			</xsl:call-template>
		</xsl:variable>
	
		<xsl:variable name="valorB">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="value[@name='B']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:value-of select="concat($valorA,$operator,$valorB)"></xsl:value-of>

	</xsl:template>
	
	<xsl:template name="blockly.element.logic_boolean">
	
		<xsl:variable name="operator">
			<xsl:call-template name="utils.meaning">
				<xsl:with-param name="key" select="field[@name='BOOL']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:value-of select="$operator"></xsl:value-of>

	</xsl:template>
	
	<xsl:template name="blockly.element.logic_null">
	
		<xsl:text>null</xsl:text>

	</xsl:template>
	
	<xsl:template name="blockly.element.logic_negate">
	
		<xsl:variable name="valor">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="value[@name='BOOL']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:text>!</xsl:text><xsl:value-of select="$valor"></xsl:value-of>

	</xsl:template>	

	<xsl:template name="blockly.element.tentar">
	
		<xsl:variable name="code">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="statement[@name='value2']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="excpCode">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="statement[@name='value4']"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:call-template name="utils.try"/>
		<xsl:value-of select="$code"></xsl:value-of>
		<xsl:value-of select="$newline"/>
		<xsl:call-template name="utils.try.catch">
		</xsl:call-template>
		<xsl:value-of select="$newlineTab1"/>
		<xsl:value-of select="$excpCode"></xsl:value-of>
		<xsl:value-of select="$newline"/>
		<xsl:call-template name="utils.try.end">
		</xsl:call-template>
	
	</xsl:template>
	
	<xsl:template name="blockly.element.math_number">
	
		<xsl:value-of select="field[@name='NUM']"></xsl:value-of>

	</xsl:template>
	
	<xsl:template name="blockly.element.controls_repeat_ext">
	
		<xsl:variable name="valor1">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="value[@name='TIMES']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="valor2">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="statement[@name='DO']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:text>for(int i=0; i&lt;</xsl:text><xsl:value-of select="$valor1"></xsl:value-of>
		<xsl:text>;i++){</xsl:text><xsl:value-of select="$newlineTab1"/>
		<xsl:value-of select="$valor2"></xsl:value-of>
		<xsl:value-of select="$newline"/>
		<xsl:text>}</xsl:text>

	</xsl:template>
	
	<xsl:template name="blockly.element.controls_flow_statements">
		
		<xsl:variable name="break_cont">
			<xsl:call-template name="utils.meaning">
				<xsl:with-param name="key" select="field[@name='FLOW']"/>
			</xsl:call-template>
		</xsl:variable>
	
		
		<xsl:value-of select="$break_cont"></xsl:value-of>
	</xsl:template>		
	
	<xsl:template name="blockly.element.controls_whileUntil">
		
		<xsl:variable name="whileuntil">
			<xsl:call-template name="utils.meaning">
				<xsl:with-param name="key" select="field[@name='MODE']"/>
			</xsl:call-template>
		</xsl:variable>
	
		<xsl:variable name="condition">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="value[@name='BOOL']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="do">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="statement[@name='DO']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:text>while(</xsl:text><xsl:value-of select="$whileuntil"></xsl:value-of>
		<xsl:text>(</xsl:text><xsl:value-of select="$condition"></xsl:value-of>
		<xsl:text>)){</xsl:text><xsl:value-of select="$newlineTab1"/>
		<xsl:value-of select="$do"></xsl:value-of>
		<xsl:value-of select="$newline"/>
		<xsl:text>}</xsl:text>

	</xsl:template>

	<xsl:template name="blockly.element.math_arithmetic">
	
		<xsl:variable name="valor1">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="value[@name='A']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="signal">
			<xsl:call-template name="utils.meaning">
				<xsl:with-param name="key" select="field[@name='OP']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="valor2">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="value[@name='B']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:value-of select="concat($valor1,$signal,$valor2)"></xsl:value-of>

	</xsl:template>	
	
	<xsl:template name="blockly.element.text">
		
		<xsl:text>"</xsl:text><xsl:value-of select="field[@name='TEXT']"></xsl:value-of><xsl:text>"</xsl:text>

	</xsl:template>
	
	<xsl:template name="blockly.element.text_print">
	
		<xsl:variable name="valor">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="value[@name='TEXT']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:text>System.out.println(</xsl:text><xsl:value-of select="$valor"></xsl:value-of><xsl:text>);</xsl:text>

	</xsl:template>
	
	<xsl:template name="blockly.element.controls_for">
	
		<xsl:variable name="variavel" select="field[@name='VAR']"/>
	
		<xsl:variable name="de">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='FROM']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="ate">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='TO']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="incremento">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='BY']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="DO">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='DO']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:text>for(int </xsl:text><xsl:value-of select="$variavel"></xsl:value-of>
		<xsl:text>=</xsl:text><xsl:value-of select="$de"></xsl:value-of><xsl:text>; </xsl:text>
		<xsl:value-of select="$variavel"></xsl:value-of><xsl:text>&lt;</xsl:text>
		<xsl:value-of select="$ate"></xsl:value-of><xsl:text>; </xsl:text>
		<xsl:value-of select="$variavel"></xsl:value-of><xsl:text>+=</xsl:text>
		<xsl:value-of select="$incremento"></xsl:value-of><xsl:text>){</xsl:text>
		<xsl:value-of select="$newline"></xsl:value-of>
		<xsl:value-of select="$DO"></xsl:value-of>
		<xsl:value-of select="$newline"></xsl:value-of>
		<xsl:text>}</xsl:text>
		

	</xsl:template>
	
</xsl:stylesheet>