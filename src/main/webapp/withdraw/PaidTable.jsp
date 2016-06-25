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
<title>�ֻ������ֵ�б�</title>

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
				<td><span style="margin-right:10px">�ֻ�����</span>
				</td>
				<td><input type="text" id="oPhoneNumber" />
				</td>
				<td><span style="margin-right:10px;margin-left:20px">���״̬</span>
				</td>
				<td><select><option selected value="0">�����</option><option value="1">���ͨ��</option><option value="-1">��˾ܾ�</option><option value="2">��ֵ�ɹ�</option><option value="3">��ֵʧ��</option></select></td>
				<td><button style="margin-left:20px" onclick="searchActives()">��ѯ</button>
				</td>
			</tr>
		</table>
	</div>
	<div style="margin:auto;margion-top:10px">
		<table style="width:100%;font-weight:400;border:1px solid #DCDCDC;font-size:12px;">
			<thead style="border:1px solid #DCDCDC;height:30px">
				<tr>
					<th width="15%">�ֻ�����</th>
					<th width="15%">��������</th>
					<th width="10%">������</th>
					<th width="15%">����</th>
					<th width="10%">ʵ�ʽ��</th>
					<th width="37%">״̬</th>
					<th style="padding-left:15px"></th>
				</tr>
			</thead>
		</table>
	</div>
	<div
		style="height:400px;width:100%;margin:auto;margion-top:10px;overflow-y:scroll">
		<table id="oAdTable"
			style="width:100%;font-weight:400;border:1px;font-size:12px;"
			class="datastyle">
			<tbody>
				<tr>
					<td colspan="4" style="text-align:center">����ز�ѯ���ݡ�</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div style="text-align: center;border-top:1px solid #DCDCDC;padding-top:5px;">
		<table width="40%" style="text-align:center;font-size:12px;margin-left:30%;margin-right:30%">
			<tr>
				<td id="oRowCount" valign="middle" >����<span id="oRowCount"></span>��</td>
				<td id="oFirst" valign="middle"><div id="oFirstBtn" style="cursor:pointer;color:#0088cc" onclick="alert();pageRedirect('FIRST')">��ҳ</div></td>
				<td id="oPrev" valign="middle"><div style="cursor:pointer;color:#0088cc" id="oPrevBtn"  onclick="pageRedirect('PREVIOUS')">��һҳ</div></td>
				<td id="oNext" valign="middle"><div style="cursor:pointer;color:#0088cc" id="oNextBtn"  onclick="pageRedirect('NEXT')">��һҳ</div></td>
				<td id="oEnd" valign="middle"><div style="cursor:pointer;color:#0088cc" id="oEndBtn"  onclick="pageRedirect('END')">ĩҳ</div></td>
				<td valign="middle">���� <input name="oPages" type="number"  size="8" id="oPages" style="height:20px;width:60px">ҳ</td>
				<td valign="middle" id="oGoBtn"><div style="cursor:pointer;color:#0088cc" id="oGoBtn" onclick="pageRedirect('ASSIGN')">��ת</div></td>
			</tr>
		</table>
	</div>
	
	<div id="oActiveDetailDialog" title="���ϸ">
		<div id="oActiveDetailDiv"></div>
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
					$("button").button();
					
					$("div#oActiveDetailDialog").dialog({
	        			autoOpen:false,
	        			modal:true,
	        			show:"blind",
	        			hide:"puff",
	        			resizable:false,
	        			height:500,
	        			width:800,
						open:function(event,ui)
	        			{
	        				$("#oActiveDetailDiv").load("activedetails/ActiveDetail.jsp?activeId="+$(this).data("activeId"));	        			
	        			}
	        		});
					
				});

		var searchADs = function() {
			var _data = new Object();

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
					alertify.error("δ֪���������²�ѯ");
				}
			});
		};

		var jsonData = new Object(); 
		var pageCount = 50;   //ÿһҳҳ��
		var allCount = 0 ;  //������
		var currentPage = 0;  //����ҳ��
		var allPage = 0 ;     //��ҳ��
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
			if(operation == "FIRST")   //��ҳ
				currentPage = 0;
			else if (operation == "PREVIOUS") //��һҳ
				currentPage--;
			else if (operation == "NEXT")
				currentPage++;			
			else if (operation == "END")
				currentPage = allPage-1;
			else if (operation == "ASSIGN")
			{
				if($("#oPages").val() == "")
				{
					alertify.error("��������ȷ��ҳ��");
					return;
				}
				else if($("#oPages").val() > allPage || $("#oPages").val() < 0)
				{
					alertify.error("�������ҳ�벻�ڷ�Χ֮�ڣ�����������");
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
			$("#oAdTable tbody").empty(); //�������
			
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

				adTd = $("<td width='13%'><image src='assets/img/preview.gif' title='�鿴����' onclick='detailAd('"
						+ obj["adId"] + "')' /></td>"); //�鿴����
				adTr.append(adTd);
				adTd = $("<td width='13%'><image src='assets/img/pause.gif' title='��ͣ����ܱ༭' onclick='pauseAd('"
						+ obj["adId"]
						+ "',this)' /><image src='assets/img/edit.gif'  title='�༭' onclick='editAd('"
						+ obj["adId"] + "',this)' /></td>"); //��ͣ
				adTr.append(adTd);
				adTd = $("<td width='13%'><image src='assets/img/delete.gif' title='ʧЧ'  onclick='disabledAd('"
						+ obj["adId"] + "')' /></td>"); //��ͣ
				adTr.append(adTd);

				adTbody.append(adTr);
			}
		};

		var searchActives = function()
		{
        	$("div#oActiveDetailDialog").data("activeId","00").dialog("open");
		};

	</script>
</body>
</html>