<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"><xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/><xsl:template match="/"><html><head><xsl:call-template name="IGRP-head"/><style/></head><body class="{$bodyClass} sidebar-off"><xsl:call-template name="IGRP-topmenu"/><form method="POST" class="IGRP-form" name="formular_default" enctype="multipart/form-data"><div class="container-fluid"><div class="row"><xsl:call-template name="IGRP-sidebar"/><div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents"><div class="content"><div class="row row-msg"><div class="gen-column col-md-12"><div class="gen-inner"><xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/></div></div></div><div class="row " id="row-5407a6b3"><div class="gen-column col-md-12"><div class="gen-inner"><xsl:if test="rows/content/contato"><div class="box igrp-forms gen-container-item " gen-class="" item-name="contato"><xsl:call-template name="box-header"><xsl:with-param name="title" select="rows/content/contato/@title"/><xsl:with-param name="collapsible" select="'false'"/><xsl:with-param name="collapsed" select="'false'"/></xsl:call-template><div class="box-body"><div role="form"><xsl:apply-templates mode="form-hidden-fields" select="rows/content/contato/fields"/><xsl:if test="rows/content/contato/fields/email"><div class="form-group col-sm-3   gen-fields-holder" item-name="email" item-type="text"><label for="{rows/content/contato/fields/email/@name}"><span><xsl:value-of select="rows/content/contato/fields/email/label"/></span></label><input type="text" value="{rows/content/contato/fields/email/value}" class="form-control  " id="{rows/content/contato/fields/email/@name}" name="{rows/content/contato/fields/email/@name}" maxlength="250" placeholder="{rows/content/contato/fields/email/@placeholder}"><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/contato/fields/email"/></xsl:call-template></input></div></xsl:if><xsl:if test="rows/content/contato/fields/telefone"><div class="form-group col-sm-3   gen-fields-holder" item-name="telefone" item-type="text"><label for="{rows/content/contato/fields/telefone/@name}"><span><xsl:value-of select="rows/content/contato/fields/telefone/label"/></span></label><input type="text" value="{rows/content/contato/fields/telefone/value}" class="form-control  " id="{rows/content/contato/fields/telefone/@name}" name="{rows/content/contato/fields/telefone/@name}" maxlength="250" placeholder="{rows/content/contato/fields/telefone/@placeholder}"><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/contato/fields/telefone"/></xsl:call-template></input></div></xsl:if><xsl:if test="rows/content/contato/fields/movel"><div class="form-group col-sm-3   gen-fields-holder" item-name="movel" item-type="text"><label for="{rows/content/contato/fields/movel/@name}"><span><xsl:value-of select="rows/content/contato/fields/movel/label"/></span></label><input type="text" value="{rows/content/contato/fields/movel/value}" class="form-control  " id="{rows/content/contato/fields/movel/@name}" name="{rows/content/contato/fields/movel/@name}" maxlength="250" placeholder="{rows/content/contato/fields/movel/@placeholder}"><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/contato/fields/movel"/></xsl:call-template></input></div></xsl:if><xsl:if test="rows/content/contato/fields/fax"><div class="form-group col-sm-3   gen-fields-holder" item-name="fax" item-type="text"><label for="{rows/content/contato/fields/fax/@name}"><span><xsl:value-of select="rows/content/contato/fields/fax/label"/></span></label><input type="text" value="{rows/content/contato/fields/fax/value}" class="form-control  " id="{rows/content/contato/fields/fax/@name}" name="{rows/content/contato/fields/fax/@name}" maxlength="250" placeholder="{rows/content/contato/fields/fax/@placeholder}"><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/contato/fields/fax"/></xsl:call-template></input></div></xsl:if></div></div><xsl:apply-templates select="rows/content/contato/tools-bar" mode="form-buttons"/></div></xsl:if></div></div></div></div></div></div></div><xsl:call-template name="IGRP-bottom"/></form><script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js?v={$version}"/></body></html></xsl:template><xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=26"/><xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=26"/><xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=26"/><xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=26"/><xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=26"/></xsl:stylesheet>
