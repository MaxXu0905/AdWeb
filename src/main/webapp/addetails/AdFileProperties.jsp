<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%>
<%
	String baseUrl = "http://" + request.getServerName() + ":"
			+ request.getServerPort() + request.getContextPath() + "/";
	
	String adId = request.getParameter("adId");
	adId = adId == null || adId.length() == 0 ? "-1" : adId;
	
	String adName = request.getParameter("adName");
	adName = adName == null ?"":adName;
	
	String adStyle = request.getParameter("adStyle");
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
						style="font-size:20px;color:#000">��ӹ��</strong></span>
				</legend>
				<div id="oInfoCodeDiv"></div>
				<div class="control-group" id="oImgSelectDiv">
					<label class="control-label" for="focusedInput">���ϴ������棺<span class="tooltipRed">*</span></label>
					<div class="controls">
						<input type="file" id="oImgFile" name="oImgFile"/> 
						<div id="oImageFileName"></div>
						<span class="help-inline tooltip">��Ϊ�˱�֤����Ч�������ϴ���׼�ߴ磺480*800��</span>
					</div>
				</div>
				<div class="control-group" id="oProContentDiv">
				<label class="control-label" for="focusedInput">�����û���ݣ�<span class="tooltipRed">*</span></label>
					<div class="controls">
						<input type="checkbox" value="URLWAY" /> ���������û�ľ�����ַ
						<div>����д���ַ��<input type="text" id="oAcitivityContentURL"/></div>
						<input type="checkbox" value="CUSTOMIZE" />
						<a style="cursor:pointer" onclick="setActivity()" class="button" id="oActivityA">�Զ������û����</a>
						<div>
						
						<div id="oActivityDiv"></div>
						<div id="oActivityContent"></div>
						</div>
						<span class="help-inline tooltip">��Ϊ�˻�������ԣ�����д�����������衢������ڡ��Ҫ���磺�������ע������ȡ�</span>
					</div>
				</div>
				<!-- ֻ����Ƶ����ѡ����Ƶ -->
<!-- 				<div id="oVideoSelectDiv"> -->
<!-- 				<div class="control-group"  > -->
<!-- 					<label class="control-label" for="focusedInput">���ϴ���Ƶ��<span class="tooltipRed">*</span></label> -->
<!-- 					<div class="controls"> -->
<!-- 						<input type="file" id="oVideoFile" name="oVideoFile"/> -->
<!-- 						<div id="oVideoFileName"></div> -->
<!-- 						<span class="help-inline tooltip">��Ϊ�˱�֤��ƵЧ���Լ��ն˼����ԣ����ϴ���ʽΪmp4���ļ���СС��400k��������300kbps-350kbps֮����ļ�����</span> -->
<!-- 					</div> -->
<!-- 				</div> -->
				<!-- ֻ��������桢��������Լ���Ƶ����ѡ��ͼƬ -->
				<div class="control-group" id="oVideoSelectDiv" >
					<div class="controls" style="border:1px solid #DCDCDC">
						<span class="help-inline">��Ĭ���õ�һ�������Ϊ���棬���<span class="tooltip">ѡ���ķ���</span>���ġ�</span>
						<div id="oCutPictureDiv" style="width:700px;height:320px;">
							<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
							width="100%" height="100%"
							codebase="http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab" id="cutPicture">
								<param name="movie" value="addetails/cutPicuter.swf" />
								<param name="quality" value="high" />
								<param name="bgcolor" value="#869ca7" />
								<param name="allowScriptAccess" value="sameDomain" />
								<param name="allowFullScreen" value="true" />
								<param name="FlashVars" value="<%="contextpath="+baseUrl%>" />
								<embed src="addetails/cutPicuter.swf" quality="high" bgcolor="#869ca7"
									width="100%" height="100%" name="AddReportCompare" align="middle"
									play="true"
									loop="false"
									quality="high"
									allowScriptAccess="sameDomain"
					   				allowFullScreen  ="true"
									type="application/x-shockwave-flash"
									pluginspage="http://www.adobe.com/go/getflashplayer"
									FlashVars ="<%="contextpath="+baseUrl%>">
								</embed>
							</object>
					</div>
					</div>
				</div>
				<div class="control-group" id="oAuthenticDiv">
					<label class="control-label" for="focusedInput">��֤��ʽ��</label>
					<div class="controls">
						<input type="checkbox" name="oActivityWay" value="oActiveWay"
							checked />��д�𰸷�ʽ
						<!-- 				            	<table><tr><td><input type="radio" name="" value="oActiveWay" />������У��</td> -->
						<!-- 				            	<td><span style="font-size:12px">��������ṩ������ַ���û�����ɹ����ü����룬���ڶ��������뼤����У�鼴�ɻ��Ǯ����</span></td></tr> -->
						<!-- 				            	<tr><td><input type="radio" value="oPhotoWay" />��Ƭ���</td> -->
						<!-- 				            	<td><span style="font-size:12px">��������ṩ��Ҫ����Ƭ���ͣ��û��ϴ���Ƭ�����ڶ���ƽ̨������ˣ����ͨ���󼴿ɻ��Ǯ����</span></td></tr> -->
						<!-- 				            	<tr><td><input type="radio" value="o2Dimention" />��ά��У��</td> -->
						<!-- 				            	<td><span style="font-size:12px">��������ṩ��Ҫ�Ľ�����û�ɨ��󣬳����ж��Ƿ���Ͻ�������ϼ����Ǯ����</span></td></tr> -->
						<!-- 				            	</table> -->
					</div>
				</div>
				<div>
					<div class="form-actions" style="text-align:left;padding-left:28%;">
						<button id="oSaveButton" style="margin-right:5%" id="oSave" onclick="setStatus(0)">��ʱ����</button>
						<button id="oSubmitButton" style="margin-left:5%" id="oSubmit"
							onclick="setStatus(-1)">���沢�����ع�ƻ�</button>
							<span id="oSaveSpan" style="color:red"></span>
							<img src="images/mainpage/arrow.png"/>
							<span style="font-size:14px">�ع�ƻ�</span>
					</div>
				</div>
		</form>
	</div>
	
	<div id="imgDialog" title="Ԥ��">
		<div id="oIMGDiv"></div>
	</div>

	<div id="htcDialog" title="Ԥ��">
		<div id="oHTCDiv"></div>
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
		
		var adName = "<%=adName%>";
		
		 //�����ʽ
		var adStyle = "<%=adStyle%>";   
		adStyle = adStyle ? adStyle : 0;
		var status = -1;
		$(document).ready(function() {
			$('button').button();
				
			$("div#htcDialog").dialog({
				autoOpen : false,
				show : "blind",
				hide : "puff",
				resizable : false,
				height : 800,
				width : 400,
				modal : true         
			});
			
			var divobj = {
				"0" : [ $("#oVideoSelectDiv") ],
				"1" : [ $("#oImgSelectDiv") ],
				"2" : [ $("#oImgSelectDiv") ],
				"3" : [ $("#oProContentDiv"), $("#oAuthenticDiv") ]
			};

			//hiddenDiv();
			//hiddenDiv(divobj[0], "SHOW");
			//Ĭ��ѡ����Ƶ���

			hiddenDiv();
			if (divobj[adStyle])
				hiddenDiv(divobj[adStyle], "SHOW");

			invalid();
			var uploadurl = baseurl + "video/videoupload.do";
			$('#oVideoFile').uploadify({
				'uploader': 'assets/js/uploadify/uploadify.swf',
				'script': uploadurl,
				'cancelImg': 'assets/img/delete.gif',
				'auto'      : true,
				'uploadLimit':1,
				'wmode'          : 'transparent' , 
				'buttonText':escape("���ϴ���Ƶ"),
				fileDesc : '��ѡ��mp4�ļ�',
				fileExt :'*.mp4',
				removeCompleted:true,
				onComplete:function(event, queueID, fileObj, response, data)
				{
					var filetext = JSON.parse(response);
					
					//���ط����JSON����,���ڷ�����޸ķ�����������
					switch   ( filetext.errorCode )   {   
					case 0:
							var fileDesc = JSON.parse(filetext.rspDesc);
							$("#oVideoFileName").html("�ɹ��ϴ��ļ���<b>" + fileObj.name +"</b><br>");
							window.prompt("",$("#cutPicture")[0].setAdName(adName,baseurl));
							break ;
						default:
	          				$("#oVideoFileName").html("�ļ��ϴ�ʧ�ܣ��������ϴ���");
					}
				}
			});
			
			$('#oImgFile').uploadify({
				'uploader': 'assets/js/uploadify/uploadify.swf',
				'script': uploadurl,
				'cancelImg': 'assets/img/delete.gif',
				'auto'      : true,
				buttonText:escape("���ϴ�ͼƬ"),
				fileDesc : '��ѡ��jpg,png,jpeg�ļ�',
				fileExt :'*.jpg;*.png;*.jpeg',
				uploadLimit:1,
				removeCompleted:true,
				onComplete:function(event, queueID, fileObj, response, data)
				{
					var filetext = JSON.parse(response);
					//���ط����JSON����,���ڷ�����޸ķ�����������
					switch   ( filetext.errorCode )   {   
	        			case 0:
							$("#oImageFileName").html("�ɹ��ϴ��ļ���<strong>" + fileObj.name +"</strong><br>");
							break ;
						default:
	          				$("#oImageFileName").html("�ļ��ϴ�ʧ�ܣ��������ϴ���");
					}
				}
			});
		
			$("#oActivityDiv").hide();
			$("#oActivityContent").hide();
		});
		
		var invalid = function() {//.not(":disabled")
			$("input,select,textarea").not("[type=submit]")
					.jqBootstrapValidation({
						submitSuccess : function($form, event) {
							saveAdBasicPro();
						}
					});
		};

		var hiddenDiv = function(divarr, operate) {
			var array = [ $("#oVideoSelectDiv"), $("#oImgSelectDiv"),
					$("#oProContentDiv"), $("#oAuthenticDiv") ];
			if (divarr)
				array = divarr;

			for ( var i = 0; i < array.length; i++) {
				if (operate && operate == "SHOW")
					array[i].show();
				else
					array[i].hide();
			}
		};

		// 			 var setActivityContent = function()
		// 			 {
		//			 $("div#oActivityDiv")
		// 			 window.open("ckeditor/ckeditor.html","_modal");
		// 			 window.showModalDialog("ckeditor/ckeditor.jsp",window,"status=no;dialogHeight=550px;dialogWidth=800px;help=no;resizable=no;scroll=yes");
		// 			 	$("div#cutpictureDialog").dialog("open");
		// 			 };
		
		var setAdImg = function() {
		$("div#cutpictureDialog").dialog("open");
// 			window
// 					.showModalDialog(
// 							"cutPicture.jsp",
// 							window,
// 							"status=no;dialogHeight=600px;dialogWidth=800px;help=no;resizable=no;scroll=yes");
		};
		
		var setActivity = function(event) {
			if($("#oActivityDiv").is(":hidden")==true)
			{
				var content1 = $("#oActivityContent").html();
				if(content1 == "")
				{
					content1 = "<p>���ڴ˴��༭...</p>";
				}
				$("#oActivityDiv").show();
				$("#oActivityDiv").empty();
				CKEDITOR.appendTo('oActivityDiv', {
				width : 600,
				height : 200
				}, content1);
				$("#oActivityContent").hide();
			}
			else
			{
				$("#oActivityContent").show();
				var content2 = CKEDITOR.instances.editor1.getData();
				$("#oActivityDiv").hide();
				$("#oActivityContent").html(content2);
			}
			
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
						window.parent.changeOboxDivSrc("addetails/AdShowPlan.jsp");
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