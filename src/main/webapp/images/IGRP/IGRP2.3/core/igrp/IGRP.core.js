(function($){
	if($ && $.IGRP){

		$.IGRP.utils = {
				
			unique : function(){

				function s4() {
				
				    return Math.floor((1 + Math.random()) * 0x10000).toString(16).substring(1);

				};

				return s4() + '_' + s4();

			},

			url : {

				isUrl : function(url){
					var pattern = new RegExp('^(https?:\\/\\/)?'+ // protocol
					  	'((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.?)+[a-z]{2,}|'+ // domain name
					  	'((\\d{1,3}\\.){3}\\d{1,3}))'+ // OR ip (v4) address
					  	'(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*'+ // port and path
					  	'(\\?[;&a-z\\d%_.~+=-]*)?'+ // query string
					  	'(\\#[-a-z\\d_]*)?$','i'); // fragment locator

					return pattern.test(url);
				},

				getParams : function (url) {
					
				 	var queryString = url ? url.split('?')[1] : window.location.search.slice(1);
				  		obj 				= {};
				  		
				  if (queryString) {

				    queryString = queryString.split('#')[0];

				    var arr = queryString.split('&');

				    for (var i=0; i<arr.length; i++) {
				      var a = arr[i].split('=');

				      var paramNum  = undefined;
				      var paramName = a[0].replace(/\[\d*\]/, function(v) {
				        paramNum 	= v.slice(1,-1);
				        return '';
				      });

				      var paramValue = typeof(a[1]) === undefined ? '' : a[1];

				      paramName 	= paramName   ? paramName.toLowerCase()  : '';
				      paramValue 	= paramValue  ? paramValue.toLowerCase() : '';

				      if (obj[paramName]) {
				        if (typeof obj[paramName] === 'string') {
				          obj[paramName] = [obj[paramName]];
				        }
				        if (typeof paramNum === undefined) {
				          obj[paramName].push(paramValue);
				        }
				        else {
				          obj[paramName][paramNum] = paramValue;
				        }
				      }
				      else {
				        obj[paramName] = paramValue;
				      }
				    }
				  }

				  return obj;
				},

				getParam : function(name,url){
					
					var all = $.IGRP.utils.url.getParams(url);

					return all[name.toLowerCase()] || null;

				}

			},
			openWin:function(p){

				var width  = p.width ? p.width : 980;
			    var height = p.height ? p.height : 520;

			    var left = parseInt((screen.availWidth/2)  - (width/2));
			    var top  = parseInt((screen.availHeight/2) - (height/2));
			    
			    var windowFeatures = "scrollbars, width=" + width + ",height=" + height +
			        ",status,resizable,left=" + left + ",top=" + top +
			        ",screenX=" + left + ",screenY=" + top;

			  	var myWindow =  window.open(p.url, p.win, windowFeatures);

				return myWindow;
			},
			openChartURL : function(pObj){
				if (pObj.pUrl != null && pObj.pUrl != '') {
					
					var vParam = 'p_x='+pObj.pX+'&p_y='+pObj.pY+'&p_z='+pObj.pZ;

					$.IGRP.utils.openWin({
						url    :$.IGRP.utils.getUrl(pObj.pUrl)+vParam,
						width  :980,
						height :520,
						win    :"IGRP_win"+(new Date()).getTime()
					});

					return false;
				}
			},
			getForm:function(){
				return $('form.IGRP-form');
			},
			getFieldsValidate:function(f){
				var form = f && f[0] ? f : $.IGRP.utils.getForm();
				var fields = $(':input',form).not('.no-validation, .no-required-validation, .no-validation-required, .not-form').not('.IGRP_checkall');
				
				return fields;
			},
			getUrl:function(url){
				url = url && url != undefined ? url : 'XXX';
				return (url.indexOf("?")==-1)?url+="?":url+="&";
			},
			getPageUrl : function(){
				return $("input[name='p_env_frm_url']").val() || window.location.href;
			},
			getFormUrl:function(url){
				var param = $.IGRP.utils.getForm().find('*').not(".notForm, #p_env_frm_url").serialize();
				return $.IGRP.utils.getUrl(url)+param;
			},
			getParam:function(pLink, pName){
				var vNewLink = pLink.substring(pLink.indexOf("?")+1);
				var vOp = vNewLink.split("&");
				for(var i= 0; i < vOp.length; i++){
					var vNop = vOp[i].split("=");
					if(vNop[0].toLowerCase()==pName.toLowerCase()){
						return vNop[1];
					}
				}
				return null;
			},
			resetFieldsSelector : function(o){
				o.each(function(i,e){
					
                    var parents = $(e).parents('.form-group'),
                    
                    	type 	= $(e).parents('[item-type]').first().attr('item-type');
                    
                    switch(type){
                    
                        case'radio':
                        case 'checkbox':

                            $(e).removeAttr("checked").prop("checked",false);

                        break;

                        case 'select' :
                        	
                        	if( $(e).is('.select2')){

                        		if(!$(e).data('select2'))

                        			$.IGRP.components['select2'].init( parents );

                        		$(e).select2("val", "");
                        	}		
                        	
                        break;

                        case 'textarea' :

                        	$(e).text('');

                        break;

                        default:

                            $(e).val('');
                            $(e).text('').attr('value','');
                    }
                });

                return o;
			},
			resetFields  : function(o){
				
				$.IGRP.utils.resetFieldsSelector($(":input",o));
			},
			setFieldValue:function(p){

				var lookup = null,
					label  = null,
					tag    = p.tag,
					value  = p.value;

				if (typeof $(tag) === 'object'){
					
					lookup  = $(tag).attr('lookup') ? $(tag).attr('lookup') : null;

					label   = $(tag).attr('label') ? $(tag).attr('label') : null;

					value   = $(tag).text();

					tag 	= tag.tagName.toLowerCase();
					
				}

				var formElement = p.row ? $('[name="p_'+tag+'_fk"]',p.row) : $('[name="p_'+tag+'"]'),

					parent  	= $(formElement.parents('[item-name]')[0]);
				
				if( parent[0] ){

					var type = parent.attr('item-type');

					if (label)
						$('label',parent).html(label);
					
					switch(type){

						case 'select':

							if(formElement.is('[multiple]'))

								value = value.split('|');

							formElement.val(value);

						break;

						case 'checkboxlist':

							var vArr = value.split('|');

							vArr.forEach(function(v){

								formElement.filter('[value="'+v+'"]').prop('checked',true);

							});

						break;

						case 'radiolist':

							formElement.filter('[value="'+value+'"]').prop('checked',true);

						break;

						case 'checkbox':
						case 'radio':
							
							var checked = value == 1;

							formElement.prop('checked', checked)

						break;
							
						case 'textarea':
						case 'plaintext':
							
							formElement.text(value).val(value);
							
						break;

						default:
							if (lookup)
								$('.IGRP_lookupPopup',parent).attr('href',lookup);

							formElement.val(value);
					}

					formElement.trigger('change');

				}
			},
			clearSubmittables:function(){
				$('.submittable').removeClass('submittable');
			},
			getSubmitParams:function(url,form,scrollTo){
				var vUrl    = url, 
					vForm   = $.IGRP.utils.getForm(),
					vHref   = "", 
					vNewUrl = "";
				
				if(form && form != null)
					vForm = form;

				vHref 	= vUrl.substring(0,vUrl.indexOf("#"))?vUrl.substring(0,vUrl.indexOf("#")):vUrl;
				vNewUrl = vHref.substring(0,vHref.indexOf("?"))?vHref.substring(0,vHref.indexOf("?")):vHref;

				if(vHref.indexOf("?")>-1)
				{
					var vParam = vHref.substring(vHref.indexOf("?")+1);

					var vP = vParam.split("&");

					for(var i=0;i<vP.length;i++)
					{
						var vP1 = vP[i].split("=");

						if(vP1[0].toLowerCase()!= "p_env_frm_url" && vP1[0].toLowerCase()!= 'r'){
							if(!$("input[name='"+vP1[0]+"']",vForm)[0]){
								$.IGRP.utils.createHidden({
									name:vP1[0],
									value:vP1[1],
									class:'submittable igrpurlparam'
								});
							}
						}
					}
				}
				else
					vUrl = vHref;

				//Comentado em 23-01-2012 problemas em RELOAD
				vUrl = vHref;
				if(scrollTo){
					var vIchange = scrollTo.replace("#id","");
					vUrl = $.IGRP.utils.getUrl(vUrl);
					vUrl+="ichange="+vIchange+scrollTo;
					if(!vForm.find("input[name='ichange']")[0])
						$.IGRP.utils.createHidden({name:'ichange',value:vIchange});
					else
	  					$('input[name="ichange"]',form).val(vIchange);
				}
			
				return vUrl;
			},
			
			adjustableRows : function(){
				
				var rows = $('.row.adjustable-row, .row.adjust-cols');
				
				rows.each(function(i, row){
					
					var cols = $('>.gen-column', row);
					
					cols.each(function(x, col){
						
						var contents = $('>.gen-inner>*', col);
						
						if(!contents[0])
							
							$(col).hide();
						
						else
							
							$(col).addClass('readjust');
						
					});
					
					var rowsToAdjust = $('.readjust', row),
					
						totalToAdjust = rowsToAdjust.length,
						
						division      = 12/totalToAdjust;
					
					if(Number.isInteger( division ) && division <= 12){
						
						rowsToAdjust.alterClass('col-sm-*');
						
						rowsToAdjust.addClass('col-sm-'+division);
						
					}
				
					
				});
				
				
			},
			
			refreshComponents : function(options){
				
				options = options || {};
				
				if(options.wrapper){
					
					/* select2 */
					
					if(options.wrapper.find('.form-control.select2'))
						
						$.IGRP.components.select2.init( options.wrapper );
					
					/*table ( data table, formlist )*/
					
					var table = options.wrapper.find('table').first();
					
					if(table.hasClass('igrp-data-table'))
						
						$.IGRP.components.tableCtrl.dataTable({
							parent : options.wrapper
						})
						
					if(table.hasClass('IGRP_formlist'))
						
						table.IGRP_formlist();

					if($.IGRP.components.contextMenu)
						
						$.IGRP.components.contextMenu.set( $('.gen-container-item[item-name="'+options.itemName+'"]') );
					
				}
				
			},
			
			sanitize:function(pOp){
				var vTexto = pOp;
				try{
					vTexto = vTexto.replace('\'','&#92;');
					return(vTexto);
				}catch(e){return vTexto;}
			},
			createHidden:function(p){
				var form = $.IGRP.utils.getForm();
				var clss = p.class || '';
				var id   = p.id || '';

				if(p.name){
					if ($('input[name="'+p.name+'"]')[0]) 
						$('input[name="'+p.name+'"]').addClass(clss).val(p.value);
					else if(id)
						form.prepend('<input id="'+id+'" type="hidden" class="'+clss+'" name="'+p.name+'" value="'+p.value+'"/>');
					else form.prepend('<input type="hidden" class="'+clss+'" name="'+p.name+'" value="'+p.value+'"/>');
				}
			},
			htmlEncode:function(str){
				return str?$('<div />').text(str).html():"";
			},
			htmlDecode:function(str){
				return str?$('<div />').html(str).text():"";
			},
			isNotNaN : function(v){
				return isNaN(v)? 0:v*1;
			},
			arrRemoveItem : function(arr,v){
                return $.grep(arr, function(val) {
				  return val != v;
				});
			},
			file2base64 : function(p){
				$.IGRP.utils.loading.show(p.target);
				var fileB64 = new FileReader();
				fileB64.readAsDataURL(p.field[0].files[0]);
				fileB64.onload = function () {
					$('[src]',p.target).attr('src',fileB64.result);
					$.IGRP.utils.loading.hide(p.target);
				};
				fileB64.onerror = function (error) {
					$.IGRP.utils.loading.hide(p.target);
				    console.log('Error: ', error);
				};
			},
			base64toBlob : function(p) {
		        var sliceSize 		= p.sliceSize || 512,
		        	base64 			= p.base64Data.split(';'),
		        	byteCharacters 	= atob(base64[1].split(",")[1]),
		        	contentType 	= base64[0].split(":")[1] || p.contentType
		        	byteArrays 		= [];

		        for (var offset = 0; offset < byteCharacters.length; offset += sliceSize) {
		            var slice = byteCharacters.slice(offset, offset + sliceSize);

		            var byteNumbers = new Array(slice.length);
		            for (var i = 0; i < slice.length; i++) {
		                byteNumbers[i] = slice.charCodeAt(i);
		            }

		            var byteArray = new Uint8Array(byteNumbers);

		            byteArrays.push(byteArray);
		        }

		      	return new Blob(byteArrays, {type: contentType});
			},
			verticalCentralize:function(s){
				var selector = s || '[vertical-centralize="true"]';

				$(selector).each(function(i,el){
					
					console.log(el);

				})
			},
			arrayValuesToString : function(arr,spliter){
				var str = "";
				if(arr){
					arr.forEach(function(a,i){
						str+=a;
						if(i != arr.length-1)
							str+=spliter;
					});
				}
				return str;
			},
			ffoxDisableOutputEscaping: function(){

				var doe = $('.disable-output-escaping');

				if($.browser &&  $.browser.mozilla)

					doe.each(function(i,d){
						
						$(d).html( $(d).text() );

					});

				doe.addClass('set');

			},
			message : {
				getIcon : {
					'danger' : 'exclamation-circle',
					'warning': 'exclamation-triangle',
					'success': 'check-circle',
					'info' 	 : 'info-circle'
				},
				alert : function(p){
					var type = p.type.toLowerCase() || 'info',
						icon = $.IGRP.utils.message.getIcon[type];

					return '<div class="alert alert-'+type+'" role="alert">'+
						'<i class="fa fa-'+icon+' igrp-msg-icon"></i>'+
						'<a class="close" data-dismiss="alert" aria-label="Close">'+
						'<span aria-hidden="true"><i class="fa fa-times"></i></span>'+
						'</a>'+$.IGRP.utils.htmlDecode(p.text)+'</div>';
				},
				handleXML : function(xml){

					try{

						var alert = '',

							debug = '';

						$.each($(xml).find('messages message'),function(i,row){

							var type = $(row).attr('type');

							if (type != 'debug' && type != 'confirm') {

								type = type == 'error' ? 'danger' : type;

								alert += $.IGRP.utils.message.alert({
									type : type,
									text : $(row).text()
								});

							}else if(type == 'debug'){
								debug += '<li value="'+$(row).text()+'">'+
									$.IGRP.utils.htmlDecode($(row).text())+
								'</li>';
							}
						});
						
						
						if(alert != '')
							$('.igrp-msg-wrapper').html(alert);
						
						if(debug != '')
							$('#igrp-debugger .igrp-debug-list').html(debug);

					}catch(err){
						
						console.log(err)
					}

				},
				notify : function(xml, data){
					
					$.each($(xml).find('messages message'),function(it,row){
						
						var type = $(row).attr('type');
						
						if (type != 'debug' && type != 'confirm') {
							
							var text = $(row).text();
							
							type = type == 'error' ? 'danger' : type;
							
							$.IGRP.notify({
								message : text,
								type	: type
							});
							
							if(data){
								
								data.item.trigger('igrp-notify', [ {
									
									type : type,
									
									text : text
									
								} ]);
							}
						}
					});
				}

			},
			loading : {
				show : function(o){
					
					var obj = o ? o : $('body');

					$.IGRP.utils.loading.hide(obj);

					obj.addClass('loading').append('<div class="loader"/>');
				},
				hide : function(o){

					var obj = o ? o : $('body');

					if($('.loader',obj)[0]) {

						obj.removeClass('loading');

						$('.loader',obj).remove();
					}

				}
			},
			string:{
				
				getIndices : function(searchStr, str, caseSensitive) {
				    var startIndex = 0, searchStrLen = searchStr.length;
				    var index, indices = [];
				   
				    if(str){
				    	if (!caseSensitive) {
					        str = str.toLowerCase();
					        searchStr = searchStr.toLowerCase();
					    }
					    while ((index = str.indexOf(searchStr, startIndex)) > -1) {
					        indices.push(index);
					        startIndex = index + searchStrLen;
					    }
				    }
				    
				    return indices;
				},
				replaceSpecialChars : function(label){
					var chars = ['[',']','€','«','»',';','='];
					var accents = [
						{ base:'a', accents:['\u00c4' ,'\u00c3','\u00e1','\u00e0','\u00e2','\u00e3','\u00e4','\u00c1','\u00c0','\u00c2'] },
						{ base:'e', accents:['\u00e9','\u00e8','\u00ea','\u00ea','\u00c9','\u00c8','\u00ca','\u00cb'] },
						{ base:'i', accents:['\u00ed','\u00ec','\u00ee','\u00ef','\u00cd','\u00cc','\u00ce','\u00cf'] },
						{ base:'o', accents:['\u00d6','\u00d5','\u00f3','\u00f2','\u00f4','\u00f5','\u00f6','\u00d3','\u00d2','\u00d4'] },
						{ base:'u', accents:['\u00fa','\u00f9','\u00fb','\u00fc','\u00da','\u00d9','\u00db'] },
						{ base:'c', accents:['\u00e7','\u00c7'] },
						{ base:'n', accents:['\u00f1','\u00d1'] }
					];

					//replace white spaces to _
					var str = label.replaceAll(' ','_');
					//replace - to _
					str = str.replaceAll('-','_');
					//replace special characters
					str = str.replace(/[&\/\\#,+()$~%.'":*?<>!?@´ªº^|£§{}]/g,'');
					//replace symbols
					chars.forEach(function(c){
						str = str.replaceAll(c,'');
					});
					//replace accents
					accents.forEach(function(aObj){
						aObj.accents.forEach(function(a){
							str = str.replaceAll(a,aObj.base);
						});
					});

					return str.toLowerCase();
				}
			}
		}
		/*FILE SUBMIT*/
		/*Get Form Data as Object*/
		$.IGRP.utils.getFormData = function(p){
			var vFormData = new FormData(), 
				vBlod     = null,
				vType     = p.pContentType ? p.pContentType : 'plain/text',
				vFormat   = p.pFormat ? p.pFormat : 'txt';

			p.pArrayFiles.forEach(function(pfile){
				var vName     = pfile.name,
					vFileName = (vName.substring(0,2) == 'p_')?vName.substring(2):vName;

				vFileName 	= pfile.filename ? pfile.filename : vFileName;
				vType 		= pfile.type ? pfile.type : vType,
				vFormat 	= pfile.format ? pfile.format : vFormat;
				vBlod 		= new Blob([pfile.value], {type:vType});
				vFileName 	= pfile.value ? vFileName+"."+vFormat : '';
				vFormData.append(vName, vBlod, vFileName);			
			});

			if (p.pArrayItem) {
				p.pArrayItem.forEach(function(pItem){
					vFormData.append(pItem.name,pItem.value);
				});
			}
			return vFormData;
		};
		/*Submit String as File*/
		$.IGRP.utils.submitStringAsFile = function(p){
			/*
				pParam:{
					pContentType: string ex -> 'plain/text, text/json ...' // tipe de ficheiro,
					pFormat		: string ex -> 'txt, json, xml ...' // formato de ficheiro,
					pArrayFiles : array  ex -> [{name:xxx,value:zzz}] // itens a ser submetido como ficheiro
					pArrayItem 	: array  ex -> [{name:xxx,value:zzz}] // outros itens e ser submetido mas não como ficheiro
				},
				pUrl : url ex ->  https://www.xxxx.com // url de POST,
				pComplete : function operação finalizada devolve resposta,
				pNotify  : boolean ex -> true/false // caso pretende ou nao despoletar notificação por defeito a notificação é despoletada
			*/
			var vRequest 	= new XMLHttpRequest(), 
				vData    	= $.IGRP.utils.getFormData(p.pParam),
				typeNotify 	= 'danger',
				form 		= $.IGRP.utils.getForm(),
				showNotify 	= p.pNotify === false ? false : true,
				response    = null,
				message 	= '';

			form.attr('accept-charset','UTF-8');
			

			//console.log(document.charset);

		    vRequest.open("POST",p.pUrl,true);
		    vRequest.timeout = 600000; // time in milliseconds

		    vRequest.setRequestHeader('Encoding','UTF-8');
			vRequest.setRequestHeader('Charset','UTF-8');
			//vRequest.setRequestHeader("Content-Type", "multipart/form-data;charset=ISO-8859-1");
			vRequest.setRequestHeader("X-Requested-With", "XMLHttpRequest");

			if(vRequest.overrideMimeType)
		    	vRequest.overrideMimeType('text/xml; charset=UTF-8');

		    vRequest.ontimeout = function (e) {
				$.IGRP.utils.loading.hide();
				$.IGRP.notify({
					message : 'Time out',
					type	: typeNotify
				});
			};

			vRequest.onprogress = function (){
				$.IGRP.utils.loading.show();
			};

		    vRequest.onreadystatechange = function(){
		    	//console.log(vRequest.getAllResponseHeaders());
		    	if(vRequest.readyState == 4){ // operação finalizada
		    		typeNotify = vRequest.status == 200 ? 'success' : 'danger';
		    		
		    		$.IGRP.utils.loading.hide();
		    		
		    		if (showNotify){
		    			if(vRequest.status == 200){
			    			try{
			    				response 	= $($.parseXML(vRequest.response)).find('messages message');
			    				typeNotify 	= response.attr('type') && response.attr('type') != undefined ? response.attr('type').toLowerCase() : typeNotify,
			    				message 	= response.text();
			    			}catch(e){
			    				response 	= $.parseJSON(vRequest.response);
			    				typeNotify 	= response.type && response.type != undefined ? response.type.toLowerCase() : typeNotify,
			    				message 	= response.messages;
			    			}
		    			}
		    			
		    			typeNotify = typeNotify === 'error' ? 'danger' : typeNotify;

		    			message = message && message != undefined ? message : 'Request info: Status '+vRequest.status+' '+vRequest.statusText; 

		    			$.IGRP.notify({
							message : $.IGRP.utils.htmlDecode(message),
							type	: typeNotify
						});
					}

		    		if(p.pComplete) 
			    		p.pComplete(vRequest);
		    	}
		    };

		    vRequest.send(vData);
		};
		$.IGRP.utils.submitPage2File = {
			getFiles : function(){
				var array = [];
				$('input[type="file"]').each(function(){
					var files  	= $(this)[0].files,
						obj 	= {};

					obj.name 	 = $(this).attr('name');
					obj.type 	 = 'application/octet-stream';
					obj.format 	 = '';
					obj.filename = $(this).attr('name')

					if(files.length > 0){
						var name 	  = files[0].name.split('.');

						obj.value 	  = files[0];
						obj.type  	  = files[0].type;
						obj.format    = name[1];
						obj.filename  = name[0];
					}else
						obj.value = '';
					
					array.push(obj);
				});
				return array;
			},
			json2xml : function(obj){
				var toXml = function(v, name, ind) {
				    var xml = "";
				    if (typeof(v) == "object") {
				    	var hasChild = false;
				      	for (var m in v) {
				        	if (m.charAt(0) == "@") {
				          		xml += " " + m.substr(1) + "=\"" + v[m].toString() + "\"";
				        	} else {
				          		hasChild = true;
				        	}
				     	}
				      	if (hasChild) {
				        	for (var m in v) {
				          		if (m=="name") {
				            		xml += "<" + v[m] + ">" + $.IGRP.utils.htmlEncode(v['value']) + "</" + v[m] + ">";
				          		}
				        	}
				      	}
				    }
			    	return xml;
			  	}, xml="";
				for (var m in obj) {
			    	xml += toXml(obj[m], m, "");
			  	}
			  	return '<row>'+xml+'</row>';
			},
			creatFiles2Submit : function(p){
				var obj  = [],
					xml  = p.serialize.find('*').not(p.notSerialize).not('[name="p_env_frm_url"]').serializeArray();

				xml = '<?xml version="1.0" encoding="UTF-8"?><content>'+
					$.IGRP.utils.submitPage2File.json2xml(xml)+'</content>';

				obj.push({name:p.fileName,value:xml});

				//add files 
				var files = $.IGRP.utils.submitPage2File.getFiles();
				if (files) {
					files.forEach(function(e,i){
						obj.push(e);
					});
				}

				return obj;
			},
			getUrlParam : function(url){
				var array = [];
				try{
					if(url.indexOf("?")>-1){
						var param = url.substring(url.indexOf("?")+1);
						var p = param.split("&");
						for(var i = 0; i < p.length; i++){
							var p1 = p[i].split("=");
							if(p1[0].toLowerCase() != "p_env_frm_url"){
								if(!$("input[name='"+p1[0]+"']")[0])
									array.push({name:p1[0],value:p1[1]});
							}
						}
					}
				}catch(e){null;}

				return array;
			},
			onSubmit : function(p){
				var files = $.IGRP.utils.submitPage2File.creatFiles2Submit({
						serialize 	 : p.serialize,
						notSerialize : p.notSerialize,
						fileName 	 : p.fileName || 'p_igrpfile'
					}),
					getParam = {
						pContentType : p.contentType || 'plain/xml',
						pFormat      : p.format || 'xml',
						pArrayFiles  : files,
						pArrayItem 	 : $.IGRP.utils.submitPage2File.getUrlParam(p.url)
					};

				$.IGRP.utils.submitStringAsFile({
					pParam 		: getParam,
					pUrl   		: p.url,
					pComplete 	: p.complete,
					pNotify   	: p.notify
				});
			}
		};
		$.IGRP.utils.xsl = {

			getStyleSheet : function(nodes,includes){
				var xsl = $.parseXML('<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">'+
	  									'<xsl:output method="html" encoding="utf-8"/>'+
	  									'<xsl:template match="/"></xsl:template>'+
	  								 '</xsl:stylesheet>');
				var template;

				var stylesheet = $(xsl).find('>:first-child');

				$.each( $('>*',stylesheet),function(i,n){

					if(n.nodeName == 'xsl:template')
						template = $(n);
				});
	
				template.append(nodes);

				stylesheet.append(includes);

				return xsl;
			},

			getIncludeNodes : function(xsl){
				var arr = [];
				var d = $(xsl.documentElement);
				$.each(d.find('>*'),function(){
					if(this.nodeName == 'xsl:include')
						arr.push(this);
				});

				return arr;
				//$.each(  )
			},

			getNode : function(xsl,name,attrs){
				var arr = [];
				var d   = $(xsl.documentElement);

				$.each( d.find('html body *'),function(){
					if(this.nodeName == name){
						var node = this;
						if(attrs){
							for(var a in attrs){
								if(node.getAttribute(a) == attrs[a])
									arr.push(node);
							}
						}
					}
				});

				return arr;
			},
			
			transform : function(p){
				
				$.ajax({

					url : p.xsl,

					success:function(pageXSL){
						
						var nodesArr    = [];

						var includesArr = $.IGRP.utils.xsl.getIncludeNodes(pageXSL);

						//get template includes
						$.each(includesArr,function(x,i){

							var href = $(i).attr('href');

							$(i).attr('href',href.split('../../xsl/tmpl/').pop(''));

						});
						
						console.log(p)

						//get nodes xsl
						if(p.nodes){
							
							var id = 0;
							
							p.nodes.forEach(function(n,i){
								
								var nodeElement = $.IGRP.utils.xsl.getNode(pageXSL,'xsl:if',{

									test : 'rows/content/'+n

								})[0];
								
								var xslt = $.IGRP.utils.xsl.getStyleSheet(nodeElement,includesArr);

								var itemHTML = $('.gen-container-item[item-name="'+n+'"]');
								
								var oldStyle = itemHTML.attr('style') || '';

								itemHTML.XMLTransform({
									xml     	 : p.xml,
									xsl     	 : xslt,
									loading      : true,
									xslBasePath  : path+'/xsl/tmpl',
									method 	     : 'replace',
									complete     : function(e,c){
										
										var content = $('.gen-container-item[item-name="'+n+'"]'),
										
											currentStyle = content.attr('style') || '',
											
											style 		 = oldStyle+currentStyle;
											
										content.attr('style', style);
										
										id += 1;
										
										$.IGRP.events.execute('element-transform',{
											content  : content,
											itemName : n,
											xml 	 : p.xml,
											xsl      : xslt,
											index    : id
										});

										if(p.success){
											p.success({
												itemName : n,
												xsl 	 : xslt,
												xml 	 : p.xml,
												itemHTML : content
											});
										}
										
										if(id == p.nodes.length){
											if(p.clicked)
												p.clicked.removeAttr("disabled");
											
											$.IGRP.utils.message.handleXML(p.xml);
										}
											
									},
									error: function(e){
										
										$.IGRP.notify({
											message : 'Error Transforming Component',
											type    : 'warning'
										});
									}
								});
								
							});
						}
					}
				});
			}
		};

		$.IGRP.utils.getXMLStylesheet = function(d){
			
			var xstr;

		    xstr = typeof d == 'string' ? d : new XMLSerializer().serializeToString(d);

		    if(xstr){
		    	var beginExp = '<?xml-stylesheet href="';

				var endExp   = '" type="text/xsl"?>';
				
				var begin = $.IGRP.utils.string.getIndices(beginExp, xstr,false)[0] + beginExp.length;

				var end  = $.IGRP.utils.string.getIndices(endExp, xstr,false)[0];

				var exprss = xstr.substring(begin,end);
		    }

			return exprss;
		};

		$.IGRP.utils.transformXMLNodes = function(params){
			
			var options = $.extend(true, {
				nodes :[],
				url   :null,
				headers: {},
				data  : null
			}, params);
			
			

			$.ajax({

				url  : options.url,

				data : options.data,

				method:'POST',
				
				headers : options.headers,

				success:function(xml,e,r){
					
					var xslURL = $.IGRP.utils.getXMLStylesheet(r.responseText);
		
					$.IGRP.utils.xsl.transform({
						xsl    : xslURL,
						xml    : xml,
						nodes  : options.nodes,
						success: options.success
					});
					
				}
			});

			//console.log(options)			
		};

		var containsFunc = function(a, i, m) {
        	return jQuery(a).text().toUpperCase().indexOf(m[3].toUpperCase()) >= 0;
        };

        jQuery.expr[':'].Contains = containsFunc;

        jQuery.expr[':'].contains = containsFunc;

        var init = function(){
        	
        	$.IGRP.utils.ffoxDisableOutputEscaping();

        	$.IGRP.utils.verticalCentralize();
        	
        	$.IGRP.utils.adjustableRows();
        
        };
        
        $.IGRP.on('init',function(){
        	init();
        });

	}else{
		console.log('jQuery or IGRP.js missing!')
	}

}($));




