<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%>
<%
	String baseUrl = "http://" + request.getServerName() + ":"
			+ request.getServerPort() + request.getContextPath() + "/";
%>
<base href="<%=baseUrl%>" />
<html lang="en">
<head>
<meta charset="utf-8">
<title>广告基本属性 馅饼儿 大家一起来做馅饼</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Le styles -->
<link rel="shortcut icon" href="images/icon/favicon.ico" />
<link href="assets/css/bootstrap.min.css" rel="stylesheet">
<link type="text/css" href="css/custom-theme/jquery-ui.css"
	rel="stylesheet" />
<link rel="stylesheet" href="assets/css/alertify/alertify.core.css" />
<link rel="stylesheet" href="assets/css/alertify/alertify.default.css"
	id="toggleCSS" />

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

</head>

<%
	String status = request.getParameter("status");
%>

<body data-spy="scroll" data-target=".bs-docs-sidebar"
	data-twttr-rendered="true">

	<div
		style="border-bottom:1px solid #DCDCDC;padding-bottom:5px;margin-bottom:10px">
		<table style="font-size:12px">
			<tr>
				<td><span style="margin-right:10px">开始时间：</span>
				</td>
				<td><input type="text" id="oStartTime" />
				</td>
				<td><span style="margin-right:10px;margin-left:20px">结束时间：</span>
				</td>
				<td><input type="text" id="oEndTime" />
				</td>
			</tr>
			<tr>
				<td><span style="margin-right:10px">广告类型：</span>
				</td>
				<td><select id="oAdType"><option value="">请选择广告类型</option>
				</select>
				</td>
				<td><button style="margin-left:20px" onclick="searchADs()">查询</button>
				</td>
			</tr>
		</table>
	</div>
	<div style="margin:auto;margion-top:10px">
		<table
			style="width:100%;font-weight:400;border:1px solid #DCDCDC;font-size:12px;">
			<thead style="border:1px solid #DCDCDC;height:30px">
				<tr>
					<th width="20%">缩略图</th>
					<th width="20%">广告类型</th>
					<th width="20%">广告名称</th>
					<th width="13%">预算</th>
					<th width="13%">详情</th>
					<th width="13%">点击详情</th>
					<th width="13%">编辑</th>
					<th width="13%">删除</th>
					<th style="padding-left:15px"></th>
				</tr>
			</thead>
		</table>
	</div>
	<div
		style="height:330px;width:100%;margin:auto;margion-top:10px;overflow-y:scroll">
		<table id="oAdTable"
			style="width:100%;font-weight:400;border:1px;font-size:12px;"
			class="datastyle">
			<tbody>
				<tr>
					<td colspan="5" class="dataTables_empty">无相关查询数据。</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div style="text-align: center;border-top:1px solid #DCDCDC;padding-top:5px;">
		<table width="40%" style="text-align:center;font-size:12px;margin-left:30%;margin-right:30%">
			<tr>
				<td id="oRowCount" valign="middle" >共计<span id="oRowCount"></span>条</td>
				<td id="oFirst" valign="middle"><div id="oFirstBtn" style="cursor:pointer;color:#0088cc" onclick="alert();pageRedirect('FIRST')">首页</div></td>
				<td id="oPrev" valign="middle"><div style="cursor:pointer;color:#0088cc" id="oPrevBtn"  onclick="pageRedirect('PREVIOUS')">上一页</div></td>
				<td id="oNext" valign="middle"><div style="cursor:pointer;color:#0088cc" id="oNextBtn"  onclick="pageRedirect('NEXT')">下一页</div></td>
				<td id="oEnd" valign="middle"><div style="cursor:pointer;color:#0088cc" id="oEndBtn"  onclick="pageRedirect('END')">末页</div></td>
				<td valign="middle">到第 <input name="oPages" type="number"  size="8" id="oPages" style="height:20px;width:60px">页</td>
				<td valign="middle" id="oGoBtn"><div style="cursor:pointer;color:#0088cc" id="oGoBtn" onclick="pageRedirect('ASSIGN')">跳转</div></td>
			</tr>
		</table>
	</div>
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="assets/js/jquery-1.9.0.min.js" type="text/javascript"></script>
	<script src="assets/js/jquery-ui-1.10.0.custom.min.js"
		type="text/javascript"></script>
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="assets/js/alertify/alertify.min.js" type="text/javascript"></script>
	<script src="js/json2.js" type="text/javascript"></script>

	<script type="text/javascript">
		
			 var baseurl = "<%="http://" + request.getServerName() + ":"
					+ request.getServerPort() + request.getContextPath() + "/"%>"; 

			 var status = "<%=status%>";
			 
		$(document).ready(
				function() {
					$("input#oStartTime").datepicker(
							{
								dateFormat : 'yy-mm-dd',
								dayNames : [ '星期天', '星期二', '星期三', '星期四', '星期五',
										'星期六' ],
								dayNamesMin : [ '日', '一', '二', '三', '四', '五',
										'六' ],
								monthNames : [ '一月', '二月', '三月', '四月', '五月',
										'六月', '七月', '八月', '九月', '十月', '十一月',
										'十二月' ]
							}).datepicker("setDate", '-1w');

					$("input#oEndTime").datepicker(
							{
								dateFormat : 'yy-mm-dd',
								dayNames : [ '星期天', '星期二', '星期三', '星期四', '星期五',
										'星期六' ],
								dayNamesMin : [ '日', '一', '二', '三', '四', '五',
										'六' ],
								monthNames : [ '一月', '二月', '三月', '四月', '五月',
										'六月', '七月', '八月', '九月', '十月', '十一月',
										'十二月' ]
							}).datepicker("setDate", '0');
					$("button").button();

					searchADs();
					
				});

		var searchADs = function() {
			var _data = new Object();

			if ($("#oStartTime").val())
				_data.beginTime = new Date(Date
						.parse(($("#oStartTime").val() + " 00:00:00").replace(
								/-/g, "/"))).getTime();
			if ($("#oEndTime").val())
				_data.endTime = new Date(Date
						.parse(($("#oEndTime").val() + " 23:59:59").replace(
								/-/g, "/"))).getTime();

			if ($("#oAdType").val())
				_data.adType = $("#oAdType").val();
			_data.status = status;
			$.ajax({
				url : baseurl + "auth/ad/getAdSummaries.do",
				type : "POST",
				data : JSON.stringify(_data),
				dataType : "json",
				success : function(data) {
					loadData(data);
				},
				error : function() {
					alertify.error("未知错误，请重新查询");
				}
			});
		};

		var jsonData = new Object(); 
		var pageCount = 50;   //每一页页数
		var allCount = 0 ;  //总条数
		var currentPage = 0;  //现在页数
		var allPage = 0 ;     //总页数
		var loadData = function(data) {
			var properties = [ "image", "adName", "adStyle","adBudget" ];
			var percentWidth = [ "20%", "20%", "20%", "13%", "13%", "13%" ];
			
			jsonData = JSON.parse(data);
			
			allPage = jsonData.length%pageCount==0?jsonData.length/pageCount:jsonData.length/pageCount+1;
			$("#oPages").val(allPage);
			$("#oRowCount").val(jsonData.length);
		};
		
		var pageRedirect = function(operation)
		{
			if(operation == "FIRST")   //首页
				currentPage = 0;
			else if (operation == "PREVIOUS") //上一页
				currentPage--;
			else if (operation == "NEXT")
				currentPage++;			
			else if (operation == "END")
				currentPage = allPage-1;
			else if (operation == "ASSIGN")
			{
				if($("#oPages").val() == "")
				{
					alertify.error("请输入正确的页码");
					return;
				}
				else if($("#oPages").val() > allPage || $("#oPages").val() < 0)
				{
					alertify.error("您输入的页码不在范围之内，请重新输入");
					$("#oPages").val("");
					return;
				}
				else
				{
					currentPage = parseInt($("#oPages").val())-1;
				}
			}
				
			var startIndex = currentPage == 0 ?0:currentPage*pageCount;
			var endIndex = currentPage == allpage - 1?allCount:currentPage*pageCount + pageCount -1;	
			
			parseData(startIndex,endIndex);
		};
		
		var parseData = function(startIndex,endIndex)
		{
			var adTbody = $("#oAdTable > tbody");
			$("#oAdTable tbody").empty(); //清空内容
			
			for ( var i = 0; i < jsonData.length; i++) {
				var obj = jsonData[i];
				var adTr = $("<tr><tr/>");

				var adTd;
				for ( var i = 0; i < properties; i++) {

					if (properties[i] == "image") {
						adTd = $("<td width="+percentWidth[i]+"><image src='"+obj[properties[i]]+"'/></td>");
					} else
						adTd = $("<td width="+percentWidth[i]+"><span style='text-align:center'>'"
								+ obj[properties[i]] + "'</span></td>");
					adTr.append(adTd);
				}

				adTd = $("<td width='13%'><image src='assets/img/preview.gif' title='查看详情' onclick='detailAd('"
						+ obj["adId"] + "')' /></td>"); //查看详情
				adTr.append(adTd);
				adTd = $("<td width='13%'><image src='assets/img/pause.gif' title='暂停后才能编辑' onclick='pauseAd('"
						+ obj["adId"]
						+ "',this)' /><image src='assets/img/edit.gif'  title='编辑' onclick='editAd('"
						+ obj["adId"] + "',this)' /></td>"); //暂停
				adTr.append(adTd);
				adTd = $("<td width='13%'><image src='assets/img/delete.gif' title='失效'  onclick='disabledAd('"
						+ obj["adId"] + "')' /></td>"); //暂停
				adTr.append(adTd);

				adTbody.append(adTr);
			}
		};

		var detailAd = function(adId) {
			alert(adId);
		};

		var pauseAd = function(adId) {
			alert(adId);
		};

		var disabledAd = function(adId) {
			alert(adId);
		};
	</script>
</body>
</html>