<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%>
<%
	String baseUrl = "http://" + request.getServerName() + ":"
			+ request.getServerPort() + request.getContextPath() + "/";
	
	String adId = request.getParameter("adId");
	adId = adId == null || adId.length() == 0 ? "-1" : adId;
%>
<base href="<%=baseUrl%>" />
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>�ҵ���ҳ �ڱ��� ���һ�������ڱ�</title>
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!-- Le styles -->
	<link rel="shortcut icon" href="images/icon/favicon.ico" />
	<link href="assets/css/bootstrap.min.css"
		rel="stylesheet">
	<link type="text/css"
		href="css/custom-theme/jquery-ui.css" rel="stylesheet" />
	<link type="text/css"
		href="assets/css/font-awesome.min.css" rel="stylesheet" />
	
	
	<!-- �Զ���css.css -->
	<link type="text/css" href="css/css.css" rel="stylesheet" />
	<!--[if IE 7]>
	            <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css">
	            <![endif]-->
	<!--[if lt IE 9]>
	            <link rel="stylesheet" type="text/css" href="css/custom-theme/jquery.ui.1.10.0.ie.css"/>
	            <![endif]-->
	
	<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	            <![endif]-->
	<!-- Le fav and touch icons -->
	<!--[if lt IE 9]>
	     		<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js">
				</script> <![endif]-->
	<link rel="apple-touch-icon-precomposed" sizes="144x144"
		href="assets/ico/apple-touch-icon-144-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="114x114"
		href="assets/ico/apple-touch-icon-114-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="72x72"
		href="assets/ico/apple-touch-icon-72-precomposed.png">
	<link rel="apple-touch-icon-precomposed"
		href="assets/ico/apple-touch-icon-57-precomposed.png">
</head>

<body data-spy="scroll" data-target=".bs-docs-sidebar"
	data-twttr-rendered="true">
	<div
		style="margin-top:20px;margin-left:10%;margin-right:10%;border:1px solid #DCDCDC;position:relative;font-size:12px">
		<div
			style="position:absolute;top:5px; right:30px;border:1px solid #E0E0E0;cursor:pointer;padding:5px;"
			onclick="hrefAdList();">
			<img src="assets/img/preview.gif" title="�������б�" /><span
				style="margin-left:10px">�������б�</span>
		</div>
		<form class="form-horizontal">
			<fieldset style="width:100%;">
				<legend style="background:#DCDCDC">
					<span style="font-size:14px;color:#B9484A;padding-left:3%;"><strong
						style="font-size:20px;color:#000">����ع�ƻ�</strong> </span>
				</legend>
				<div class="control-group">
					<label class="control-label" for="focusedInput">����Ͷ�żƻ���</label>
					<div class="controls">
						<table>
							<tr>
								<td><input type="checkbox" id="oShowWayCheckBox" /><span
									style="margin-left:2px;margin-right:10px">����Ͷ�ųɱ�</span><input
									type="text" placeholder="������ɱ�" id="oLimitMoney" disabled><span
									style="margin-left:5px">Ԫ</span>
								</td>
							</tr>
						</table>
						<span class="help-inline">����Чʱ���ڣ��Ƿ���ҪͶ�ŵĳɱ����������Ҫ����Ĭ�ϵ���ʱЧʱ���������ʱ���Զ�ֹͣ���Ͷ�š�</span>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label">����Ͷ�ŵ��ۣ�</label>
					<div class="controls">
						<table>
							<tr style="margin-top:20px">
								<td><input type="number" placeholder="������Ͷ�ŵ���"
									name="oPrice" required
									data-validation-required-message="����дͶ�ŵ���"
									data-validation-number-message="����������" />
								</td>
							</tr>
						</table>
						<span class="help-inline">��Ͷ�ŵ���Ϊ�û����һ�����ʱ������õļ�Ǯ����</span>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="focusedInput">������Чʱ�䣺</label>
					<div class="controls">
						<table>
							<tr style="margin-top:20px">
								<td>�����Чʱ�䣺<input type="text" placeholder="��ѡ����Чʱ��"
									id="oEffTime" style="margin-right:10px" />���ʧЧʱ�䣺<input
									type="text" placeholder="������ʧЧʱ��" id="oExpTime" />
								</td>
							</tr>
						</table>
						<span class="help-inline">����Чʱ�䵽ʧЧʱ��Ϊ��Чʱ�䡣����д��Чʱ�䣬Ĭ��Ϊ���ͨ����������Ч������дʱЧʱ�䣬Ĭ��Ϊ����ʱ���Զ�ֹͣ���Ͷ�š�</span>
					</div>
				</div>


				<div class="control-group"
					style="border-top:1px solid #DCDCDC;padding-top:10px">
					<label class="control-label" for="focusedInput">ͬ�û�Ͷ��Ƶ�ʣ�</label>
					<div class="controls">
						<table>
							<tr>
								<td><input type="radio" checked name="oFrequentRadio" />
								</td>
								<td>����</td>
							</tr>
							<tr>
								<td><input type="radio" value="FREQUENT"
									name="oFrequentRadio" />
								</td>
								<td><input type="number" id="oFrequent" required
									placeholder="������ͬ�û��ع�Ƶ��" disabled
									data-validation-required-message="����дͬ�û��ع�Ƶ��"
									data-validation-number-message="����д����" value="0"/><span
									style="margin-left:5px">Сʱ</span>
								</td>
							</tr>
						</table>
						<span class="help-inline">���ع�Ƶ��Ϊͬһ���û�������󣬸��೤ʱ������ٴο�������</span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="focusedInput">ͬ�û�Ͷ�����ޣ�</label>
					<div class="controls">
						<table>
							<tr>
								<td><input type="radio" checked name="oLimitTimesRadio" />
								</td>
								<td>����</td>
							</tr>
							<tr>
								<td><input type="radio" value="LIMITTIME"
									name="oLimitTimesRadio" />
								</td>
								<td><input type="number" id="oLimitTimes" required
									placeholder="������ͬ�û��ع�����" disabled
									data-validation-required-message="����дͬ�û��ع�����"
									data-validation-number-message="����д����" value="0"/><span
									style="margin-left:5px" >��</span>
								</td>
							</tr>
						</table>
						<span class="help-inline">���ع����Ϊͬһ���û�����ܿ����ٴι�桿</span>
					</div>
				</div>
				<div class="control-group"
					style="border-top:1px solid #DCDCDC;padding-top:10px">
					<label class="control-label" for="focusedInput">���Ͷ�ŵ���</label>
					<div class="controls">
						<input type="text" id="oPlace" value="ȫ��" disabled /><a
							style="margin-left:5px;margin-right:5px;cursor:pointer"
							onclick="selectPlaces()">ѡ��</a><a
							style="margin-left:5px;cursor:pointer" onclick="resetplaces()">����</a>
					</div>
				</div>
				<!-- ֻ����Ƶ�����й������ -->
				<div id="oAdPeriodsDiv"></div>
				<!-- ����շ���Ŀ -->
				<div id="oInfoPriceDiv" class="groupBorderTop"></div>
			</fieldset>
			<div>
				<div class="form-actions" style="text-align:left;padding-left:40%;">
					<button style="margin-right:5%" id="oSave" onclick="setStatus(0)">����</button>
					<button style="margin-left:5%" id="oSubmit" onclick="setStatus(1)">�ύ</button>
				</div>
			</div>
		</form>
	</div>
	<div id="placeDialog" title="Ͷ�ŵ���ѡ��">
		<div id="oPlaceDiv"></div>
	</div>
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="assets/js/jquery-1.9.0.min.js" type="text/javascript"></script>
		<script src="assets/js/jqBootstrapValidation.js" type="text/javascript"></script>
		<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="assets/js/jquery-ui-1.10.0.custom.min.js" type="text/javascript"></script>
		<script src="js/json2.js" type="text/javascript"></script>
		<script src="assets/js/alertify/alertify.min.js" type="text/javascript"></script>
		<script src="assets/js/jquery.dynatree.js" type="text/javascript"></script>
		<script src="ckeditor/ckeditor.js"></script>
		<script src="js/adcake.js"></script>
	<script type="text/javascript">
		var baseurl = "<%=baseUrl%>";
		var adId = "<%=adId%>";
		adId = adId ? adId : -1;
		
		$(document).ready(
				function() {
					$("input,select,textarea").not("[type=submit]")
							.jqBootstrapValidation();
				
					$("input#oEffTime").datepicker({dateFormat:'yy-mm-dd',dayNames:['������','���ڶ�','������','������','������','������'],dayNamesMin:['��','һ','��','��','��','��','��'],monthNames:['һ��','����','����','����','����','����','����','����','����','ʮ��','ʮһ��','ʮ����']}).datepicker("setDate",'0');
					 $("input#oExpTime").datepicker({dateFormat:'yy-mm-dd',dayNames:['������','���ڶ�','������','������','������','������'],dayNamesMin:['��','һ','��','��','��','��','��'],monthNames:['һ��','����','����','����','����','����','����','����','����','ʮ��','ʮһ��','ʮ����']}).datepicker("setDate","0");
					 $('button').button();
					 
					 $("div#placeDialog").dialog({
	        			autoOpen:false,
	        			show:"blind",
	        			hide:"puff",
	        			resizable:false,
	        			height:310,
	        			width:600,
	        			buttons:{
	        				"ȷ��":function(event)
	        				{
	        					selectedPlaces();
	        				},
	        				"ȡ��":function()
	        				{
	        					$("div#placeDialog").dialog("close");
	        				}
	        			},
	        			modal:true
	        		});
	        		
	        		$("input#oShowWayCheckBox").change(function(event){
						$("#oLimitMoney").attr("disabled",!event.target.checked);
					});
					
					$(":input[name='oFrequentRadio']").change(function(event){
				 		var value = event.target.value;
				 		$("#oFrequent").attr("disabled", !(value == "FREQUENT"));
				 		if(!(value == "FREQUENT"))
				 			$("#oFrequent").val(0);
				 	});
					
					$(":input[name='oLimitTimesRadio']").change(function(event){
				 		var value = event.target.value;
				 		$("#oLimitTimes").attr("disabled", !(value == "LIMITTIME"));
				 		if(!(value == "LIMITTIME"))
				 			$("#oLimitTimes").val(0);
				 	});
					
					$("div#oInfoPriceDiv").hide();
					
					getInfoCodes("PRICE");
					getPlaces();
					getPeriod();
					getInfoCodes("CODE");
					setTimeout(invalid,3000);
					
				});
				
			var invalid = function() {//.not(":disabled")
				$("input,select,textarea").not("[type=submit]").not(":disabled")
					.jqBootstrapValidation({
						submitSuccess : function($form, event) {
							saveAD();
						}
					});
			};
				
				var getInfoCodes = function(groupname)
			 {
				 $.ajax({  
	        		    url:baseurl+"code/getGroup.do",  
	        		    type:"POST",  
	        		    data:groupname,  
	        		    dataType:"json", 
	        		    success:function(data){ 
	        		    	adcakehref(data,event,"","error");
	        		    	
	        		    	if(groupname == "PRICE")
	        		    	{
	        		    		$("div#oInfoPriceDiv").show();
		        		    	
		        		    	for(var i=0;i<data.items.length;i++)
		        		    	{
		        		    		addInfoCode(data.items[i]);
		        		    	}
	        		    	}
	        		    	else if (groupname == "CODE")
	        		    	{
	        		    		//���ӹ��select
	        		    		
	        		    		for(var i=0;i<data.items.length;i++)
		        		    	{
	        		    			var item = data.items[i];
	        		    			var codeName = item.codeName;
		        		    		var div = $("<div class='control-group'><label class='control-label' for='focusedInput'>"+item.desc+"��</label></div></div>");
		        		    		$("#oInfoCodeDiv").append(div);
					          		var adType = $("<div class='controls'></div>");
					          		var adTypeSel = $("<select></select>");
					          		adType.append(adTypeSel);
		        		    		div.append(adType);
		        		    		
	        		    			for(var j=0;j<item.items.length;j++)
	        		    			{
	        		    				adTypeSel.append("<option value="+item.items[j].codeValue+">"+item.items[j].desc+"</option>");
	        		    			}
	        		    			
	        		    			allCheck[codeName] = new Array();
	        		    			allCheck[codeName].push(adTypeSel.val());
	        		    			
	        		    			adTypeSel.change(function()
	        		    			{
	        		    				allCheck[codeName] = new Array();
		        		    			allCheck[codeName].push(adTypeSel.val());
	        		    			});
		        		    	}
	        		    	}
	        		    	
	        		    	
	        		    },  
	        		    error:function(){  
	        		    	alertify.alert('��ȡ�û�ѡ����Ϣʧ�ܣ�δ֪����');
	        		    }  
	        		});
			 };
			 
			 var placesData = new Object();
			 var getPlaces = function()
			 {
				 $.ajax({  
	        		    url:baseurl+"code/getCities.do",  
	        		    type:"POST",  
	        		    dataType:"json", 
	        		    success:function(data){ 
	        		    	adcakehref(data,event,"","error");
	        		    	placesData = data;
	        		    },  
	        		    error:function(){  
	        		    	alertify.alert('��ȡͶ�ŵ���ʧ�ܣ�δ֪����');
	        		    }  
	        		});
			 };
			 
			 var selPlaceData = new Array();  //��ŵ������
			 var selPlace = new Array();      //��ŵ�������
			 var selectPlaces = function()
			 {
				 selPlaceData = new Array();
				 selPlace = ["ȫ��"];
				 if(placesData.items)
				 {
					 var treeData = new Object();
					 treeData = {title:"ȫ��",select:true,children:replaceObjKey(placesData,treeData).children}; 
					 $("#oPlaceDiv").dynatree({
							checkbox: true,
							selectMode: 3,
							children: treeData,
							onSelect: function(select, node) {
								// Get a list of all selected nodes, and convert to a key array:
								var selKeys = $.map(node.tree.getSelectedNodes(), function(node){
									if(node.data.key.indexOf("_")<0)
										return node.data.key;
									else
										return null;
								});
								selPlaceData = selKeys ;
								
								var selTitle = $.map(node.tree.getSelectedNodes(), function(node){
									if(node.data.key.indexOf("_")<0)
										return node.data.title;
									else
										return null;
								});
								selPlace = selTitle ;
								
							},
							onDblClick: function(node, event) {
								node.toggleSelect();
							},
							onKeydown: function(node, event) {
								if( event.which == 32 ) {
									node.toggleSelect();
									return false;
								}
							}
						});
				 }
				 
				 
				 $("div#placeDialog").dialog("open");
			 };
			 
			 var replaceObjKey = function(obj,newObj)
			 {
				 for(var key in obj)
				 {
					 if(key == "items")
					 {
						 newObj["children"] = [];
						 for(var i=0;i<obj[key].length;i++)
						 {
							 var _newObj = new Object();
							 _newObj = replaceObjKey(obj[key][i],_newObj);
							 newObj["children"].push(_newObj);
						 }
					 }
					 else
					 {
						 newObj["select"] = true;   //Ĭ��ѡ��ȫ��
						 if(key == "itemName")
							 newObj["title"] = obj[key];
						 else if(key == "itemCode")
							 newObj["key"] = obj[key];
						 else
							 newObj[key] = obj[key];
					 }
					 
						 
				 }
				 return newObj;
			 };
			 
			 var selectedPlaces = function()
			 {
				 allCheck[0] = new Array();
				 if($.inArray("ȫ��", selPlace)>=0)
				 {
					 delete allCheck[0];
					 $("#oPlace").val("ȫ��");
				 }
				 else if(selPlaceData.length == 0)
				 {
					 alertify.alert("��������Ҫѡ��һ��Ͷ�ŵ���");
					 return;
				 }
				 else
				 {
					 $("#oPlace").val(selPlace.join());
				 }
				 $("div#placeDialog").dialog("close");
			 };
			 
			 var resetPlaces = function()
			 {
				 $("#oPlace").val("ȫ��");
				 if(allCheck[0])
					 delete allCheck[0];
			 };
			 
			 
			 var getPeriod = function()
			 {
				 $.ajax({  
	        		    url:baseurl+"code/getPeriods.do",  
	        		    type:"POST",  
	        		    dataType:"json", 
	        		    success:function(data){ 
	        		    	adcakehref(data,event,"","error");
	        		    	addPeriods(data);
	        		    },  
	        		    error:function(){  
	        		    	alertify.alert('��ȡͶ��ʱ��ʧ�ܣ�δ֪����');
	        		    }  
	        		});
			 };
			 var addPeriods = function(periodsData)
			 {
				 
				 if(periodsData.items == null)
				 {
					 return;
				 }
				 
				 var fieldset = $("<fieldset style='padding:0px'></fieldset>");
				 var div1 = $("<div class='control-group'><label class='control-label' for='focusedInput'>���Ͷ��ʱ�Σ�</label></div>");
				 var div2 = $("<div class='controls'></div>");
				 div2.append(fieldset);
				 div1.append(div2);
				
				 $("#oAdPeriodsDiv").append(div1);
				 
				 var check_0 = $("<input type='checkbox' checked>");
				 var legend_0 = $("<legend style='font-size:12px;margin:0px'>������ʱ���</legend>");
				 legend_0.append(check_0);
				 var span_0 = $("<span> ȫѡ</span>");
				 legend_0.append(span_0);
				 var ul_0 = $("<ul class='floatLeft'></ul>");
				 fieldset.append(legend_0);
				 fieldset.append(ul_0);
				 
				 var check_1 = $("<input type='checkbox' checked>");
				 var legend_1 = $("<legend style='font-size:12px;margin:0px'>�ǹ�����ʱ���</legend>");
				 legend_1.append(check_1);
				 var span_1 = $("<span> ȫѡ</span>");
				 legend_1.append(span_1);
				 var ul_1 = $("<ul class='floatLeft'></ul>");
				 fieldset.append(legend_1);
				 fieldset.append(ul_1);
				 
				 var checkedSingle = function()
				 {
					 
					 var arr_0 = $("input[name='oPeriods_0']");
					 var arr_1 = $("input[name='oPeriods_1']");
					 allCheck[1] = new Array();
					 var count_0 = 0;
					 for(var i=0;i<arr_0.length;i++)
					 {
						 if(arr_0[i].checked == true)
						{
							 count_0++;
							 allCheck[1].push(arr_0[i].value);
						}
					 }
					 check_0.prop('checked', arr_0.length == count_0);
					 
					 var count_1 = 0;
					 for(var i=0;i<arr_1.length;i++)
					 {
						 if(arr_1[i].checked == true)
					     {
							 allCheck[1].push(arr_1[i].value);
							 count_1++;
					     }
					 }
					 
					 check_1.prop('checked', arr_1.length == count_1);
					 
					 if(count_0+count_1 == arr_0.length + arr_1.length)
						 delete allCheck[1];
					
				 };
				 
				 
				 allCheck[1] = new Array();
				 for(var i=0;i<periodsData.items.length;i++)
			 	{
			 		var obj = periodsData.items[i];
			 		var type = obj.type;
			 		
			 		var eachInput = $("<input type='checkbox' value='"+obj.periodId+"' name='oPeriods_"+type+"' checked />");
		 			var eachSpan = $("<span style='margin-left:5px;margin-right:30px'>"+obj.desc+" </span>");
		 			var eachLi = $("<li></li>")	;
		 			eachLi.append(eachInput);
		 			eachLi.append(eachSpan);
			 		if(type == 0)
			 		{
			 			ul_0.append(eachLi);
			 		}
			 		else
			 		{
			 			ul_1.append(eachLi);
			 		}
			 		
			 		allCheck[1].push(obj.periodId);
			 			
			 		eachInput.change(function(event)
			 		{
			 			checkedSingle();
			 		});
			 		
			 	}
				 
				 
				 check_0.change(function(event)
				 {
					 var arr_0 = $("input[name='oPeriods_0']");
					
					 for(var i=0;i<arr_0.length;i++)
					 {
						 arr_0[i].checked = event.target.checked;
					 }
					 
					 checkedSingle();
				 });
				 
				 check_1.change(function(event)
				 {
					 var arr_1 = $("input[name='oPeriods_1']");
					 for(var i=0;i<arr_1.length;i++)
					 {
						 arr_1[i].checked = event.target.checked;
					 }
					 checkedSingle();
				 });
				 
			 };
			 
			 var allCheck = new Object();
			 var addInfoCode = function(code)
			 {
				 var groupDiv = $("<div class='control-group'></div>");
				 $("div#oInfoPriceDiv").append(groupDiv);
				 var groupLabel = $("<label class='control-label' for='focusedInput'>"+code.desc+"��</label>");
				 groupDiv.append(groupLabel);
				 
				 var controlDiv = $("<div class='controls' ></div>");
				 groupDiv.append(controlDiv);
				 
				 var allInput = $("<input type='checkbox' checked>");
				 var allUL = $("<ul class='chooseAll'><li></li></ul>");
				 allUL.append(allInput);
				 allUL.append("<span>ȫѡ</span>");
				 controlDiv.append(allUL);
				 
				 var eachUL = $("<ul class='floatLeft'></ul>");
				 controlDiv.append(eachUL);
				 
				 var lis = new Array();
				 for(var i=0;i<code.items.length;i++)
				 {
					 var eachLi = $("<li></li>");
					 var obj= code.items[i];
					 var eachInput = $("<input type='checkbox' name='oGroup"+code.codeName+"' checked value='"+obj.codeValue+"' data-validation-minchecked-minchecked='1' data-validation-minchecked-message='������ѡ��һ��"+code.desc+"����������Ч'  >");
					 eachLi.append(eachInput);
					 lis.push(eachInput);

					 var eachSpan = $("<span>"+obj.desc+"</span>");
					 eachLi.append(eachSpan);
					 
					 eachUL.append(eachLi);
					 
					 eachInput.change(function(event)
					 {
						 var groupName = "oGroup"+code.codeName;
						 var inputs = $('input[name="' + groupName + '"]');
						 
						 allCheck[code.codeName] = [];   //���³�ʼ��
						 var index = -1;
						 for(var j=0;j<inputs.length;j++)
						 {
							 if(inputs[j].checked == false)  //����û��ѡ�е�checkbox
							 {
								 index = j;
							 }
							 else
							{
								allCheck[code.codeName].push(inputs[j].value);
							}
						 }
						
						 if(index == -1)  //-1��ʾ��ѡ����
						 {
							 allInput.prop('checked', true);
							 delete allCheck[code.codeName];
						 }
						 else
							 allInput.prop('checked', false);
					 });
				 }
				 
				 allInput.change(function(event)
				 {
					 var checked = event.target.checked;
					 for(var j=0;j<lis.length;j++)
					{
						 lis[j].prop('checked', checked);
						 if(checked == true)
							 delete allCheck[code.codeName]; 
					}
				 });
				
			 };
			 
			 
			 var setStatus = function(_status)
			 {
				 status = _status;
			 };
			 
			 var saveAD = function(event,status)
			 {
				 var _data = {
						 'infoAd':
						 {
							 'adId':adId,
							 'status':status,
							 'price':$("#oPrice").val(),
							 'effTime':$("#oEffTime").val(),
							 'expTime':$("#oExpTime").val()
						 },
				 quiz:{}
				 };
				 
				 $.ajax({  
	        		    url:baseurl+"auth/ad/saveAd.do",  
	        		    type:"POST",  
	        		    data:JSON.stringify(_data),  
	        		    async:false,
	        		    dataType:"json", 
	        		    success:function(data){ 
	        		    	if(data.errorCode == 0)
	        		    		alertify.success("������ӳɹ�");
	        		    	adcakehref(data,event);
	        		    	window.parent.changeOboxDivSrc("addetails/AdList.jsp");
	        		    },  
	        		    error:function(){  
	        		    	alertify.alert('δ֪������������ӹ��');
	        		    }  
	        		});
			 };
	</script>
</body>
</html>