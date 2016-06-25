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
            <title>活动列表</title>
            
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            
            <!-- Le styles -->
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
            
        </head>
        <body data-spy="scroll" data-target=".bs-docs-sidebar" data-twttr-rendered="true" >
			
			<div id="oTabs" style="border:0px;position:relative;margin-top:20px;margin-left:10%;margin-right:10%;">
<!-- 				<div style="position:absolute; top:12px; right:30px;;cursor:pointer;border:1px solid #DCDCDC" onclick="addAds()" ><img src="assets/img/edit.gif" title="添加新广告"/><span style="margin-left:5px">添加新广告</span></div> -->
					<ul>
					    <li><a href="activedetails/ActivesTable.jsp?status=0">活动提交审核列表</a></li>
					    <li><a href="withdraw/PaidTable.jsp?status=1">手机充值审核列表</a></li>
					    <li><a href="withdraw/AlipayTable.jsp?status=2">支付宝提现审核列表</a></li>
					  </ul>
			</div>
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="assets/js/jquery-1.9.0.min.js" type="text/javascript"></script>
		<script src="assets/js/jquery-ui-1.10.0.custom.min.js" type="text/javascript"></script>
		<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="assets/js/alertify/alertify.min.js" type="text/javascript"></script>
		<script src="js/json2.js" type="text/javascript"></script>
		<script src="js/adcake.js" type="text/javascript"></script>
		
		<script  type="text/javascript">
		
			 var baseurl = "<%="http://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/"%>"; 

				 $(document).ready(function() {
					 
					 $("button").button();
					 var $tabs = $("#oTabs").tabs();
					 $tabs.tabs({selected:0});
						$tabs.tabs(
						{
							select:function(event,ui)
							{
								
							}
						});				 
				 });
				 
				 var addAds = function(event)
				 {
					 window.parent.changeOboxDivSrc("addetails/AdBasicProperties.jsp");
				 };
		</script>
	</body>
</html>