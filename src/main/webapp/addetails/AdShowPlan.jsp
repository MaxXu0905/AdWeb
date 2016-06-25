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
	<title>我的首页 馅饼儿 大家一起来做馅饼</title>
	
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
	
	
	<!-- 自定义css.css -->
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
			<img src="assets/img/preview.gif" title="进入广告列表" /><span
				style="margin-left:10px">进入广告列表</span>
		</div>
		<form class="form-horizontal">
			<fieldset style="width:100%;">
				<legend style="background:#DCDCDC">
					<span style="font-size:14px;color:#B9484A;padding-left:3%;"><strong
						style="font-size:20px;color:#000">广告曝光计划</strong> </span>
				</legend>
				<div class="control-group">
					<label class="control-label" for="focusedInput">设置投放计划：</label>
					<div class="controls">
						<table>
							<tr>
								<td><input type="checkbox" id="oShowWayCheckBox" /><span
									style="margin-left:2px;margin-right:10px">限制投放成本</span><input
									type="text" placeholder="请输入成本" id="oLimitMoney" disabled><span
									style="margin-left:5px">元</span>
								</td>
							</tr>
						</table>
						<span class="help-inline">【有效时间内，是否需要投放的成本。如果不需要，则默认到达时效时间或者余额不足时，自动停止广告投放】</span>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label">设置投放单价：</label>
					<div class="controls">
						<table>
							<tr style="margin-top:20px">
								<td><input type="number" placeholder="请设置投放单价"
									name="oPrice" required
									data-validation-required-message="请填写投放单价"
									data-validation-number-message="请填入数字" />
								</td>
							</tr>
						</table>
						<span class="help-inline">【投放单价为用户完成一个广告时，所获得的价钱。】</span>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="focusedInput">设置生效时间：</label>
					<div class="controls">
						<table>
							<tr style="margin-top:20px">
								<td>广告生效时间：<input type="text" placeholder="请选择生效时间"
									id="oEffTime" style="margin-right:10px" />广告失效时间：<input
									type="text" placeholder="请输入失效时间" id="oExpTime" />
								</td>
							</tr>
						</table>
						<span class="help-inline">【生效时间到失效时间为有效时间。不填写生效时间，默认为审核通过后立即生效；不填写时效时间，默认为余额不足时，自动停止广告投放】</span>
					</div>
				</div>


				<div class="control-group"
					style="border-top:1px solid #DCDCDC;padding-top:10px">
					<label class="control-label" for="focusedInput">同用户投放频率：</label>
					<div class="controls">
						<table>
							<tr>
								<td><input type="radio" checked name="oFrequentRadio" />
								</td>
								<td>不限</td>
							</tr>
							<tr>
								<td><input type="radio" value="FREQUENT"
									name="oFrequentRadio" />
								</td>
								<td><input type="number" id="oFrequent" required
									placeholder="请输入同用户曝光频率" disabled
									data-validation-required-message="请填写同用户曝光频率"
									data-validation-number-message="请填写数字" value="0"/><span
									style="margin-left:5px">小时</span>
								</td>
							</tr>
						</table>
						<span class="help-inline">【曝光频率为同一个用户看完广告后，隔多长时间才能再次看到。】</span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="focusedInput">同用户投放上限：</label>
					<div class="controls">
						<table>
							<tr>
								<td><input type="radio" checked name="oLimitTimesRadio" />
								</td>
								<td>不限</td>
							</tr>
							<tr>
								<td><input type="radio" value="LIMITTIME"
									name="oLimitTimesRadio" />
								</td>
								<td><input type="number" id="oLimitTimes" required
									placeholder="请输入同用户曝光上线" disabled
									data-validation-required-message="请填写同用户曝光上限"
									data-validation-number-message="请填写数字" value="0"/><span
									style="margin-left:5px" >次</span>
								</td>
							</tr>
						</table>
						<span class="help-inline">【曝光次数为同一个用户最多能看多少次广告】</span>
					</div>
				</div>
				<div class="control-group"
					style="border-top:1px solid #DCDCDC;padding-top:10px">
					<label class="control-label" for="focusedInput">广告投放地域：</label>
					<div class="controls">
						<input type="text" id="oPlace" value="全部" disabled /><a
							style="margin-left:5px;margin-right:5px;cursor:pointer"
							onclick="selectPlaces()">选择</a><a
							style="margin-left:5px;cursor:pointer" onclick="resetplaces()">重置</a>
					</div>
				</div>
				<!-- 只有视频广告才有广告描述 -->
				<div id="oAdPeriodsDiv"></div>
				<!-- 广告收费项目 -->
				<div id="oInfoPriceDiv" class="groupBorderTop"></div>
			</fieldset>
			<div>
				<div class="form-actions" style="text-align:left;padding-left:40%;">
					<button style="margin-right:5%" id="oSave" onclick="setStatus(0)">保存</button>
					<button style="margin-left:5%" id="oSubmit" onclick="setStatus(1)">提交</button>
				</div>
			</div>
		</form>
	</div>
	<div id="placeDialog" title="投放地域选择">
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
				
					$("input#oEffTime").datepicker({dateFormat:'yy-mm-dd',dayNames:['星期天','星期二','星期三','星期四','星期五','星期六'],dayNamesMin:['日','一','二','三','四','五','六'],monthNames:['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月']}).datepicker("setDate",'0');
					 $("input#oExpTime").datepicker({dateFormat:'yy-mm-dd',dayNames:['星期天','星期二','星期三','星期四','星期五','星期六'],dayNamesMin:['日','一','二','三','四','五','六'],monthNames:['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月']}).datepicker("setDate","0");
					 $('button').button();
					 
					 $("div#placeDialog").dialog({
	        			autoOpen:false,
	        			show:"blind",
	        			hide:"puff",
	        			resizable:false,
	        			height:310,
	        			width:600,
	        			buttons:{
	        				"确定":function(event)
	        				{
	        					selectedPlaces();
	        				},
	        				"取消":function()
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
	        		    		//增加广告select
	        		    		
	        		    		for(var i=0;i<data.items.length;i++)
		        		    	{
	        		    			var item = data.items[i];
	        		    			var codeName = item.codeName;
		        		    		var div = $("<div class='control-group'><label class='control-label' for='focusedInput'>"+item.desc+"：</label></div></div>");
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
	        		    	alertify.alert('获取用户选择信息失败：未知错误');
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
	        		    	alertify.alert('获取投放地域失败：未知错误');
	        		    }  
	        		});
			 };
			 
			 var selPlaceData = new Array();  //存放地域代码
			 var selPlace = new Array();      //存放地域名称
			 var selectPlaces = function()
			 {
				 selPlaceData = new Array();
				 selPlace = ["全部"];
				 if(placesData.items)
				 {
					 var treeData = new Object();
					 treeData = {title:"全部",select:true,children:replaceObjKey(placesData,treeData).children}; 
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
						 newObj["select"] = true;   //默认选择全部
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
				 if($.inArray("全部", selPlace)>=0)
				 {
					 delete allCheck[0];
					 $("#oPlace").val("全部");
				 }
				 else if(selPlaceData.length == 0)
				 {
					 alertify.alert("您至少需要选择一个投放地域");
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
				 $("#oPlace").val("全国");
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
	        		    	alertify.alert('获取投放时段失败：未知错误');
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
				 var div1 = $("<div class='control-group'><label class='control-label' for='focusedInput'>广告投放时段：</label></div>");
				 var div2 = $("<div class='controls'></div>");
				 div2.append(fieldset);
				 div1.append(div2);
				
				 $("#oAdPeriodsDiv").append(div1);
				 
				 var check_0 = $("<input type='checkbox' checked>");
				 var legend_0 = $("<legend style='font-size:12px;margin:0px'>工作日时间段</legend>");
				 legend_0.append(check_0);
				 var span_0 = $("<span> 全选</span>");
				 legend_0.append(span_0);
				 var ul_0 = $("<ul class='floatLeft'></ul>");
				 fieldset.append(legend_0);
				 fieldset.append(ul_0);
				 
				 var check_1 = $("<input type='checkbox' checked>");
				 var legend_1 = $("<legend style='font-size:12px;margin:0px'>非工作日时间段</legend>");
				 legend_1.append(check_1);
				 var span_1 = $("<span> 全选</span>");
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
				 var groupLabel = $("<label class='control-label' for='focusedInput'>"+code.desc+"：</label>");
				 groupDiv.append(groupLabel);
				 
				 var controlDiv = $("<div class='controls' ></div>");
				 groupDiv.append(controlDiv);
				 
				 var allInput = $("<input type='checkbox' checked>");
				 var allUL = $("<ul class='chooseAll'><li></li></ul>");
				 allUL.append(allInput);
				 allUL.append("<span>全选</span>");
				 controlDiv.append(allUL);
				 
				 var eachUL = $("<ul class='floatLeft'></ul>");
				 controlDiv.append(eachUL);
				 
				 var lis = new Array();
				 for(var i=0;i<code.items.length;i++)
				 {
					 var eachLi = $("<li></li>");
					 var obj= code.items[i];
					 var eachInput = $("<input type='checkbox' name='oGroup"+code.codeName+"' checked value='"+obj.codeValue+"' data-validation-minchecked-minchecked='1' data-validation-minchecked-message='请至少选择一个"+code.desc+"，否则广告无效'  >");
					 eachLi.append(eachInput);
					 lis.push(eachInput);

					 var eachSpan = $("<span>"+obj.desc+"</span>");
					 eachLi.append(eachSpan);
					 
					 eachUL.append(eachLi);
					 
					 eachInput.change(function(event)
					 {
						 var groupName = "oGroup"+code.codeName;
						 var inputs = $('input[name="' + groupName + '"]');
						 
						 allCheck[code.codeName] = [];   //重新初始化
						 var index = -1;
						 for(var j=0;j<inputs.length;j++)
						 {
							 if(inputs[j].checked == false)  //存在没有选中的checkbox
							 {
								 index = j;
							 }
							 else
							{
								allCheck[code.codeName].push(inputs[j].value);
							}
						 }
						
						 if(index == -1)  //-1表示都选上了
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
	        		    		alertify.success("广告增加成功");
	        		    	adcakehref(data,event);
	        		    	window.parent.changeOboxDivSrc("addetails/AdList.jsp");
	        		    },  
	        		    error:function(){  
	        		    	alertify.alert('未知错误，请重新添加广告');
	        		    }  
	        		});
			 };
	</script>
</body>
</html>