(function(){
	
	var ListMutationSettings = {
			
			mutationToDom: function() {
				  var container = document.createElement('mutation');
				  container.setAttribute('count', this.itemCount_);
				  return container;
				},
				
			domToMutation: function(xmlElement) {
				this.itemCount_ = parseInt(xmlElement.getAttribute('count'), 10);
				  this.updateShape_();  
				},
					
			 decompose: function (workspace) {
			        var containerBlock = workspace.newBlock('where_t');
			        containerBlock.initSvg();
			        var connection = containerBlock.getInput('SCRIPT').connection;	        
			        for (var i = 0; i < this.itemCount_; i++) { 
				            var itemBlock = workspace.newBlock('where');
				            itemBlock.initSvg();
				            connection.connect(itemBlock.previousConnection);
				            connection = itemBlock.nextConnection;
			        }
			        return containerBlock;
			    },
			    
			 compose: function (containerBlock) {
				 
			        var itemBlock = containerBlock.getInputTargetBlock('SCRIPT');
			        var connections = [];
			        while (itemBlock) {
			            connections.push(itemBlock.valueConnection_);
			            itemBlock = itemBlock.nextConnection && itemBlock.nextConnection.targetBlock();
			        }
			      for (var i = 1; i < this.itemCount_; i++) {
			            var connection = this.getInput('ADD' + i).connection.targetConnection;
			            if (connection && connections.indexOf(connection) == -1) {
			                connection.disconnect();
			            }
			        }
			        this.itemCount_ = connections.length;
			         Contador = this.itemCount_;
			         
			        this.updateShape_();
			        for (var i = 0; i < this.itemCount_; i++) {
			            Blockly.Mutator.reconnect(connections[i], this, 'ADD' + i);
			        }
			    },
			    
			 updateShape_: function () {
				    
			        for (var i = 1; i <= this.itemCount_; i++) {
			            if (!this.getInput('ADD' + i)) {
		    	        	 var input =
		    	        	this.appendValueInput('ADD' + i).appendField(new Blockly.FieldDropdown(FILTER),'ADD'+i+'FILTER');
		    	        	 
		    	        	this.appendValueInput('ADD'+i+'STATE2').appendField(new Blockly.FieldDropdown(WHERE),'ADD'+i+'WHERE');
		    	 			
			            }
			        }
			        while (this.getInput('ADD' + i)) {
			            this.removeInput('ADD' + i);
			            this.removeInput('ADD'+i+'FILTER');
			            this.removeInput('ADD'+i+'WHERE');
			            this.removeInput('ADD'+i+'STATE2');
			            
			            i++;
			        }   
			    }	
	}
	
	window.IGRP_BLOCKLY_ELEMENTS = {
			
		listar : $.extend({
			
			init : function(block){
				
				block.itemCount_ = 0;
				block.updateShape_();
	
//				this.onTableSet = function(item){		
//					var XML = $.parseXML(VARS.getGen().getXML());	
//					var menus = function(){
//						var arr = [];
//						$('rows content '+item, XML).find('fields > *').each(function(i, field){	
//							var type =  GetJavaType[$(field).attr('type')] || 'String';
//							arr.push( [ field.tagName, type+'::'+ field.tagName ] )
//						})
//						return arr
//					}();
//				}	
			}
			
		}, ListMutationSettings),
		
	combo_dao : {
			
			init : function(block){
				
				block.itemCount_ = 0;
				block.updateShape_();
			},
			
		mutationToDom: function() {
			  var container = document.createElement('mutation');
			  container.setAttribute('count', this.itemCount_);
			  return container;
			},
			
		domToMutation: function(xmlElement) {
			this.itemCount_ = parseInt(xmlElement.getAttribute('count'), 10);
			  this.updateShape_();  
			},
				
		 decompose: function (workspace) {
		        var containerBlock = workspace.newBlock('where_t');
		        containerBlock.initSvg();
		        var connection = containerBlock.getInput('SCRIPT').connection;	        
		        for (var i = 0; i < this.itemCount_; i++) { 
			            var itemBlock = workspace.newBlock('where');
			            itemBlock.initSvg();
			            connection.connect(itemBlock.previousConnection);
			            connection = itemBlock.nextConnection;
		        }
		        return containerBlock;
		    },
		    
		 compose: function (containerBlock) {
			 
		        var itemBlock = containerBlock.getInputTargetBlock('SCRIPT');
		        var connections = [];
		        while (itemBlock) {
		            connections.push(itemBlock.valueConnection_);
		            itemBlock = itemBlock.nextConnection && itemBlock.nextConnection.targetBlock();
		        }
		      for (var i = 1; i < this.itemCount_; i++) {
		            var connection = this.getInput('ADD' + i).connection.targetConnection;
		            if (connection && connections.indexOf(connection) == -1) {
		                connection.disconnect();
		            }
		        }
		        this.itemCount_ = connections.length;
		         Contador = this.itemCount_;
		         
		        this.updateShape_();
		        for (var i = 0; i < this.itemCount_; i++) {
		            Blockly.Mutator.reconnect(connections[i], this, 'ADD' + i);
		        }
		    },
		    
		 updateShape_: function () {
			    
		        for (var i = 1; i <= this.itemCount_; i++) {
		            if (!this.getInput('ADD' + i)) {
	    	        	 var input =
	    	        	this.appendValueInput('ADD' + i).appendField(new Blockly.FieldDropdown(FILTER),'ADD'+i+'FILTER');
	    	        	 
	    	        	this.appendValueInput('ADD'+i+'STATE2').appendField(new Blockly.FieldDropdown(WHERE),'ADD'+i+'WHERE');
	    	 			
		            }
		        }
		        while (this.getInput('ADD' + i)) {
		            this.removeInput('ADD' + i);
		            this.removeInput('ADD'+i+'FILTER');
		            this.removeInput('ADD'+i+'WHERE');
		            this.removeInput('ADD'+i+'STATE2');
		            
		            i++;
		        }   
		    }
		
		},
		
		
		listar : $.extend({
			
			init : function(block){
				
				block.itemCount_ = 0;
				block.updateShape_();
				
//				this.onTableSet = function(item){		
//					var XML = $.parseXML(VARS.getGen().getXML());	
//					var menus = function(){
//						var arr = [];
//						$('rows content '+item, XML).find('fields > *').each(function(i, field){	
//							var type =  GetJavaType[$(field).attr('type')] || 'String';
//							arr.push( [ field.tagName, type+'::'+ field.tagName ] )
//						})
//						return arr
//					}();
//				}	
			}
			
		}, ListMutationSettings),
		
			    		    
	  separator :$.extend({
			
		init : function(block){
			
			block.itemCount_ = 0;
			block.updateShape_();
			
		}
			
	  }, ListMutationSettings),
	  
	
	  formlist :$.extend({
			
			init : function(block){
				
				block.itemCount_ = 0;
				block.updateShape_();
				
			}
				
		  }, ListMutationSettings),
		  
	
	inserir_dao : {
		
		init : function(block){
			
			block.itemCount_ = 0;
			block.updateShape_();
			
		},
		
		mutationToDom: function() {
			  var container = document.createElement('mutation');
			  container.setAttribute('count', this.itemCount_);
			  return container;
			},
			
		domToMutation: function(xmlElement) {
			this.itemCount_ = parseInt(xmlElement.getAttribute('count'), 10);
			  this.updateShape_();  
			},
			
		 decompose: function (workspace) {
		        var containerBlock = workspace.newBlock('insert_t');
		        containerBlock.initSvg();
		        var connection = containerBlock.getInput('SCRIPT').connection;	        
		        for (var i = 0; i < this.itemCount_; i++) { 
			            var itemBlock = workspace.newBlock('separatori');
			            itemBlock.initSvg();
			            connection.connect(itemBlock.previousConnection);
			            connection = itemBlock.nextConnection;
		        }
		        return containerBlock;
		    },
		    
		    compose: function (containerBlock) {
		        var itemBlock = containerBlock.getInputTargetBlock('SCRIPT');
		        var connections = [];
		        while (itemBlock) {
		            connections.push(itemBlock.valueConnection_);
		            itemBlock = itemBlock.nextConnection && itemBlock.nextConnection.targetBlock();
		        }
		      for (var i = 1; i < this.itemCount_; i++) {
		            var connection = this.getInput('SEPARATOR'+i).connection.targetConnection;
		            if (connection && connections.indexOf(connection) == -1) {
		                connection.disconnect();
		            }
		        }
		        this.itemCount_ = connections.length;
		         Contador = this.itemCount_;
		         
		        this.updateShape_();
		        for (var i = 0; i < this.itemCount_; i++) {
		            Blockly.Mutator.reconnect(connections[i], this, 'SEPARATOR'+i);
		        }
		    },
		    
		    updateShape_: function () {
			    
		        for (var i = 1; i <= this.itemCount_; i++) {
		            if (!this.getInput('SEPARATOR'+i)) {
	    	        	 var input =
	    	        	this.appendDummyInput('SEPARATORIL'+i).appendField("save separator");
	    	        	this.appendStatementInput('SEPARATOR'+i);

		            }
		        }
		        while (this.getInput('SEPARATOR'+i)) {
		            this.removeInput('SEPARATOR'+i);
		            this.removeInput('SEPARATORIL'+i); 
		            i++;
		        }   
		    }
		
		},
		
	grafico : {
			
			init : function(block){
				
				 var checkbox = new Blockly.FieldCheckbox("FALSE", function(pxchecked) {
					 
				      			this.sourceBlock_.updateShape_(pxchecked);     			
				 });
				
				block.appendDummyInput().appendField("3D").appendField(checkbox, '3D');	
			
				block.mutationToDom =  function() {
					    var container = document.createElement('mutation');
					    var pxchecked = (this.getFieldValue('3D') == 'TRUE');
					    container.setAttribute('pxchecked', pxchecked);
					    return container;
				},
				
				block.domToMutation = function(xmlElement) {
				    var pxchecked = (xmlElement.getAttribute('pxchecked') == 'true');
				    this.updateShape_(pxchecked);
				 },
				 
				 block.updateShape_ = function(pxchecked) {
				    if (pxchecked) {
				      block.appendValueInput("eixoZ").appendField("Eixo Z");
				    } else {
				      if (this.childBlocks_.length > 0) {
				        for (var i = 0; i < block.childBlocks_.length; i++) {
				          if (block.childBlocks_[i].type == 'px') {
				           block.childBlocks_[i].unplug();
				            break;
				          }
				        }
				      }
				      this.removeInput('eixoZ');
				    }
				 }
			}
		},
		
	
	}
	
	//Handle Dao Blocks
	
	$(document).on('get-dao-block-init', function(e, block, dao){
		

		var options = IGRP_BLOCKLY_DROPS.daos[dao];
		
		var dropdown = new Blockly.FieldDropdown(options, function(option) {
			
	      this.sourceBlock_.updateShape_(option);
	      
	    });
		
		block.setColour(160);
	    block.appendDummyInput().appendField("get "+dao)
		    .appendField(dropdown, 'DAO_FIELD')
		    .appendField(new Blockly.FieldImage(path+"/core/blockly/blockly/media/dao.svg",15,15,"*"));
	    block.setInputsInline(true);
	    block.setOutput(true);
	   
		
		block.mutationToDom =  function() {
		    var container = document.createElement('mutation');
		    var itemInput = this.getFieldValue('DAO_FIELD');
		    container.setAttribute('hover_type', itemInput);
		    return container;
		},

		block.domToMutation = function(xmlElement) {
		    var itemInput = xmlElement.getAttribute('hover_type');
		    this.updateShape_(itemInput);
		},
		
		block.updateShape_ = function(input_type) {
				 
		 	var strSplit = input_type.split('::'),
	
				type     = strSplit[0],
				
				val 	 = strSplit[1];
			 
		    var inputExists = this.getInput('value1');
		    
		    
		    if (type && type != '--' && type != 'String' && type != 'Date' && type != 'Integer') {
		    	
		      if (!inputExists) {
		    	  
		        this.appendValueInput('value1').setCheck();
		      }
		   
		    }else
		    	
		      this.removeInput('value1');
		  }
		
	});
	
	
})();