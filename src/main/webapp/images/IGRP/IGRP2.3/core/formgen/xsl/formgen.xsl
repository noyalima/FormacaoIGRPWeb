<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	  <xsl:variable name="sourcePath" select="concat($path,'/core/formgen/util/gen.source.xml')"/>
    <xsl:variable name="gen" select="document($sourcePath)/gen"/>
    <xsl:variable name="logo">
      <xsl:choose>
        <xsl:when test="$themeConfigData/logo">
          <xsl:value-of select="concat($themePath,'/',$themeConfigData/logo)"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="concat($path,'/themes/default/img/logo2.svg')"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

  	<xsl:template name="formgen-html">
  		
      <html>          
        <head>            
       	  
          <xsl:call-template name="IGRP-head"/>            
          <xsl:call-template name="GEN-head"/>
          <script>    
           	window.moveTo(0, 0);
           	window.resizeTo(screen.width, screen.height);
      	  </script>
        </head>

        <body class="fixed-nav startin" view="gen-design" template="{rows/template}" id="igrp-form-gen">            
          <nav id="igrp-top-nav" class="navbar navbar-fixed-top" bg-color="template">
              <a class="navbar-brand col-sm-3 col-md-2" href="{rows/link}" >
                  <img src="{$logo}"/>
                  <span><b>IGRP</b></span>
              </a>
              <div id="side-bar-ctrl" bg-hover-color="template">
                  <i class="fa fa-navicon"></i>
              </div>
              <!-- <div id="igrp-app-title" class="">Studio</div> -->
              <div id="gen-views-ctrl">
                  <ul>
                      <li rel="gen-design" class="active" active-text-color="primary">
                          <span>DESIGN</span>
                      </li>
                      <li rel="gen-css" active-text-color="primary">
                          <span>CSS</span>
                      </li>
                      <li rel="gen-js" active-text-color="primary">
                          <span>JS</span>
                      </li>
                      <li rel="gen-xml" active-text-color="primary">
                          <span>XML</span>
                      </li>
                      <li rel="gen-xsl" active-text-color="primary">
                          <span>XSL</span>
                      </li>
                      <!-- <li rel="gen-plsql" xslt-path="{$path}/core/formgen/util/plsql" xslt-file="XSL-plsql.xsl" text-color="1">
                          <span>PLSQL</span>
                      </li>  -->
                     
                     <li rel="gen-blocky"  active-text-color="primary">
                        <span>BLOCKLY (BETA)</span>
                      </li>
                      
                      <li rel="gen-java" xslt-path="{$path}/core/formgen/util/java" xslt-file="XSL_GENERATOR.xsl" text-color="1">
                        <span>JAVA</span>
                      </li>
                      
                      <!--  -->
                      
                  </ul>
              </div>
              <!--
              <div id="igrp-app-title" class="">INTEGRATED GOVERNMENT RESOURCE PLANNING</div>-->
              <ul id="igrp-top-menu" class="hidden-xs nav navbar-nav navbar-right">
                  <xsl:for-each select="rows/content/form/tools-bar/item">
                      <li>
                          <a target="{target}" class="form-gen-save igrpClick">
                              <xsl:call-template name="page-nav">
                                  <xsl:with-param name="action" select="link" />
                                  <xsl:with-param name="page" select="page" />
                                  <xsl:with-param name="app" select="app" />
                                  <xsl:with-param name="linkextra" select="parameter" />
                              </xsl:call-template> 
                              <i class="fa fa-cog fa-spin fa-fw hidden"></i><span><xsl:value-of select="title"/></span>
                              
                          </a>
                      </li>
                  </xsl:for-each>
                  <!-- <li alt="Publicar">
                      <a href="#">
                          <i class="fa fa-refresh"></i>
                      </a>
                  </li>
                  <li alt="Gravar" class="form-gen-save">
                      <a href="#">
                          <i class="fa fa-save"></i>
                      </a>
                  </li> -->
              </ul>
          </nav>

          <form class="IGRP-form" name="formular_default" novalidate="">
              <div class="container-fluid">
                  <div class="row">
                      <div class="col-md-2 col-sm-3 sidebar tree-list" id="igrp-sidebar" bg-color="secondary">
                          
                          <ul class="nav nav-tabs col-md-2 col-sm-3 col-xs-12 clearfix" role="tablist" bg-color="secondary">
                             <!--<li class="col-xs-4">
                                  <a class="txt-ellipsis" href="#gen-page-properties" role="tab" data-toggle="tab">
                                      <i class="fa fa-cog"></i>
                                      <span class="">Settings</span>
                                  </a>
                              </li>-->
                              <li class="active col-xs-6">
                                  <a class="txt-ellipsis" href="#gen-list-components" role="tab" data-toggle="tab">
                                      <i class="fa fa-cube"></i>
                                      <span class="">Components</span>
                                  </a>
                              </li> 
                              <li class="col-xs-6">
                                  <a class="txt-ellipsis" href="#gen-list-fields" role="tab" data-toggle="tab">
                                      <i class="fa fa-dot-circle-o"></i>
                                      <span class="">Fields</span>
                                  </a>
                              </li> 
                              
                          </ul>

                          <div class="form-group gen-searcher-wrapper col-md-2 col-sm-3 col-xs-12" h-calc="-55">
                           
                            <input bg-color="secondary" type="text" class="form-control gen-types-search" placeholder="Pesquisar..."/>
                            
                            <span class="gen-type-search-clear">
                              <i class="fa fa-times"></i>
                            </span>

                            <div class="gen-searcher-contents" bg-color="secondary">
                              
                            </div>

                          </div>

                          <div class="tab-content" style="margin:0 -20px;padding:0;border:0">
                              <div role="tabpanel" class="tab-pane active" id="gen-list-components">
                                  <ul class="treeview-menu gen-containers menu-open" style="display:block">
                                      <xsl:for-each select="$gen/containers/item">
                                          <xsl:sort select="label"/>
                                          <li class="gen-declared-containers" label="{label}" name="{name}" type="{type}" reject="{reject}" accept="{accept}" hasField="{hasField}">
                                              <a href="#">
                                                  <xsl:call-template name="getComponentIcon"/>
                                                  <span>
                                                      <xsl:value-of select="label"/>
                                                  </span>
                                              </a>
                                          </li>
                                      </xsl:for-each>
                                  </ul>
                              </div>
                              <div role="tabpanel" class="tab-pane" id="gen-list-fields">
                                  <ul class="treeview-menu gen-fields menu-open" style="display:block">
                                      <xsl:for-each select="$gen/fields/item">
                                          <xsl:sort select="label"/>
                                          <li alt="{name}" title="{name}" label="{label}" name="{name}" type="{type}" reject="{reject}" accept="{accept}" class="gen-declared-fields">
                                              <a href="#">
                                                  <xsl:call-template name="getComponentIcon"/>
                                                  <span >
                                                     <xsl:value-of select="label"/>
                                                  </span>
                                              </a>
                                          </li>
                                      </xsl:for-each>
                                  </ul>
                              </div>

                              <div role="tabpanel" class="tab-pane" id="gen-page-properties">
                                  
                                  <xsl:call-template name="page-properties-tab"/>

                              </div>

                          </div>

                          <!-- <ul class="nav nav-sidebar">
                            <li>
                                <a href="#" id="gen-page-setts-ctrl">
                                    <i class="fa fa-gears"></i>
                                    <span>PL/SQL Settings</span>
                                </a>
                            </li>

                            <li>
                                <a href="#" id="download-gen-xsl">
                                    <i class="fa fa-upload"></i>
                                    <span>Download</span>
                                </a>
                            </li> 

                        </ul> -->

                          <!-- <ul class="nav nav-sidebar">
                              <li class="treeview active">
                                  <a href="#">
                                      <i class="fa fa-th"></i>
                                      <span>Components</span>
                                      <i class="fa fa-angle-right pull-right"></i>
                                  </a>
                                  <ul class="treeview-menu gen-containers menu-open" style="display:block">
                                      <xsl:for-each select="$gen/containers/item">
                                          <li class="gen-declared-containers" alt="{name}" title="{name}" name="{name}" type="{type}" reject="{reject}" accept="{accept}" hasField="{hasField}">
                                              <a href="#">
                                                  <i class="fa fa-angle-right"></i>
                                                  <span>
                                                      <xsl:value-of select="label"/>
                                                  </span>
                                              </a>
                                          </li>
                                      </xsl:for-each>
                                  </ul>
                              </li>
                              <li class="treeview">
                                  <a href="#">
                                      <i class="fa fa-dot-circle-o"></i>
                                      <span>Fields</span>
                                      <i class="fa fa-angle-right pull-right"></i>
                                  </a>
                                  <ul class="treeview-menu gen-fields">
                                      <xsl:for-each select="$gen/fields/item">
                                          <li alt="{name}" title="{name}" name="{name}" type="{type}" reject="{reject}" accept="{accept}" class="gen-declared-fields">
                                              <a href="#">
                                                  <i class="fa fa-angle-right"></i>
                                                  <span>
                                                      <xsl:value-of select="label"/>
                                                  </span>
                                              </a>
                                          </li>
                                      </xsl:for-each>
                                  </ul>
                              </li>
                          </ul> -->
                      </div>
                      <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                          
                          <div class="content gen-viewers active" id="gen-design">
                              
                              <h2 id="gen-page-title"></h2>

                              <div class=" gen-rows-holder " >
                                  
                              </div>


                          </div>

                          <div id="gen-css" class="gen-viewers">
                              <div id="gen-css-view" class="gen-code-mirror"></div>
                          </div>

                          <div id="gen-js" class="gen-viewers">
                              <div id="gen-js-view" class="gen-code-mirror"></div>
                          </div>

                          <div id="gen-xml" class="gen-viewers">
                              <div id="gen-xml-view" class="gen-code-mirror"></div>
                          </div>
                          <div id="gen-xsl" class="gen-viewers">
                              <div id="gen-xsl-view" class="gen-code-mirror"></div>
                          </div>
                          <div id="gen-plsql" class="gen-viewers">
                              <div id="gen-plsql-view" class="gen-code-mirror"></div>
                          </div>

                          <div id="gen-java" class="gen-viewers">
                            <div class="gen-editor-toolsbar col-sm-2 pull-right" ></div>
                            <div class="gen-editors-wrapper"></div>
                            <!-- <div id="gen-java-view" class="gen-code-mirror col-sm-10 custom-size"></div> -->
                        </div>
                        
                        <div id="gen-blocky" class="gen-viewers">

                              <div id="gen-blocky-view">
                              		
                              		<xsl:call-template name="IGRP-blocky"></xsl:call-template>
                              	
                              </div>
                          </div>
                          

                          <div class="gen-viewers-toolbar clearfix">
                              
                              <div class="pull-left">
                                  <a href="#" class="btn btn-link gen-include-file">
                                     <i class="fa fa-plus"></i>  Include<span class="f-type"></span>:<span class="f-count"></span>
                                  </a>
                              </div>
                             
                             
                              <div class="pull-right gen-toolbar-items" rel="java">
                                  <a href="{$path}/../../javadoc/index.html" class="btn btn-link" target="_newtab">                                  
                                   <i class="fa fa-file-text"></i>
                                  <span>Javadoc - Core.class</span>                                  
                                  </a>
                                  <a href="https://nosicode.gitbook.io/faq/" class="btn btn-link" target="_newtab">                                 
                                    <i class=" fa fa-question-circle"></i>
                                    <span>Guide - How to...</span>
                                  </a>
                              </div>
<!--                               <div class="btn btn-link pull-right gen-copy-to-clipboard" > -->
<!--                                  <i class="fa fa-clipboard"></i><span>Copiar</span> -->
<!--                               </div> -->
                              <!-- <a class="btn btn-link pull-right gen-download-content" href="#">
                                 <i class="fa fa-upload"></i><span>Download</span>
                              </a> -->
                              <a class="btn btn-link pull-left gen-page-setts-ctrl"  rel="plsql">
                                  <i class="fa fa-gears"></i>
                                  <span>Settings</span>
                              </a>                             
                             <div class="pull-left">
                     		  <select class="form-control btn" id="code-mirror-theme-selector" 
                     		  						style="padding-bottom: 0px;  padding-top: 0px;    height: 28px;">
                    		   		<option value="eclipse">Eclipse theme</option>
									<option value="midnight">Midnight theme</option>
									<option value="blackboard">Blackboard theme</option>
									<option value="colorforth">Colorforth theme</option>
									<option value="icecoder">Icecoder theme</option>
									<option value="monokai">Monokai theme</option>
									<option value="night">Night theme</option>
								</select>
									
                             </div>
                            
                              
                       
                          </div>
                          


                      </div>
                  </div>
              </div>
              <!--
              <div class="link-opener">
                  <iframe id="opener-frame"></iframe>
              </div>-->
              <form-hidden class="form-hidden" style="display:none!important">
                  <xsl:if test="rows/content/form/label/page_xml">
                      <input type="hidden" name="{rows/content/form/value/page_xml/@name}" value="{rows/content/form/value/page_xml}"/>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/page_xsl">
                      <input type="hidden" name="{rows/content/form/value/page_xsl/@name}" value="{rows/content/form/value/page_xsl}" id="id_{rows/content/form/value/page_xsl/@name}"/>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/data">
                      <input type="hidden" name="{rows/content/form/value/data/@name}" value="{rows/content/form/value/data}" id="{rows/content/form/value/data/@name}" class="file uploadFile form-hidden"/>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/id_objeto">
                      <input type="hidden" id="id_objeto" name="{rows/content/form/value/id_objeto/@name}" value="{rows/content/form/value/id_objeto}" class="number form-hidden" maxlength="30"/>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/nome">
                      <input type="hidden" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}" class="text form-hidden" maxlength="100"/>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/link_image">
                      <input type="hidden" class="form-hidden" name="p_link_image" value="{rows/content/form/value/link_image}"></input>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/link_save">
                      <input type="hidden" class="form-hidden" name="p_link_save" value="{rows/content/form/value/link_save}"></input>
                  </xsl:if>
              </form-hidden>
              <!--PAGE SETTINGS-->
              <div class="modal fade" data-backdrop="static" tabindex="-1" id="gen-settings-modal" role="dialog" >
                  <div class="modal-dialog">
                      <div class="modal-content">
                          <div class="modal-header">
                              <h4 id="" class="modal-title">Settings</h4>
                          </div>
                          <div class="modal-body" role="form">
                              <div id="gen-page-settings" rel="settings">
                                  <!--  <xsl:if test="rows/content/form/label/instancia">
                                      <div class="col-md-6 form-group" item-name="instancia">
                                          <label>
                                              <xsl:value-of select="rows/content/form/label/instancia" disable-output-escaping="yes"/>
                                          </label>
                                          <select name="{rows/content/form/list/instancia/@name}" id="{rows/content/form/list/instancia/@name}" data-placeholder="{rows/content/form/list/instancia/option[position() = 1]/text}" class="select gen-page-setter form-control" rel="instance" required="required">
                                              
                                              <xsl:for-each select="rows/content/form/list/instancia/option[position() != 1]">
                                                  <option value="{value}">
                                                      <xsl:if test="@selected='true'">
                                                          <xsl:attribute name="selected">selected</xsl:attribute>
                                                      </xsl:if>
                                                      <xsl:value-of select="text"/>
                                                  </option>
                                              </xsl:for-each>
                                          </select>
                                      </div>
                                  </xsl:if>-->
                                  <div class="col-md-6 form-group" item-name="gentype">
                                      <label>Gen Type</label>
                                      <select name="p_gentype" id="p_gentype" class="select gen-page-setter form-control" rel="gentype">
                                        <!-- <option value="plsql" >Plsql</option> -->
                                        <option value="java" selected="">Java</option>
                                      </select>
                                  </div>
<!--                                   <div class="col-md-6 form-group" item-name="table_name"> -->
<!--                                       <label>Table Name</label> -->
<!--                                       <input rel="table" type="text" name="plsql_table" value="" class="text gen-page-setter form-control" maxlength="50"/> -->
<!--                                   </div> -->
                                  <div class="col-md-6 form-group" item-name="package_db_name" required="required">
                                      <label>Package Name (DB)</label>
                                      <input rel="package" required="" type="text" name="plsql_pack" value="" class="text gen-page-setter form-control" maxlength="500"/>
                                  </div>
                                  <div class="col-md-6 form-group" item-name="package_html_name" required="required">
                                      <label>Package Name (HTML)</label>
                                      <input rel="html" type="text" required="" name="plsql_html" value="" class="text gen-page-setter form-control" maxlength="500"/>
                                  </div>
                                  <!-- <div class="col-md-6 form-group" item-name="subversionpath">
                                      <label>Subversion Path</label>
                                      <input rel="subversionpath" type="text" name="plsql_subv" value="" class="text gen-page-setter form-control"/>
                                  </div> -->
<!--                                   <div class="col-md-6 form-group" item-name="page_service"> -->
<!--                                       <label>Service</label> -->
<!--                                       <div class="settings-service"></div> -->
<!--                                   </div> -->
								 <div class="col-md-5 col-md-offset-1 checkbox" style="margin-top:15px">
                                      <div  item-name="process">
                                          <input rel="process" type="checkbox" name="plsql_process" value="" class="checkbox gen-page-setter "/>
                                          <span>Processo</span>
                                      </div>
                                  </div>
                                  <!-- <div class="col-md-5 col-md-offset-1 checkbox" style="margin-top:15px">
                                      <div  item-name="replace">
                                          <input rel="replace" type="checkbox" name="plsql_replace" value="" class="checkbox gen-page-setter "/>
                                          <span>Replace</span>
                                      </div>
                                      <div item-name="label">
                                          <input rel="label" type="checkbox" name="plsql_label" value="" class="checkbox gen-page-setter"/>
                                          <span>Label</span>
                                      </div>
                                  </div> -->
                              </div>
                          </div>
                          <div class="modal-footer" id="gen-page-setts-btns" style="clear:both">
                              <button disabled="disabled" class="btn btn-link" id="gen-execute-subv">Subversion</button>
                              <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                              <button type="button" class="btn btn-primary" id="gen-page-setts-confirm">Confirm</button>
                          </div>
                      </div>
                  </div>
              </div>
              <!--EDITION MODAL-->
              <div class="modal fade" tabindex="" id="gen-edition-modal" role="dialog" >
                  <div class="modal-dialog">
                      <div class="modal-content">
                          <div class="modal-header">
                              <ul>
                                  <li class="active" rel="properties">Properties</li>
                                  <li rel="style">Style</li>
                                  <li rel="validation">Validation</li>
                                  <li rel="rules">Rules</li>
                                   
                                  <li rel="xsl">XSL</li>
                                  <li rel="copy" gen-type="container">Copy From</li>
                              </ul>
                              <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times"/></button>
                          </div>
                          <div class="modal-body" role="form">
                              <div rel="properties" class="gen-properties-setts-holder active">
                                  
                              </div>

                              <div rel="style" class="gen-properties-setts-holder">
                                  <div class="form-group col-md-6">
                                      <label>ID</label>
                                      <input type="text" rel="id" value="" class="form-control style-setter"/>
                                  </div>
                                  <div class="form-group col-md-6">
                                      <label>Class</label>
                                      <input type="text" rel="class" value="" class="form-control style-setter"/>
                                  </div>
                                  <div class="form-group col-md-12">
                                      <label>Inline Style</label>
                                      <textarea rel="inline" value="" class="form-control style-setter"/>
                                  </div>
                              </div>

							  <div rel="validation" class="gen-properties-setts-holder">
                                  <xsl:call-template name="igrp-field-validation"/>
                              </div>
                              
                              <div rel="rules" class="gen-properties-setts-holder">
                                  <xsl:call-template name="rules-list"/>
                              </div>
                              
                              

                              <div rel="xsl" class="gen-properties-setts-holder">
                                  <div>
                                      <!-- <select class="object-xsl-templates"></select> -->
                                      <input id="use-default-xsl" type="checkbox"/>Default
                                  </div>
                                  
                                  <div id="gen-edit-xsl" class="gen-code-mirror">
                                      
                                  </div>
                              </div>

                              <div rel="copy" class="gen-properties-setts-holder" gen-type="container">
                                  
                                  <div class="col-md-12 form-group" item-type="select" >
                                      <label>From Page</label>
                                      <select id="gen-page-copy-selecter" class="form-control select2"></select>
                                  </div>

                                  <div id="gen-page-copy-c-list" class="col-md-12 form-group">
                                          
                                  </div>
                              </div>

                          </div>
                          <div class="modal-footer">
                              <div class="">
                                  <span class="info object"></span>
                                  <span class="info type"></span>
                                  <span class="info parent" style="display:none"></span>
                              </div>
                              
                              <div class="modal-buttons text-right">
                                  <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button> 
                              	<button type="button" class="btn btn-primary"  id="gen-edit-confirm">Confirm <i class="fa fa-check"/></button>
                          	</div>
                          </div>

                      </div>
                  </div>
              </div>
              <!-- <a class="btn btn-primary" data-toggle="modal" href='#modal-id'>Trigger modal</a> -->
              <div class="modal fade" id="gen-include-file-modal">
                  <div class="modal-dialog">
                      <div class="modal-content">
                          <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                              <h4 class="modal-title"></h4>
                          </div>
                          <div class="modal-body">
                              <div class="box gen-container-item clean" gen-class="" item-name="file_inc">
                                <div class="box-body IGRP-separatorlist" tag="file_inc" dialog="false">
                                  <div class="splist-form-holder">
                                    <div class="splist-form" role="form">
                                      <div class="form-group col-md-12 gen-fields-holder" item-name="file" item-type="text" required="required">
                                        <label>File URL</label>
                                        <input required="required" type="text" value="" class="form-control " id="p_file" name="p_file"></input>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="table-box box-body box-table-contents splist-table">
                                    <table rel="T_file_inc" id="file_inc" class="table table-striped gen-data-table">
                                      <thead>
                                        <tr>
                                          <th align="" item-name="file">Files</th>
                                          <th class="table-btn">
                                            <a class="table-row-add btn btn-link">
                                              <i class="fa fa-plus"/>
                                            </a>
                                          </th>
                                        </tr>
                                      </thead>
                                      <tbody>

                                      </tbody>
                                    </table>
                                  </div>
                                </div>
                              </div>
                          </div>
                          <div class="modal-footer">
                              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                              <button type="button" class="btn btn-primary" id="gen-inc-confirm">Confirm</button>
                          </div>
                      </div>
                  </div>
              </div>

              <xsl:call-template name="IGRP-bottom"/>
          </form>

          <script src="{$path}/core/formgen/js/GEN.componentsSearcher.js"></script>
          
          <script type="text/javascript" src="{$path}/core/ckeditor/ckeditor.js"/>

          <script src="{$path}/core/bootstrap/plugins/tabdrop/js/bootstrap-tabdrop.js" type="text/javascript"></script>

          <!-- RULES -->
          <script src="{$path}/core/igrp/IGRP.rules.class.js"></script>
          <!-- /RULES -->

          <!-- start:LOOKUP JS INCLUDES -->
          <script type="text/javascript" src="{$path}/plugins/lookup/igrp.lookup.js">
          </script>
          <!-- end:LOOKUP JS INCLUDES -->

          <!-- start:SEPARATORLIST -->
          <script type="text/javascript" src="{$path}/plugins/separatorlist/igrp.separatorlist.js"></script>
          <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"></script>
          <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"></script>
          <!-- end:SEPARATORLIST -->

          <!-- FORMLIST JS INCLUDES -->
          <script type="text/javascript" src="{$path}/plugins/formlist/igrp.formlist.js?v={$version}"/>


          <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"></script>
         
          <script src="{$path}/core/bootstrap/plugins/treeview/js/bootstrap-treeview.js"></script>
          <!--code mirror-->
          <script src="{$path}/core/codemirror/js/codemirror.js"></script>
          <script src="{$path}/core/codemirror/js/clike.js"></script>
          <script src="{$path}/core/codemirror/js/formatting.js"></script>
          <script src="{$path}/core/codemirror/js/mode/sql/sql.js"></script>
          <script src="{$path}/core/codemirror/js/mode/xml/xml.js"></script>
          <script src="{$path}/core/codemirror/js/mode/xml/xslt.js"></script>
          <script src="{$path}/core/codemirror/js/mode/css/css.js"></script>
          <script src="{$path}/core/codemirror/js/mode/javascript/javascript.js"></script>
          
          <script src="{$path}/core/codemirror/js/keymap/sublime.js"></script>
          
          <script src="{$path}/core/codemirror/js/addon/fold/foldcode.js"></script>
          <script src="{$path}/core/codemirror/js/addon/fold/foldgutter.js"></script>
          <script src="{$path}/core/codemirror/js/addon/fold/brace-fold.js"></script>
          <script src="{$path}/core/codemirror/js/addon/fold/xml-fold.js"></script>
          <script src="{$path}/core/codemirror/js/addon/fold/indent-fold.js"></script>
          <script src="{$path}/core/codemirror/js/addon/fold/markdown-fold.js"></script>
          <script src="{$path}/core/codemirror/js/addon/fold/comment-fold.js"></script>
          <script src="{$path}/core/codemirror/js/addon/edit/matchtags.js"></script>
          <script src="{$path}/core/codemirror/js/addon/edit/closebrackets.js"></script>        
          <script src="{$path}/core/codemirror/js/addon/edit/matchbrackets.js"></script> 
          <script src="{$path}/core/codemirror/js/addon/hint/xml-hint.js"></script>         
          <script src="{$path}/core/codemirror/js/addon/hint/show-hint.js"></script>
          <script src="{$path}/core/codemirror/js/addon/hint/sql-hint.js"></script>
          <script src="{$path}/core/codemirror/js/addon/search/search.js"></script>
          <script src="{$path}/core/codemirror/js/addon/search/searchcursor.js"></script>
          <script src="{$path}/core/codemirror/js/addon/search/dialog.js"></script>
          <script src="{$path}/core/codemirror/js/addon/search/jump-to-line.js"></script>
          <script src="{$path}/core/codemirror/js/addon/display/fullscreen.js"></script>
          <script>var gPATH = "<xsl:value-of select='$path' />/app/RED";</script>
          <script src="{$path}/core/formgen/js/chance.js"></script>
          <script src="{$path}/core/formgen/js/jquery-ui.min.js"></script>
          <script src="{$path}/core/formgen/js/string.js" charset="utf-8"></script>
          <script src="{$path}/core/formgen/js/GEN.converter.2dot2.js"></script>
          <script src="{$path}/core/formgen/js/GEN.vars.js"></script>
          <script src="{$path}/core/formgen/js/GEN.getdata.js"></script>
          <script src="{$path}/core/formgen/js/GEN.Xsl.js"></script>
          <script src="{$path}/core/formgen/js/GEN.XML.js"></script>
          <script src="{$path}/core/formgen/js/GEN.config.js"></script>

          <!-- Validation -->
          <script src="{$path}/core/formgen/js/GEN.validation.js"></script>
          <!-- RULEs -->
          <script src="{$path}/core/formgen/js/GEN.rules.js"></script>
          <!-- COLOR PICKER -->
          <script src="{$path}/core/formgen/js/service/jquery.jsPlumb-1.5.5.js"></script>
          <script src="{$path}/core/formgen/js/service/xsdmapper.js"></script>
          <script src="{$path}/core/formgen/js/GEN.service.js"></script>
          <script src="{$path}/core/formgen/js/GEN.layout.js"></script>
          <script src="{$path}/core/formgen/js/GEN.templates.js"></script>
          <script src="{$path}/core/xml2json/jquery.xml2json.js"></script>
          <script src="{$path}/core/formgen/js/GEN.downloadXSL.js"></script>
         
          <script src="{$path}/core/formgen/js/GEN.containers.js" charset="utf-8"></script>
          <script src="{$path}/core/formgen/js/GEN.fields.js"></script>
          <script src="{$path}/core/formgen/js/GEN.html.js"></script>

          <script src="{$path}/core/formgen/js/GEN.server.js"></script>
			<script src="{$path}/core/formgen/js/GEN.controller.js"></script>
          <script src="{$path}/core/formgen/js/GEN.structures.js"></script>
		
          <script src="{$path}/core/formgen/js/GEN.xsl.templates.utils.js"></script>

          <script src="{$path}/core/formgen/js/GEN.subversion.js"></script>
          <script src="{$path}/core/formgen/js/vkbeautify.0.99.00.beta.js"></script>
          <script>

            this[VARS.name] = new GENERATOR({
            
              sourcePath : "<xsl:value-of select="$sourcePath"/>",

              dataSrc    : "<xsl:value-of select="rows/content/form/value/page_form"/>",

              imagesURL  : "<xsl:value-of select="rows/content/form/value/link_image"/>",

              configURL  : "<xsl:value-of select="rows/content/form/value/gen_elements"/>",

              server     : {

                java : {

                    basePath : '<xsl:value-of select="$path"/>/core/formgen/util/java',

                    codes : [
                        {
                            name : 'CONTROLLER',
                            xsl  : '/mvc/XSL_CONTROLLER.xsl'
                        },
                        {
                            name : 'MODEL',
                            xsl  : '/mvc/XSL_MODEL.xsl'
                        },

                        {
                            name : 'VIEW',
                            xsl  : '/mvc/XSL_VIEW.xsl'
                        }

                       

                    ]

                }

            }


            });

            var __GEN = this[VARS.name];

          </script>
          
          <!-- GEN Java Auto Complete -->
          <script src="{$path}/core/formgen/js/GEN.autocomplete.js"></script>

          <script src="{$path}/core/formgen/js/GEN.attributes.js"></script>

          <script src="{$path}/core/formgen/js/GEN.importTemplates.js"></script>

          <script src="{$path}/core/formgen/js/GEN.includeFiles.js"></script>
          
          <script src="{$path}/core/formgen/js/GEN.lookupMap.js"></script>
          
          <script src="{$path}/core/formgen/js/classes/Requests.js"></script>

          <xsl:for-each select="$gen/containers/item">
              <xsl:if test="not(@js) or @js!='false'">
                  <script src="{$path}/core/formgen/types/containers/{name}/js/{name}.js"></script>
              </xsl:if>
          </xsl:for-each>
          <xsl:for-each select="$gen/fields/item">
              <script src="{$path}/core/formgen/types/fields/{type}/{type}.js"></script>
          </xsl:for-each>

          <script id="custom-js"></script>
        
        </body>

      </html>

  	</xsl:template>

    

    <xsl:template name="getComponentIcon">
        <xsl:choose>
            <xsl:when test="icon/@type = 'fa'">
                <i class="fa fa-{icon}"></i>
            </xsl:when>
            <xsl:when test="icon/@type = 'gly'">
                <i class="glyphicon glyphicon-{icon}"></i>
            </xsl:when>
            <xsl:when test="icon/@type = 'img'">
                <img src="{$path}/core/formgen/img/components/{.}"/>
            </xsl:when>
            <xsl:otherwise>
                <i class="fa fa-angle-right"></i>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="GEN-head">
        
        <link href="{$path}/core/bootstrap/plugins/tabdrop/css/tabdrop.css" rel="stylesheet"/>
               
        <link rel="stylesheet" href="{$path}/core/bootstrap/plugins/treeview/css/bootstrap-treeview.css"/>
       
        <!--codeMirror-->
        <link href="{$path}/core/codemirror/css/codemirror.css" rel="stylesheet"/>
        <link href="{$path}/core/codemirror/js/addon/fold/foldgutter.css" rel="stylesheet"/>
         <link href="{$path}/core/codemirror/js/addon/display/fullscreen.css" rel="stylesheet"/>
                <link href="{$path}/core/codemirror/css/eclipse.css" rel="stylesheet"/>
                <link href="{$path}/core/codemirror/css/blackboard.css" rel="stylesheet"/>
                <link href="{$path}/core/codemirror/css/midnight.css" rel="stylesheet"/>
                <link href="{$path}/core/codemirror/css/colorforth.css" rel="stylesheet"/>
                <link href="{$path}/core/codemirror/css/icecoder.css" rel="stylesheet"/>
                <link href="{$path}/core/codemirror/css/monokai.css" rel="stylesheet"/>
                <link href="{$path}/core/codemirror/css/night.css" rel="stylesheet"/>        
   
        <link rel="stylesheet" href="{$path}/core/codemirror/css/show-hint.css" />
        <link rel="stylesheet" href="{$path}/core/codemirror/js/addon/search/dialog.css" />
        <link rel="stylesheet" href="{$path}/core/codemirror/js/addon/search/matchesonscrollbar.css" />
<!--         <link rel="stylesheet" href="{$path}/core/codemirror/js/addon/lint/lint.css" /> -->
        <!--GEN-->
        
        <!-- start:SEPARATORLIST CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/separatorlist/igrp.separatorlist.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
        <!-- end:SEPARATORLIST CSS INCLUDES -->
        
        <!-- start:SELECT CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css"/>
        <!-- end:SELECT CSS INCLUDES -->

        <link href="{$path}/core/formgen/css/style.css" rel="stylesheet"></link>
        <link href="{$path}/core/formgen/css/types.css" rel="stylesheet"></link>
        <link href="{$path}/core/formgen/css/layout.css" rel="stylesheet"></link>
        <link href="{$path}/core/formgen/css/service/style.css" rel="stylesheet"></link>
        <link href="{$path}/core/formgen/css/message.css" rel="stylesheet"></link>
        <link media="all and (max-width:1023px)" type="text/css" href="{$path}/core/formgen/css/tablet.css" rel="stylesheet"/>
        
        <link href="{$path}/core/formgen/css/modern.css" rel="stylesheet"></link>

        <!-- FORMLIST CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/formlist/igrp.formlist.css?v={$version}"/>
        <script type="text/javascript" src="{$path}/plugins/colorpicker/js/bootstrap-colorpicker.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/plugins/colorpicker/colorpicker.init.js?v={$version}"/>
       		
        <style id="custom-css"></style>

    </xsl:template>
    
    <xsl:include href="tmpl/igrp.fields.validation.xsl"/>
    
    <xsl:include href="tmpl/igrp.fields.rules.xsl"/>

    <xsl:include href="tmpl/page-properties-tab-content.xsl"/>
    
    <xsl:include href="tmpl/igrp.blocky.xsl"/>

</xsl:stylesheet>