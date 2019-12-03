<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"><xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/><xsl:template match="/"><html><head><xsl:call-template name="IGRP-head"/><link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/plugins/formlist/igrp.formlist.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/plugins/datepicker2/daterangepicker.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/plugins/datepicker2/IGRP.daterangepicker.css?v={$version}"/><style/></head><body class="{$bodyClass} sidebar-off"><xsl:call-template name="IGRP-topmenu"/><form method="POST" class="IGRP-form" name="formular_default" enctype="multipart/form-data"><div class="container-fluid"><div class="row"><xsl:call-template name="IGRP-sidebar"/><div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents"><div class="content"><div class="row row-msg"><div class="gen-column col-md-12"><div class="gen-inner"><xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/></div></div></div><div class="row " id="row-2708fbe0"><div class="gen-column col-md-12"><div class="gen-inner"><xsl:if test="rows/content/sectionheader_1"><section class="content-header gen-container-item " gen-class="" item-name="sectionheader_1"><h2 class="disable-output-escaping"><xsl:value-of disable-output-escaping="yes" select="rows/content/sectionheader_1/fields/sectionheader_1_text/value"/></h2></section></xsl:if><xsl:if test="rows/content/toolsbar_1"><div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder&gt;a.btn" gen-class="" item-name="toolsbar_1"><div class="btns-holder   pull-right" role="group"><xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons"><xsl:with-param name="vertical" select="'true'"/><xsl:with-param name="outline" select="'false'"/></xsl:apply-templates></div></div></xsl:if><xsl:if test="rows/content/form_1"><div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1"><div class="box-body"><div role="form"><xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/><xsl:if test="rows/content/form_1/fields/loja"><div class="col-sm-3 form-group  gen-fields-holder" item-name="loja" item-type="select" required="required"><label for="{rows/content/form_1/fields/loja/@name}"><xsl:value-of select="rows/content/form_1/fields/loja/label"/></label><select class="form-control select2 " id="form_1_loja" name="{rows/content/form_1/fields/loja/@name}" required="required"><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/form_1/fields/loja"/></xsl:call-template><xsl:for-each select="rows/content/form_1/fields/loja/list/option"><option value="{value}" label="{text}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><span><xsl:value-of select="text"/></span></option></xsl:for-each></select></div></xsl:if><xsl:if test="rows/content/form_1/fields/data_compra"><div class="form-group col-sm-3  gen-date-picker-wrapper gen-fields-holder" item-name="data_compra" item-type="date" required="required"><label for="{rows/content/form_1/fields/data_compra/@name}"><span><xsl:value-of select="rows/content/form_1/fields/data_compra/label"/></span></label><div class="input-group"><input type="text" value="{rows/content/form_1/fields/data_compra/value}" data-range="false" class="form-control gen-date-picker " id="data_compra" name="{rows/content/form_1/fields/data_compra/@name}" required="required" format="" maxlength="250" placeholder=""><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/form_1/fields/data_compra"/></xsl:call-template></input><span class="datepicker-clear fa fa-times"/><span class="input-group-btn gen-date-icon"><a class="btn btn-primary"><i class="fa fa-calendar"/></a></span></div></div></xsl:if></div></div><xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/></div></xsl:if><xsl:if test="rows/content/produtos"><div class="box box-table-contents gen-container-item " gen-class="" item-name="produtos"><div class="box-body table-box"><xsl:apply-templates mode="form-hidden-fields" select="rows/content/produtos/fields"/><table id="produtos" class="table table-striped gen-data-table  IGRP_formlist    " rel="T_produtos" data-control="data-produtos"><thead><tr><xsl:if test="rows/content/produtos/fields/produto"><th td-name="produto" align="" show-label="" class="select  gen-fields-holder" group-in=""><span><xsl:value-of select="rows/content/produtos/fields/produto/label"/></span></th></xsl:if><xsl:if test="rows/content/produtos/fields/preco"><th td-name="preco" align="" show-label="" class="number  gen-fields-holder" group-in=""><span><xsl:value-of select="rows/content/produtos/fields/preco/label"/></span></th></xsl:if><xsl:if test="rows/content/produtos/fields/quantidade"><th td-name="quantidade" align="" show-label="" class="number  gen-fields-holder" group-in=""><span><xsl:value-of select="rows/content/produtos/fields/quantidade/label"/></span></th></xsl:if><xsl:if test="rows/content/produtos/fields/total"><th td-name="total" align="" show-label="" class="plaintext  gen-fields-holder" group-in=""><span><xsl:value-of select="rows/content/produtos/fields/total/label"/></span></th></xsl:if><xsl:if test="not(rows/content/produtos/table/value/row[position() = 1]/@noupdate) or not(rows/content/produtos/table/value/row[position() = 1]/@nodelete)"><th class="table-btn add"><xsl:if test="not(rows/content/produtos/table/value/row[position() = 1]/@noupdate)"><a class="formlist-row-add btn btn-primary" rel="produtos" title="Add" data-toggle="tooltip" data-placement="left"><i class="fa fa-plus"/></a></xsl:if></th></xsl:if></tr></thead><tbody><xsl:for-each select="rows/content/produtos/table/value/row"><tr row="{position()}"><input type="hidden" name="p_produtos_id" value="{produtos_id}"/><xsl:apply-templates mode="form-hidden-fields" select="."/><xsl:if test="produto"><xsl:if test="not(produto/@visible)"><td align="" data-row="{position()}" data-title="{../../../fields/produto/label}" class="select" item-name="produto" item-type="select"><input type="hidden" name="{../../../fields/produto/@name}_fk_desc" value="{produto_desc}"/><div class="form-group" item-name="produto" item-type="select"><xsl:variable name="produto_val" select="produto"/><select class="form-control select2 " id="produtos_produto" input-rel="{../../../fields/produto/@name}_fk" required="required" rel="F_produtos"><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="//rows/content/produtos/fields/produto"/></xsl:call-template><xsl:for-each select="//rows/content/produtos/fields/produto/list/option"><option value="{value}"><xsl:call-template name="select-multiple-value"><xsl:with-param name="value" select="value"/><xsl:with-param name="selected" select="$produto_val"/><xsl:with-param name="delimiter" select="';'"/></xsl:call-template><span><xsl:value-of select="text"/></span></option></xsl:for-each></select><input name="{../../../fields/produto/@name}_fk" type="hidden" value="{$produto_val}"><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="//rows/content/produtos/fields/produto"/></xsl:call-template></input></div></td></xsl:if></xsl:if><xsl:if test="preco"><xsl:if test="not(preco/@visible)"><td align="" data-row="{position()}" data-title="{../../../fields/preco/label}" class="number " item-name="preco"><input type="hidden" name="{../../../fields/preco/@name}_fk_desc" value="{preco_desc}"/><div class="form-group" item-name="preco" item-type="number"><input type="number" name="{../../../fields/preco/@name}_fk" min="" max="" value="{preco}" class="number form-control" rel="F_produtos" required="required" placeholder=""><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="//rows/content/produtos/fields/preco"/></xsl:call-template></input></div></td></xsl:if></xsl:if><xsl:if test="quantidade"><xsl:if test="not(quantidade/@visible)"><td align="" data-row="{position()}" data-title="{../../../fields/quantidade/label}" class="number " item-name="quantidade"><input type="hidden" name="{../../../fields/quantidade/@name}_fk_desc" value="{quantidade_desc}"/><div class="form-group" item-name="quantidade" item-type="number"><input type="number" name="{../../../fields/quantidade/@name}_fk" min="" max="" value="{quantidade}" class="number form-control" rel="F_produtos" required="required" placeholder=""><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="//rows/content/produtos/fields/quantidade"/></xsl:call-template></input></div></td></xsl:if></xsl:if><xsl:if test="total"><xsl:if test="not(total/@visible)"><td align="" data-row="{position()}" data-title="{../../../fields/total/label}" class="plaintext" item-name="total" item-type="plaintext"><input type="hidden" name="{../../../fields/total/@name}_fk_desc" value="{total_desc}"/><input type="hidden" name="{../../../fields/total/@name}_fk" value="{total}" class="plaintext form-control" rel="F_produtos"/><p name="p_total_fk" item-type="plaintext"><xsl:value-of select="total"/></p></td></xsl:if></xsl:if><xsl:if test="not(@nodelete) or not(@noupdate)"><td class="table-btn delete" data-row="{position()}"><xsl:if test="not(@nodelete)"><span class="formlist-row-remove btn btn-danger" rel="produtos" title="Remove" data-toggle="tooltip" data-placement="bottom"><i class="fa fa-times"/></span></xsl:if></td></xsl:if></tr></xsl:for-each></tbody></table></div></div></xsl:if></div></div></div></div></div></div></div><xsl:call-template name="IGRP-bottom"/></form><script type="text/javascript" src="{$path}/core/igrp/table/igrp.table.js?v={$version}"/><script type="text/javascript" src="{$path}/plugins/formlist/igrp.formlist.js?v={$version}"/><script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js?v={$version}"/><script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js?v={$version}"/><script type="text/javascript" src="{$path}/plugins/select2/select2.init.js?v={$version}"/><script type="text/javascript" src="{$path}/core/moment/moment.min.js?v={$version}"/><script type="text/javascript" src="{$path}/plugins/datepicker2/daterangepicker.js?v={$version}"/><script type="text/javascript" src="{$path}/plugins/datepicker2/IGRP.daterangepicker.config.js?v={$version}"/><script type="text/javascript" src="{$path}/plugins/datepicker2/locale/dp.locale.pt.js?v={$version}"/><script src="{$path}/core/igrp/IGRP.rules.class.js"/><script>
$.IGRP.rules.set({"p_quantidade":[{"name":"calcula_total","events":"keyup","isTable":true,"conditions":{"rules":[{"condition":"greater","value":"0","value2":"","patern":"","patern_custom":"","opposite":""}],"actions":[{"action":"remote","targets":"total","procedure":"webapps?r=gestao_compra/Registar_compra/calculaTotal","request_fields":"preco,quantidade","msg_type":"","msg":""}]}}]},'actionsList');</script></body></html></xsl:template><xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=13"/><xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=13"/><xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=13"/><xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=13"/><xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=13"/><xsl:include href="../../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=13"/></xsl:stylesheet>