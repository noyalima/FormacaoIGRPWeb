<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="IGRP-blocky">
		<link rel="stylesheet" href="{$path}/core/blockly/css/igrp.blocky.css"></link>
		<table height="100%" width="100%">
			<tr>
				<td colspan="2">
					<table width="100%">
						<tr id="tabRow" height="1em">
							<td id="tab_blocks" class="tabon">Blocks</td>
							<td class="tabmax">
 								<button id="refresh_bloco" type="button">Refresh Workspace</button> 
								<button id="save_bloco_igrp" type="button">Save Blocks</button>
								<button id="restore_bloco_igrp" type="button">Restore Blocks</button>
<!-- 								<button onclick="saveCode()">Salvar Java Code</button> -->
								<input type="file" id="load" style="display: none;" />
								<button id="trashButton" class="notext" title="...">
									<img src='{$path}/core/blockly/blockly/media/1x1.gif' class="trash icon21"></img>
								</button>
								<input type="file" id="load" style="display: none;" />
							</td>
							   <td class="farSide">
						       	 <select id="languageMenu"></select>
						      </td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="99%" id="content_area"></td>
			</tr>
		</table>
		<div id="content_blocks" class="content"></div>
		<div id="box_selenium">
		<div id="active_selenium">Mostrar Código XML</div>
		<textarea id="content_selenium" class="content" wrap="off"></textarea>
		</div> 
		
		<xml class="igrp-blockly-config" id="toolbox" style="display: none">
		
			<category id="inicial_script" name="Script Inicial" visible="false" colour="180" style="display: none">
			
			<block id="controller" type="controller" title="controller" color ="180" x="388" y="13">
					<value name="value1" type="dummy" title="action index"></value>
					<value name="index" type="statement" ></value>
 					<next id="add_action"></next> 
				</block>
<!-- 				<block type="action_index" color ="180" prev-statement="script_inicial" > -->
<!-- 					<value name="value1" type="dummy" title="Action Index"></value> -->
<!-- 					<value name="CODE" type="statement" ></value> -->
<!-- 					<next id="add_action"></next> -->
<!-- 				</block>  -->
			</category>
			
			<sep></sep>
			
			<category id="catLogic" name="Logic" colour="230">
			
 				<block type="controls_if" default="true"></block>
 			
 				<block type="logic_compare" default="true"></block>
 				
				<block type="logic_operation" default="true"></block>
				
				<block type="logic_negate" default="true"></block>
				
				<block type="logic_boolean" default="true"></block>
				
				<block type="logic_null" default="true"></block>
				
				<block type="tentar" prev-statement="" next-statement="" color="230">
					<value name="value1" type="dummy" title="try"></value>
					<value name="value2" type="statement"></value>
					<value name="value3" type="dummy" title="catch"></value>
					<value name="value4" type="statement"></value>    
				</block>
				
			</category>
			
			<category id="catLoops" name="Loops" colour="230">
			
				<block type="controls_repeat_ext" default="true">
					<value name="TIMES">
						<block type="math_number" default="true">
							<field name="NUM">10</field>
						</block>
					</value>
				</block>
				
 				<block type="controls_whileUntil" default="true"></block>

 				<block type="controls_for" default="true">
					<value name="FROM">
						<block type="math_number" default="true">
							<field name="NUM">1</field>
						</block>
					</value>
					<value name="TO">
						<block type="math_number" default="true">
							<field name="NUM">10</field>
						</block>
					</value>
					<value name="BY">
						<block type="math_number" default="true">
							<field name="NUM">1</field>
						</block>
					</value>
				</block>
					
<!--  				<block type="controls_forEach" default="true"></block> -->
 				
 				<block type="controls_flow_statements" default="true"></block>
 				
			</category>
			
			<category id="catMath" name="Math" colour="230">
			
				<block type="math_number" default="true"></block>
				
				<block type="math_arithmetic" default="true"></block>
				
			</category>
			
			<category id="catText" name="Text" colour="230">
			
					<block type="text" default="true"></block>
					
					<block type="text_print" default="true"></block>
					
			</category>
			
<!-- 			<category id="catVariables" custom="VARIABLE" name="Variables" default="true" colour="230"></category> -->
			
			<sep></sep>
			
<!-- 			<category id="core" name="Core IGRP" colour="1"> -->
			
<!-- 				<block type="core_get_msg" output="" color="1"> -->
<!-- 					<value name="value1" type="value"  title="Core"> -->
<!-- 						<field type="dropdown" name="core_get" options="IGRP_BLOCKLY_DROPS.core_msg"></field> -->
<!-- 					</value> -->
<!-- 				</block> -->
				
<!-- 				<block type="core_set_msg" prev-statement="" color ="1"> -->
<!-- 					<value name="CORE" type="value" title="Core"> -->
<!-- 						<field type="dropdown" name="core_set" options="IGRP_BLOCKLY_DROPS.core_msg"></field> -->
<!-- 					</value> -->
<!-- 				</block> -->
				
<!-- 				<block type="core_get_conv" output="" color="1"> -->
<!-- 					<value name="value1" type="value"  title="Core"> -->
<!-- 						<field type="dropdown" name="core_get" options="IGRP_BLOCKLY_DROPS.core_conv"></field> -->
<!-- 					</value> -->
<!-- 				</block> -->
				
<!-- 				<block type="core_set_conv" prev-statement="" color ="1"> -->
<!-- 					<value name="CORE" type="value" title="Core"> -->
<!-- 						<field type="dropdown" name="core_set" options="IGRP_BLOCKLY_DROPS.core_conv"></field> -->
<!-- 					</value> -->
<!-- 				</block> -->
				
<!-- 				<block type="core_get_if" output="" color="1"> -->
<!-- 					<value name="value1" type="value"  title="Core"> -->
<!-- 						<field type="dropdown" name="core_get" options="IGRP_BLOCKLY_DROPS.core_if"></field> -->
<!-- 					</value> -->
<!-- 				</block> -->
				
<!-- 				<block type="core_set_if" prev-statement="" color ="1"> -->
<!-- 					<value name="CORE" type="value" title="Core"> -->
<!-- 						<field type="dropdown" name="core_set" options="IGRP_BLOCKLY_DROPS.core_if"></field> -->
<!-- 					</value> -->
<!-- 				</block> -->
				
<!-- 			</category> -->

<!-- 			<sep></sep> -->
			
		</xml>
		<!-- import required blockly and blocks -->
		<script type="text/javascript" src="{$path}/core/blockly/blockly/blockly_compressed.js"></script>
		<script type="text/javascript" src="{$path}/core/blockly/blockly/blocks_compressed.js"></script>
		<!-- import code -->
		<script type="text/javascript" src="{$path}/core/blockly/blockly/javascript_compressed.js"></script>
		<!-- import code - custom and helper -->
		<script type="text/javascript" src="{$path}/core/blockly/blockly/igrp_blockly_elements.js"></script>
		<script type="text/javascript" src="{$path}/core/blockly/blockly/java_compressed.js"></script>
		<script type="text/javascript" src="{$path}/core/blockly/blockly/teste_mutators.js"></script>
		<script type="text/javascript" src="{$path}/core/blockly/blockly/igrp_loads.js"></script>
		<script type="text/javascript" src="{$path}/core/blockly/blockly/igrp_block.js"></script>	
		<script type="text/javascript" src="{$path}/core/blockly/js/code.js"></script>
		<!-- import message language -->
		<script type="text/javascript" src="{$path}/core/blockly/blockly/msg/js/en.js"></script>
		<script type="text/javascript" src="{$path}/core/blockly/js/Blob.js"></script>
		<script type="text/javascript" src="{$path}/core/blockly/js/spin.js"></script>
		<script type="text/javascript" src="{$path}/core/blockly/js/FileSaver.min.js"></script>
		<script type="text/javascript" src="{$path}/core/blockly/js/file_helper.js"></script>
	</xsl:template>
</xsl:stylesheet>