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
<title>活动详细</title>


<!-- Le styles -->
<link rel="shortcut icon" href="images/icon/favicon.ico" />
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

<style type="text/css">
input:disabled {
	border: 0px solid;
	background-color: #F5F5F5;
	color: #000;
	cursor: text;
}

textarea:disabled {
	border: 0px solid;
	background-color: #F5F5F5;
	color: #000;
	cursor: text;
}
</style>

<%
	String status = request.getParameter("status");
	
	String previousId = request.getParameter("previousId");
	String nextId = request.getParameter("nextId");
	
%>

<body data-spy="scroll" data-target=".bs-docs-sidebar"
	data-twttr-rendered="true">
	<form class="form-horizontal">
		<fieldset style="width:100%;">
			<div class="control-group">
				<label class="control-label" for="focusedInput">参与者手机号码：</label>
				<div class="controls">
					<input type="text" id="oUserName" disabled style="width:130px"
						value="ddss" />
				</div>
			</div>

			<div class="control-group">
				<label class="control-label" for="focusedInput">活动标题：</label>
				<div class="controls">
					<input type="text" id="oActiveName" disabled style="width:400px" />
					<span class="help-inline" style="cursor:pointer"><a>活动描述？</a>
					</span>
				</div>
			</div>

			<!-- 				<div class="control-group"> -->
			<!-- 					<label class="control-label">活动描述：</label> -->
			<!-- 					<div class="controls"> -->
			<!-- 						<textarea rows="3" cols="20" style="width:400px;height:200px" disabled ></textarea> -->
			<!-- 					</div> -->
			<!-- 				</div> -->

			<div id="oQuestionnaire">
				<div class="control-group">
					<label class="control-label" for="focusedInput">活动提交时间：</label>
					<div class="controls">
						<input type="text" id="oActiveTime" disabled style="width:130px" />
					</div>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="focusedInput">活动最后结果：</label>
				<div class="controls">
					<div id="oActiveResult">
						<input type="text" id="oActiveTime" disabled style="width:400px" />
					</div>
				</div>
			</div>
			<div class="control-group" id="oRejectReasonDiv" style="display:none">
				<label class="control-label" for="focusedInput"></label>
				<div class="controls">
					<textarea id="oDisplayReason" rows="4" cols="20"
						style="width:400px;height:100px" disabled></textarea>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="focusedInput"></label>
				<div class="controls"></div>
			</div>
		</fieldset>
	</form>

	<div>
		<button id="oPreviousActive" style="margin-left:18%" onclick="jumpActive(-1)">上一个</button>
		<button id="oPassActive" style="margin-left:1%" onclick="passActive(0)">审核通过</button>
		<button id="oRejectActive" style="margin-left:1%" onclick="rejectActive()">审核拒绝</button>
		<button id="oNextActive" style="margin-left:2%" onclick="jumpActive(1)">下一个</button>
	</div>

	<div id="oRejectReasonDialog" title="请填写拒绝原因">
		<textarea id="oInputReason" rows="4" cols="20"
			style="width:400px;height:200px"></textarea>
		<div class="ui-widget">
			<div class="ui-state-highlight ui-corner-all">
				<p>
					<span class="ui-icon ui-icon-info"
						style="float: left; margin-right: .3em;"></span> 
						 <strong>提醒:</strong> <span id="loginDialogAlertString">活动审批拒绝需要填写拒绝原因。</span></p>
				</p>
			</div>
		</div>
	</div>

	<!-- Placed at the end of the document so the pages load faster -->
	<script src="assets/js/jquery-1.9.0.min.js" type="text/javascript"></script>
	<script src="assets/js/jquery-ui-1.10.0.custom.min.js"
		type="text/javascript"></script>
	<script src="assets/js/alertify/alertify.min.js" type="text/javascript"></script>
	<script src="js/json2.js" type="text/javascript"></script>

	<script type="text/javascript">
		
			 var baseurl = "<%="http://" + request.getServerName() + ":"
					+ request.getServerPort() + request.getContextPath() + "/"%>"; 

			 var status = "<%=status%>";
			 var previousId = "<%=previousId%>";
			 var nextId = "<%=nextId%>";

		$(document).ready(
				function() {
					$("#oPreviousActive").button();
					$("#oPassActive").button();
					$("#oRejectActive").button();
					$("#oNextActive").button();

					$("div#oRejectReasonDialog").dialog({
						autoOpen : false,
						resizable : false,
						show : "blind",
						hide : "puff",
						height : 380,
						width : 450,
						buttons : {
							"确定" : function(event) {
								if ($("#oInputReason").text() == "") {
									return;
								}
							},
							"取消" : function() {
								$("div#oRejectReasonDialog").dialog("close");
							}
						},
						modal : true
					});

				});

		var rejectActive = function() {
			$("div#oRejectReasonDialog").dialog("open");
		};
	</script>
</body>
</html>