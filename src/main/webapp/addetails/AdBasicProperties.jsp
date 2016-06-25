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
	<title>广告基本属性 馅饼儿 大家一起来做馅饼</title>
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!-- Le styles -->
	<link rel="shortcut icon" href="images/icon/favicon.ico" />
	<link href="assets/css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" href="css/custom-theme/jquery-ui.css"
		rel="stylesheet" />
	<link type="text/css" href="assets/css/font-awesome.min.css"
		rel="stylesheet" />
	<link rel="stylesheet" href="assets/css/alertify/alertify.core.css" />
	<link rel="stylesheet" href="assets/css/alertify/alertify.default.css"
		id="toggleCSS" />
	<link rel="stylesheet" href="assets/css/ui.dynatree.css" />
	
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
<%
	
%>
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
		<form class="form-horizontal" method="POST">
			<fieldset style="width:100%;">
				<legend style="background:#DCDCDC">
					<span style="font-size:14px;color:#B9484A;padding-left:3%;"><strong
						style="font-size:20px;color:#000">添加广告</strong><a class="button"
						style="margin-left:20px;text-decoration:underline"
						onclick="chooseFromAds()">从已有广告选取</a> </span>
				</legend>
				<div class="control-group">
					<label class="control-label" for="focusedInput">广告名称：<span class="tooltipRed">*</span></label>
					<div class="controls">
						<input class="input-xlarge focused" id="oAdName" type="text"
							required data-validation-required-message="请输入广告名称">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="focusedInput">广告形式：<span class="tooltipRed">*</span></label>
					<div class="controls">
						<table>
							<tr>
								<td><input type="radio" value="0" checked
									id="oAdDisappearType" name="oAdDisappearType" /></td>
								<td><span>视频广告</span></td>
								<td>【视频的形式展现给用户，用户需要下载视频广告】</td>
							</tr>
							<tr>
								<td><input type="radio" value="1" name="oAdDisappearType" />
								</td>
								<td><span>封面广告</span></td>
								<td>【打开手机客户端应用出现的封面广告】</td>
							</tr>
							<tr>
								<td><input type="radio" value="2" name="oAdDisappearType" />
								</td>
								<td><span>锁屏广告</span></td>
								<td>【解锁时出现的图片广告】</td>
							</tr>
							<tr>
								<td><input type="radio" value="3" name="oAdDisappearType" />
								</td>
								<td><span>活动广告</span></td>
								<td>【需要用户参与活动并填写调查问卷内容】</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="control-group" style="border-bottom:1px solid #DCDCDC">
					<label class="control-label" for="focusedInput">广告相关网址：</label>
					<div class="controls">
						<input type=text id="oAdLink" value="" />
						<p>
							<span class="help-inline tooltip">【请填写该广告的相关网址，方便用户查看更多信息。】</span>
						</p>
					</div>
				</div>
				<div>
					<div class="form-actions" style="text-align:left;padding-left:28%;">
						<button id="oSaveButton" style="margin-right:5%" id="oSave" onclick="setStatus(0)">临时保存</button>
						<button id="oSubmitButton" style="margin-left:5%" id="oSubmit"
							onclick="setStatus(-1)">保存并上传视频</button>
							<span id="oSaveSpan" style="color:red"></span>
							<img src="images/mainpage/arrow.png"/>
							<span style="font-size:14px">预览</span>
							<img src="images/mainpage/arrow.png"/>
							<span style="font-size:14px">曝光计划</span>
					</div>
				</div>
		</form>
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
	<script src="assets/js/uploadify/swfobject.js" type="text/javascript"></script>
	<script src="assets/js/uploadify/jquery.uploadify.v2.1.4.js" type="text/javascript"></script>
	<script type="text/javascript">
		var baseurl = "<%=baseUrl%>";
		var adId = "<%=adId%>";
		adId = adId ? adId : -1;
		
		var adStyle = 0;
		var status = -1;
		$(document).ready(function() {
			$('button').button();

			$(":input[name='oAdDisappearType']").change(function(event) {
				var value = event.target.value;
				adStyle = value;
			});

			invalid();
		});

		var invalid = function() {//.not(":disabled")
			$("input,select,textarea").not("[type=submit]")
					.jqBootstrapValidation({
						submitSuccess : function($form, event) {
							saveAdBasicPro();
						}
					});
		};
		
		var hrefAdList = function(event) {
			window.parent.changeOboxDivSrc("addetails/AdList.jsp");
			return false;
		};

		var setStatus = function(_status) {
			status = _status;
		};

		var saveAdBasicPro = function() {
			var _data = {
				'infoAd' : {
					'adId' : adId,
					'adName' : encodeURIComponent($("#oAdName").val()),
					'adStyle' : adStyle,
					'quizList' : '',
					'status' : 0
				},
				quiz : {}
			};

			

			$.ajax({
				url : baseurl + "auth/ad/saveAd.do",
				type : "POST",
				data : JSON.stringify(_data),
				async : false,
				dataType : "json",
				success : function(data) {

					if (data.errorCode == 0)
						alertify.success("广告增加成功");
					if (status == 0)
					{
						adcakehref(data, event);
						window.parent.changeOboxDivSrc("addetails/AdList.jsp");
					}
					else if (status == -1)
					{
						adcakehref(data, event);
						window.parent.changeOboxDivSrc("addetails/AdFileProperties.jsp?adId=12&adName="+$("#oAdName").val()+"&adStyle="+adStyle);
					}
				},
				error : function() {
					alertify.alert('未知错误，请重新添加广告');
				}
			});
		};
	</script>
</body>
</html>