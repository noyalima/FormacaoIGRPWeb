<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"><xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/><xsl:template match="/"><html><head><xsl:call-template name="IGRP-head"/><link rel="stylesheet" type="text/css" href="{$path}/plugins/tabs/igrp.tabs.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/plugins/formlist/igrp.formlist.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/datatable/dataTables.bootstrap.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css?v={$version}"/><style/></head><body class="{$bodyClass} sidebar-off"><xsl:call-template name="IGRP-topmenu"/><form method="POST" class="IGRP-form" name="formular_default" enctype="multipart/form-data"><div class="container-fluid"><div class="row"><xsl:call-template name="IGRP-sidebar"/><div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents"><div class="content"><div class="row row-msg"><div class="gen-column col-md-12"><div class="gen-inner"><xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/></div></div></div><div class="row " id="row-63e0dec4"><div class="gen-column col-sm-12"><div class="gen-inner"><div class="gen-tab-holder nav-tabs-custom    gen-container-item " tab-template="accordion" gen-class="" item-name="tabcontent_1"><ul class="nav nav-tabs"><xsl:if test="rows/content/tabcontent_1/fields/associar_pagina"><li item-name="associar_pagina" class=" gen-fields-holder" rel="tab-tabcontent_1-associar_pagina"><xsl:call-template name="get-active-tab"><xsl:with-param name="value" select="rows/content/tabcontent_1/fields/associar_pagina/value"/></xsl:call-template><a active-text-color="primary" data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-associar_pagina"><i class="fa fa-file-powerpoint-o"/><span><xsl:value-of select="rows/content/tabcontent_1/fields/associar_pagina/label"/></span></a></li></xsl:if><xsl:if test="rows/content/tabcontent_1/fields/associar_documentos"><li item-name="associar_documentos" class=" gen-fields-holder" rel="tab-tabcontent_1-associar_documentos"><xsl:call-template name="get-active-tab"><xsl:with-param name="value" select="rows/content/tabcontent_1/fields/associar_documentos/value"/></xsl:call-template><a active-text-color="primary" data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-associar_documentos"><i class="fa fa-file-word-o"/><span><xsl:value-of select="rows/content/tabcontent_1/fields/associar_documentos/label"/></span></a></li></xsl:if></ul><div class="tab-content"><xsl:if test="rows/content/tabcontent_1/fields/associar_pagina"><div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-associar_pagina" rel="tab-tabcontent_1-associar_pagina" item-name="associar_pagina"><xsl:call-template name="get-active-tab"><xsl:with-param name="value" select="rows/content/tabcontent_1/fields/associar_pagina/value"/><xsl:with-param name="class" select="'tab-pane'"/></xsl:call-template><div class="row " id="row-fa3e150e"><div class="gen-column col-sm-12"><div class="gen-inner"><xsl:if test="rows/content/form_1"><div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1"><xsl:call-template name="box-header"><xsl:with-param name="title" select="rows/content/form_1/@title"/><xsl:with-param name="collapsible" select="'true'"/><xsl:with-param name="collapsed" select="'true'"/></xsl:call-template><div class="box-body"><div role="form"><xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/><xsl:if test="rows/content/form_1/fields/env_fk"><div class="col-sm-12 form-group  gen-fields-holder" item-name="env_fk" item-type="select"><label for="{rows/content/form_1/fields/env_fk/@name}"><xsl:value-of select="rows/content/form_1/fields/env_fk/label"/></label><select class="form-control select2 " id="form_1_env_fk" name="{rows/content/form_1/fields/env_fk/@name}"><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/form_1/fields/env_fk"/></xsl:call-template><xsl:for-each select="rows/content/form_1/fields/env_fk/list/option"><option value="{value}" label="{text}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><span><xsl:value-of select="text"/></span></option></xsl:for-each></select></div></xsl:if><xsl:if test="rows/content/form_1/fields/page_descr"><div class="form-group col-sm-6   gen-fields-holder" item-name="page_descr" item-type="text"><label for="{rows/content/form_1/fields/page_descr/@name}"><span><xsl:value-of select="rows/content/form_1/fields/page_descr/label"/></span></label><input type="text" value="{rows/content/form_1/fields/page_descr/value}" class="form-control " id="{rows/content/form_1/fields/page_descr/@name}" name="{rows/content/form_1/fields/page_descr/@name}" maxlength="100" placeholder=""><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/form_1/fields/page_descr"/></xsl:call-template></input></div></xsl:if><xsl:if test="rows/content/form_1/fields/page"><div class="form-group col-sm-6   gen-fields-holder" item-name="page" item-type="text"><label for="{rows/content/form_1/fields/page/@name}"><span><xsl:value-of select="rows/content/form_1/fields/page/label"/></span></label><input type="text" value="{rows/content/form_1/fields/page/value}" class="form-control " id="{rows/content/form_1/fields/page/@name}" name="{rows/content/form_1/fields/page/@name}" maxlength="100" placeholder=""><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/form_1/fields/page"/></xsl:call-template></input></div></xsl:if></div></div><xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/></div></xsl:if><xsl:if test="rows/content/table_1"><div class="box box-table-contents gen-container-item " gen-class="" item-name="table_1"><div class="box-body "><xsl:apply-templates mode="form-hidden-fields" select="rows/content/table_1/fields"/><div class="table-contents-head"><div class="table-contents-inner"></div></div><div class="table-box"><div class="table-box-inner"><table id="table_1" class="table table-striped igrp-data-table  " exports=""><thead><tr><xsl:if test="rows/content/table_1/fields/descricao"><th align="left" class=" gen-fields-holder"><span><xsl:value-of select="rows/content/table_1/fields/descricao/label"/></span></th></xsl:if><xsl:if test="rows/content/table_1/fields/nome_pagina"><th align="left" class=" gen-fields-holder"><span><xsl:value-of select="rows/content/table_1/fields/nome_pagina/label"/></span></th></xsl:if></tr></thead><tbody><xsl:for-each select="rows/content/table_1/table/value/row[not(@total='yes')]"><tr><xsl:apply-templates mode="context-param" select="context-menu"/><input type="hidden" name="p_id_fk" value="{id}"/><input type="hidden" name="p_id_fk_desc" value="{id_desc}"/><xsl:if test="descricao"><td align="left" data-order="{descricao}" data-row="{position()}" data-title="{../../../fields/descricao/label}" class="text" item-name="descricao"><span class="lookup-parser"><xsl:value-of select="descricao"/></span></td></xsl:if><xsl:if test="nome_pagina"><td align="left" data-order="{nome_pagina}" data-row="{position()}" data-title="{../../../fields/nome_pagina/label}" class="text" item-name="nome_pagina"><span class="lookup-parser"><xsl:value-of select="nome_pagina"/></span></td></xsl:if></tr></xsl:for-each></tbody></table></div></div></div></div></xsl:if></div></div></div></div></xsl:if><xsl:if test="rows/content/tabcontent_1/fields/associar_documentos"><div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-associar_documentos" rel="tab-tabcontent_1-associar_documentos" item-name="associar_documentos"><xsl:call-template name="get-active-tab"><xsl:with-param name="value" select="rows/content/tabcontent_1/fields/associar_documentos/value"/><xsl:with-param name="class" select="'tab-pane'"/></xsl:call-template><div class="row " id="row-1d27065e"><div class="gen-column col-sm-12"><div class="gen-inner"><xsl:if test="rows/content/toolsbar_1"><div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder&gt;a.btn" gen-class="" item-name="toolsbar_1"><div class="btns-holder   pull-right" role="group"><xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons"><xsl:with-param name="vertical" select="'true'"/><xsl:with-param name="outline" select="'false'"/></xsl:apply-templates></div></div></xsl:if><xsl:if test="rows/content/formlist_1"><div class="box box-table-contents gen-container-item " gen-class="" item-name="formlist_1"><div class="box-body table-box"><xsl:apply-templates mode="form-hidden-fields" select="rows/content/formlist_1/fields"/><table id="formlist_1" class="table table-striped gen-data-table  IGRP_formlist noupdate nodelete" rel="T_formlist_1" data-control="data-formlist_1"><thead><tr><xsl:if test="rows/content/formlist_1/fields/checkbox"><th class="bs-checkbox gen-fields-holder" align="center"><span></span><input type="checkbox" class="IGRP_checkall" check-rel="checkbox" data-title=" " data-toggle="tooltip"/></th></xsl:if><xsl:if test="rows/content/formlist_1/fields/obrigatorio"><th class="bs-checkbox gen-fields-holder" align="center"><span>Obrigatório?</span><input type="checkbox" class="IGRP_checkall" check-rel="obrigatorio" data-title="Obrigatório?" data-toggle="tooltip"/></th></xsl:if><xsl:if test="rows/content/formlist_1/fields/tipo"><th align="" class=" gen-fields-holder"><span><xsl:value-of select="rows/content/formlist_1/fields/tipo/label"/></span></th></xsl:if><xsl:if test="rows/content/formlist_1/fields/nome"><th align="" class=" gen-fields-holder"><span><xsl:value-of select="rows/content/formlist_1/fields/nome/label"/></span></th></xsl:if><xsl:if test="rows/content/formlist_1/fields/descricao_documento"><th align="" class=" gen-fields-holder"><span><xsl:value-of select="rows/content/formlist_1/fields/descricao_documento/label"/></span></th></xsl:if><xsl:if test="not(rows/content/formlist_1/table/value/row[position() = 1]/@noupdate) or not(rows/content/formlist_1/table/value/row[position() = 1]/@nodelete)"><th class="table-btn add"><xsl:if test="not(rows/content/formlist_1/table/value/row[position() = 1]/@noupdate)"><a class="formlist-row-add btn btn-primary" rel="formlist_1" title="Add" data-toggle="tooltip" data-placement="left"><i class="fa fa-plus"/></a></xsl:if></th></xsl:if></tr></thead><tbody><xsl:for-each select="rows/content/formlist_1/table/value/row"><tr row="{position()}"><input type="hidden" name="p_formlist_1_id" value="{formlist_1_id}"/><input type="hidden" name="p_type_doc_fk" value="{type_doc}"/><input type="hidden" name="p_type_doc_fk_desc" value="{type_doc_desc}"/><xsl:if test="checkbox"><xsl:if test="not(checkbox/@visible)"><td align="" data-row="{position()}" data-title="{../../../fields/checkbox/label}" item-name="checkbox"><div class="form-group" item-name="checkbox" item-type="checkbox"><input type="hidden" name="p_checkbox_fk_desc" value="{checkbox_desc}"/><xsl:if test="checkbox_check != checkbox or not(checkbox_check)"><input type="hidden" class="checkbox" name="p_checkbox_fk" value=""/></xsl:if><xsl:if test="checkbox != '-0'"><input type="checkbox" name="p_checkbox_fk" value="{checkbox}" class="checkbox" rel="F_formlist_1" check-rel="checkbox"><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/formlist_1/fields/checkbox"/></xsl:call-template><xsl:if test="checkbox_check= checkbox"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input></xsl:if></div></td></xsl:if></xsl:if><xsl:if test="obrigatorio"><xsl:if test="not(obrigatorio/@visible)"><td align="" data-row="{position()}" data-title="{../../../fields/obrigatorio/label}" item-name="obrigatorio"><div class="form-group" item-name="obrigatorio" item-type="checkbox"><input type="hidden" name="p_obrigatorio_fk_desc" value="{obrigatorio_desc}"/><xsl:if test="obrigatorio_check != obrigatorio or not(obrigatorio_check)"><input type="hidden" class="obrigatorio" name="p_obrigatorio_fk" value=""/></xsl:if><xsl:if test="obrigatorio != '-0'"><input type="checkbox" name="p_obrigatorio_fk" value="{obrigatorio}" class="checkbox" rel="F_formlist_1" check-rel="obrigatorio"><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/formlist_1/fields/obrigatorio"/></xsl:call-template><xsl:if test="obrigatorio_check= obrigatorio"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input></xsl:if></div></td></xsl:if></xsl:if><xsl:if test="tipo"><xsl:if test="not(tipo/@visible)"><td align="" data-row="{position()}" data-title="{../../../fields/tipo/label}" class="select" item-name="tipo"><input type="hidden" name="{../../../fields/tipo/@name}_fk_desc" value="{tipo_desc}"/><div class="form-group" item-name="tipo" item-type="select"><xsl:variable name="tipo_val" select="tipo"/><select class="form-control select2 " id="formlist_1_tipo" input-rel="{../../../fields/tipo/@name}_fk" rel="F_formlist_1"><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/formlist_1/fields/tipo"/></xsl:call-template><xsl:for-each select="//rows/content/formlist_1/fields/tipo/list/option"><option value="{value}"><xsl:call-template name="select-multiple-value"><xsl:with-param name="value" select="value"/><xsl:with-param name="selected" select="$tipo_val"/><xsl:with-param name="delimiter" select="';'"/></xsl:call-template><span><xsl:value-of select="text"/></span></option></xsl:for-each></select><input name="{../../../fields/tipo/@name}_fk" type="hidden" value="{$tipo_val}"/></div></td></xsl:if></xsl:if><xsl:if test="nome"><xsl:if test="not(nome/@visible)"><td align="" data-row="{position()}" data-title="{../../fields/nome/label}" class="text" item-name="nome"><input type="hidden" name="{../../../fields/nome/@name}_fk_desc" value="{nome_desc}"/><div class="form-group" item-name="nome" item-type="text"><input type="text" name="{../../../fields/nome/@name}_fk" value="{nome}" class="text form-control" rel="F_formlist_1" disabled="disabled"><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/formlist_1/fields/nome"/></xsl:call-template></input></div></td></xsl:if></xsl:if><xsl:if test="descricao_documento"><xsl:if test="not(descricao_documento/@visible)"><td align="" data-row="{position()}" data-title="{../../fields/descricao_documento/label}" class="text" item-name="descricao_documento"><input type="hidden" name="{../../../fields/descricao_documento/@name}_fk_desc" value="{descricao_documento_desc}"/><div class="form-group" item-name="descricao_documento" item-type="text"><input type="text" name="{../../../fields/descricao_documento/@name}_fk" value="{descricao_documento}" class="text form-control" rel="F_formlist_1" disabled="disabled"><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/formlist_1/fields/descricao_documento"/></xsl:call-template></input></div></td></xsl:if></xsl:if><xsl:if test="not(@nodelete) or not(@noupdate)"><td class="table-btn delete" data-row="{position()}"><xsl:if test="not(@nodelete)"><span class="formlist-row-remove btn btn-danger" rel="formlist_1" title="Remove" data-toggle="tooltip" data-placement="bottom"><i class="fa fa-times"/></span></xsl:if></td></xsl:if></tr></xsl:for-each></tbody></table></div></div></xsl:if><xsl:if test="rows/content/form_2"><div class="box igrp-forms gen-container-item " gen-class="" item-name="form_2"><div class="box-body"><div role="form"><xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_2/fields"/></div></div><xsl:apply-templates select="rows/content/form_2/tools-bar" mode="form-buttons"/></div></xsl:if></div></div></div></div></xsl:if></div></div></div></div></div></div></div></div></div><xsl:call-template name="IGRP-bottom"/></form><script type="text/javascript" src="{$path}/plugins/tabs/igrp.tabs.js?v={$version}"/><script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js?v={$version}"/><script type="text/javascript" src="{$path}/core/igrp/table/igrp.table.js?v={$version}"/><script type="text/javascript" src="{$path}/plugins/formlist/igrp.formlist.js?v={$version}"/><script type="text/javascript" src="{$path}/core/igrp/table/datatable/jquery.dataTables.min.js?v={$version}"/><script type="text/javascript" src="{$path}/core/igrp/table/datatable/dataTables.bootstrap.min.js?v={$version}"/><script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js?v={$version}"/><script type="text/javascript" src="{$path}/plugins/select2/select2.init.js?v={$version}"/><script type="text/javascript" src="{$path}/core/jquery/ui/jquery-ui.min.js"/><script type="text/javascript" src="{$path}/app/igrp/lookuplistpage/app.js"/></body></html></xsl:template><xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=12"/><xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=12"/><xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=12"/><xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=12"/><xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=12"/><xsl:include href="../../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=12"/></xsl:stylesheet>
