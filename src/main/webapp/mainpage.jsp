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
	<title>我的首页 馅饼儿 大家一起来做馅饼</title>
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!-- Le styles -->
	<link rel="shortcut icon" href="images/icon/favicon.ico" />
	<link href="<%=baseUrl + "assets/css/bootstrap.min.css"%>"
		rel="stylesheet">
	<link type="text/css"
		href="<%=baseUrl + "css/custom-theme/jquery-ui.css"%>" rel="stylesheet" />
	<link type="text/css"
		href="<%=baseUrl + "assets/css/font-awesome.min.css"%>" rel="stylesheet" />
	
	
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
		style="height:10%;background:#F6F6F7;padding-top:0px;border-bottom:1px solid #DCDCDC;text-align:right;padding-top:0.5%;padding-bottom:0.5% ">
		<div style="display:inline;margin-right:3%;height:100%;">
			<span style="font-size:12px;color:DCDCDC;margin-right:10px">您好，某某某露露脸</span>
			<span style="color:#DCDCDC;margin-right:1%">|</span>
			<div style="height:100%;display:inline;"
				onmouseover="myAccount('show')" onmouseout="myAccount('hide')">
				<span style="cursor:pointer;color:#666666;font-size:12px"
					id="oMyAccount"> <a>我的馅饼</a> <span>(余额：￥100.00)</span> <img
					style="width:14px;height:14px;" id="oMyAccountImg"
					src="images/mainpage/downarrow.png" /> </span>
			</div>
			<span style="color:#DCDCDC;margin-right:1%">|</span>
			<div style="height:100%;display:inline;"
				onmouseover="myMessage('show')" onmouseout="myMessage('hide')">
				<span style="cursor:pointer;"> <a id="oMyMessage"
					style="color:#666666;font-size:12px;" id="oNewNumA1">消息中心(2)</a> <img
					style="margin-right:1%;width:14px;height:14px" id="oMyMessageImg"
					src="images/mainpage/downarrow.png" />
				</span>
			</div>
			<span style="color:#DCDCDC;margin-right:1%">|</span> <span><a
				id="oMyAccount"
				style="color:#666666;font-size:12px;margin-right:1%;cursor:pointer"
				onmouseover="myAccount()">帮助中心</a>
			</span> <span style="color:#DCDCDC;margin-right:1%">|</span> <span><a
				id="oMyAccount"
				style="color:#666666;font-size:12px;margin-right:1%;cursor:pointer"
				onmouseover="myAccount()">反馈信息</a>
			</span> <span style="color:#DCDCDC;">|</span> <span><a
				id="oMyAccount"
				style="color:#666666;font-size:12px;margin-right:20px;margin-left:20px;cursor:pointer"
				onclick="sessionout(event)">退出</a>
			</span>
		</div>
	</div>
	<div id="oBoxDiv"></div>
	<div style="width:300px;font-size:12px;float:left" id="oMyAccountDiv"
		onmouseover="myAccount('show')" onmouseout="myAccount('hide')">
		<div style="background:#F6F6F7;border:1px solid #DCDCDC">
			<form style="text-align:left">
				<label style="margin-left:20px;margin-top:10px">linmy@asiainfo-linkage.com</label>
				<div style="margin-top:10px;">
					<button class="ui-button-error" style="margin-left:20px;"
						onclick="window.open('','_self')">充值</button>
					<a class="button" style="margin-left:40px;cursor:pointer">充值记录</a> <a
						class="button" style="margin-left:20px;cursor:pointer;">消费记录</a>
				</div>
			</form>
		</div>
	</div>
	<div style="width:340px;font-size:12px;float:left" id="oMyMessageDiv"
		onmouseover="myMessage('show')" onmouseout="myMessage('hide')">
		<div style="background:#F6F6F7;border:1px solid #DCDCDC">
			<div style="margin-top:3%">
				<span style="margin-left:5%"> 您有 <a style="color:blue;cursor:pointer"
					id="oNewNUMA2">2</a> 条未读信息</span> <a style="margin-left:34%;cursor:pointer">我知道了</a>
			</div>
			<form style="text-align:left">
				<label style="margin-left:20px;margin-top:10px;font-size:12px">您于2013年8月31日提交的广告A1已经通过审核。</label>
				<label style="margin-left:20px;margin-top:10px;font-size:12px">您于2013年8月31日提交的广告A2被拒绝，请查看原因。</label>
			</form>
		</div>
	</div>
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="<%=baseUrl + "assets/js/jquery-1.9.0.min.js"%>"
		type="text/javascript"></script>
	<script src="<%=baseUrl + "assets/js/jqBootstrapValidation.js"%>"
		type="text/javascript"></script>
	<script src="<%=baseUrl + "assets/js/bootstrap.min.js"%>"
		type="text/javascript"></script>
	<script src="<%=baseUrl + "assets/js/jquery-ui-1.10.0.custom.min.js"%>"
		type="text/javascript"></script>
	<script src="<%=baseUrl + "js/json2.js"%>" type="text/javascript"></script>
	<script src="<%=baseUrl + "assets/js/alertify/alertify.min.js"%>"
		type="text/javascript"></script>
	<script src="<%=baseUrl + "assets/js/jquery.dynatree.js"%>"
		type="text/javascript"></script>
	<script src="<%=baseUrl + "ckeditor/ckeditor.js"%>"></script>
	<script type="text/javascript">
			var baseurl = "<%=baseUrl%>";
		var status = 0;
	<%String pagetype = request.getParameter("pagetype");
			pagetype = pagetype == null ? "" : pagetype;%>
		$(document).ready(function() {
			$("div#oMyAccountDiv").hide();
			$("div#oMyMessageDiv").hide();
			changeOboxDivSrc("addetails/AdBasicProperties.jsp");
		});

		function changeOboxDivSrc(pageSrc) {
			var oBoxDiv = $("#oBoxDiv");
			oBoxDiv.empty();
			var oBoxIframe =$("<iframe  id='oBoxIframe' frameborder=0 style='margin-top:10px;width:100%;' src='"+pageSrc+"'> </iframe>");
			oBoxDiv.append(oBoxIframe);
			oBoxIframe.height($(document).height() * 0.9);
		};

		function myAccount(operation) {
			if (operation == "show") {
				var X = $('#oMyAccount').offset().left;
				var Y = $('#oMyAccount').offset().top;
				var height = $('#oMyAccount').height();

				$("img#oMyAccountImg").attr("src",
						"images/mainpage/uparrow.png");
				$("div#oMyAccountDiv").show();
				$("div#oMyAccountDiv").offset({
					top : Y + height,
					left : X
				});
			} else {
				$("img#oMyAccountImg").attr("src",
						"images/mainpage/downarrow.png");
				$("div#oMyAccountDiv").hide();
			}
		}

		var hideAcitivityContent = function(value) {
			alert(value);
		};
		function myMessage(operation) {
			if (operation == "show") {
				var X = $('#oMyMessage').offset().left;
				var Y = $('#oMyMessage').offset().top;
				var height = $('#oMyMessage').height();
				$("img#oMyMessageImg").attr("src",
						"images/mainpage/uparrow.png");
				$("div#oMyMessageDiv").show();
				$("div#oMyMessageDiv").offset({
					top : Y + height,
					left : X
				});
			} else {
				$("img#oMyMessageImg").attr("src",
						"images/mainpage/downarrow.png");
				$("div#oMyMessageDiv").hide();
			}
		}

		function sessionout(event) {
			adcakehref(null, event, "index.jsp");
		}
	</script>
</body>
</html>