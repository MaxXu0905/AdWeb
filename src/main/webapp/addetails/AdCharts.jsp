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
<title>往前推一年的点击转化对比</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="assets/css/alertify/alertify.core.css" />
<link rel="stylesheet" href="assets/css/alertify/alertify.default.css"
	id="toggleCSS" />
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
	
%>
<style type="text/css">
h3 {
	text-align: center;
}
</style>

<body data-spy="scroll" data-target=".bs-docs-sidebar"
	data-twttr-rendered="true">
	<div style="width:750px;">
		<h3 id="oTitle1">点击次数对比(最近一年)</h3>
		<canvas id="oCanvas1" height="450" width="750"></canvas>
	</div>

	<div style="width:750px;">
		<h3 id="oTitle2">转化次数对比(最近一年)</h3>
		<canvas id="oCanvas2" height="450" width="750"></canvas>
	</div>

	<div style="width:750px;">
		<h3 id="oTitle2">转化率对比(最近一年)</h3>
		<canvas id="oCanvas2" height="450" width="750"></canvas>
	</div>
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="assets/js/jquery-1.9.0.min.js" type="text/javascript"></script>
	<script src="assets/js/Chart.min.js" type="text/javascript"></script>
	<script src="js/json2.js" type="text/javascript"></script>
	<script src="assets/js/alertify/alertify.min.js" type="text/javascript"></script>

	<script type="text/javascript">
		var baseurl = "<%=baseUrl%>";
		var adId = "<%=adId%>";
		adId = adId ? adId : -1;

		$(document).ready(
				function() {

					var months = [ "01", "02", "03", "04", "05", "06", "07",
							"08", "09", "10", "11", "12" ];
					var date = new Date();
					var currentMonth = date.getMonth();
					var currentYear = date.getFullYear();

					var currentMonths = months.slice(0, currentMonth);
					var previousMonths = months.slice(currentMonth, 12);
					for ( var i = 0; i < currentMonths.length; i++)
						currentMonths[i] = currentYear + "年" + currentMonths[i]
								+ "月";

					for ( var i = 0; i < previousMonths.length; i++)
						previousMonths[i] = (currentYear - 1) + "年"
								+ previousMonths[i] + "月";

					var labels = new Array();
					var oTitleDate = "";
					if (previousMonths.length > 0)
					{
						oTitleDate = previousMonths[0] + "至" + currentMonths[currentMonths.length-1];
						labels = previousMonths.concat(currentMonths); 
					}
					else
					{
						oTitleDate =  currentYear+"年";
						labels = currentMonths;
					}
					$("#oTitle1").html(oTitleDate+$("#oTitle1").html());

					var lineChartData1 = {
						labels : labels,
						datasets : [
								{
									fillColor : "rgba(220,220,220,0.5)",
									strokeColor : "rgba(220,220,220,1)",
									pointColor : "rgba(220,220,220,1)",
									pointStrokeColor : "#fff",
									data : [ 65, 59, 90, 81, 56, 55, 40, 90,
											81, 56, 55, 40 ]
								},
								{
									fillColor : "rgba(151,187,205,0.5)",
									strokeColor : "rgba(151,187,205,1)",
									pointColor : "rgba(151,187,205,1)",
									pointStrokeColor : "#fff",
									data : [ 28, 48, 40, 19, 96, 27, 140, 40,
											19, 96, 27, 140 ]
								} ]
					};
					var myLine = new Chart(document.getElementById("oCanvas1")
							.getContext("2d")).Line(lineChartData1, {
						scaleOverlay : true,
						scaleShowLabels : true
					});

				});
	</script>
</body>
</html>