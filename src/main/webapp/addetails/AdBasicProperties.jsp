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
	<title>���������� �ڱ��� ���һ�������ڱ�</title>
	
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
<%
	
%>
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
		<form class="form-horizontal" method="POST">
			<fieldset style="width:100%;">
				<legend style="background:#DCDCDC">
					<span style="font-size:14px;color:#B9484A;padding-left:3%;"><strong
						style="font-size:20px;color:#000">��ӹ��</strong><a class="button"
						style="margin-left:20px;text-decoration:underline"
						onclick="chooseFromAds()">�����й��ѡȡ</a> </span>
				</legend>
				<div class="control-group">
					<label class="control-label" for="focusedInput">������ƣ�<span class="tooltipRed">*</span></label>
					<div class="controls">
						<input class="input-xlarge focused" id="oAdName" type="text"
							required data-validation-required-message="������������">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="focusedInput">�����ʽ��<span class="tooltipRed">*</span></label>
					<div class="controls">
						<table>
							<tr>
								<td><input type="radio" value="0" checked
									id="oAdDisappearType" name="oAdDisappearType" /></td>
								<td><span>��Ƶ���</span></td>
								<td>����Ƶ����ʽչ�ָ��û����û���Ҫ������Ƶ��桿</td>
							</tr>
							<tr>
								<td><input type="radio" value="1" name="oAdDisappearType" />
								</td>
								<td><span>������</span></td>
								<td>�����ֻ��ͻ���Ӧ�ó��ֵķ����桿</td>
							</tr>
							<tr>
								<td><input type="radio" value="2" name="oAdDisappearType" />
								</td>
								<td><span>�������</span></td>
								<td>������ʱ���ֵ�ͼƬ��桿</td>
							</tr>
							<tr>
								<td><input type="radio" value="3" name="oAdDisappearType" />
								</td>
								<td><span>����</span></td>
								<td>����Ҫ�û���������д�����ʾ����ݡ�</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="control-group" style="border-bottom:1px solid #DCDCDC">
					<label class="control-label" for="focusedInput">��������ַ��</label>
					<div class="controls">
						<input type=text id="oAdLink" value="" />
						<p>
							<span class="help-inline tooltip">������д�ù��������ַ�������û��鿴������Ϣ����</span>
						</p>
					</div>
				</div>
				<div>
					<div class="form-actions" style="text-align:left;padding-left:28%;">
						<button id="oSaveButton" style="margin-right:5%" id="oSave" onclick="setStatus(0)">��ʱ����</button>
						<button id="oSubmitButton" style="margin-left:5%" id="oSubmit"
							onclick="setStatus(-1)">���沢�ϴ���Ƶ</button>
							<span id="oSaveSpan" style="color:red"></span>
							<img src="images/mainpage/arrow.png"/>
							<span style="font-size:14px">Ԥ��</span>
							<img src="images/mainpage/arrow.png"/>
							<span style="font-size:14px">�ع�ƻ�</span>
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
						alertify.success("������ӳɹ�");
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
					alertify.alert('δ֪������������ӹ��');
				}
			});
		};
	</script>
</body>
</html>