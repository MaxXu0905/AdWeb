<!DOCTYPE html>
<!--
Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.md or http://ckeditor.com/license
-->
<html>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%>
<%
	String baseUrl = "http://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>

<base href="<%=baseUrl+"ckeditor/"%>" />

<head>
	<title>设置活动内容</title>
	<meta charset="utf-8">
	
	 <link rel="stylesheet" href="<%=baseUrl+"assets/css/alertify/alertify.core.css"%>" />
	 <link rel="stylesheet" href="<%=baseUrl+"assets/css/alertify/alertify.default.css"%>" />
	<script src="<%=baseUrl+"assets/js/jquery-1.9.0.min.js"%>" type="text/javascript"></script>
	<script src="<%=baseUrl+"ckeditor/ckeditor.js"%>"></script>
	<script src="<%=baseUrl+"js/adcake.js"%>"></script>
	<script src="<%=baseUrl+"assets/js/alertify/alertify.min.js"%>" type="text/javascript"></script>
</head>
<body>
	<form>
	<div id="section1" style="margin:auto">
		
		</div>
		<div style="width:100%;text-align:center;height:30px;padding-top:10px">
		<input type="button" id="oSubmit" onclick="submitHtml()" value="确认" style="margin-right:10px" />
		<input type="button" id="oReset" onclick="window.dialogArguments.hideAcitivityContent('ddd')"value="取消"/>
		</div>
		<script>

			// This call can be placed at any point after the
			// <textarea>, or inside a <head><script> in a
			// window.onload event handler.

			// Replace the <textarea id="editor"> with an CKEditor
			// instance, using default configurations.
			
			
				CKEDITOR.appendTo( 'section1',
				{
					width:798,
					height:420
				},
				'<p>请在此处编辑...</p>'
				);
			
			var editor1 = window.CKEDITOR.instances.editor1;
			 var baseurl = "<%=baseUrl%>"; 
						
			function submitHtml()
			{
				var editorValue = CKEDITOR.instances.editor1.getData();
				$.ajax({  
	        		    url:baseurl+"html/htmlupload.do",  
	        		    type:"POST",  
	        		    data: encodeURI(editorValue),  
	        		    dataType:"json", 
	        		    success:function(data){ 
	        		    	adcakehref(data,event,"","error");
							window.close();	        		    	
	        		    },  
	        		    error:function(){  
	        		    	alertify.alert('设置活动内容失败：未知错误，请重新尝试！');
	        		    }  
	        		});
			}
		</script>
	</form>
</body>
</html>
