<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%>
<%
	String baseUrl = "http://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<base href="<%=baseUrl%>" />
        <html lang="en">
        <head>
            <meta charset="utf-8">
            <title>�ڶ���</title>
            
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            
            <!-- Le styles -->
            <link rel="shortcut icon" href="images/icon/favicon.ico"/>
            <link href="assets/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="assets/css/alertify/alertify.core.css" />
			<link rel="stylesheet" href="assets/css/alertify/alertify.default.css" id="toggleCSS" />
            <link type="text/css" href="css/custom-theme/jquery-ui.css" rel="stylesheet" />
            <link type="text/css" href="assets/css/font-awesome.min.css" rel="stylesheet" />
           
          
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
            <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
            <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
            <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
            <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
        </head>

        <body data-spy="scroll" data-target=".bs-docs-sidebar" data-twttr-rendered="true">
		<div id="loginDialog" style="width:500px;margin:auto;margin-top:100px;border:1px solid #DCDCDC">
       	 <form id="dialogForm" method="post" action="cust/login.do">  
	         	<ul style="margin-top:10px;list-style-type: none;">
		        	 <li  style="float:right;display:inline;"><a class="button" onclick="register()">�����ǻ�Ա��ע��ɣ�</a></li>
	        	 </ul>
	        	 <div style="clear:both"></div>
	        	 <ul style="margin-top:35px;list-style-type: none;">
		        	 <li style="float:left;display:inline;">
		        	 	<span>�������䣺</span> 
		        	 </li>
		        	 <li style="float:left;display:inline;">
		        	 	<div id="oEmailDiv">
		        	 		<input type="text" id="oEmail" placeholder="��������������/�ֻ�����"  required data-validation-required-message="������������������ֻ�����">
<!--                   			<input id="oEmail" title="����ֱ����Ϊ�û���ʹ��" /> -->
		        	 	</div>
	        		 </li>
	        	 </ul>
	        	 <div style="clear:both"></div>
	        	 <ul style="list-style-type: none;margin-top:5px">
		        	 <li style="float:left;">
		        	 	<span>�������룺</span> 
		        	 </li>
		        	 <li style="float:left;">
	        	 		<div id="oPasswordDiv">
	        	 			<input type="password" id="oPassword" placeholder="��������������" required data-validation-required-message="��������������">
<!--                   			<input id="oPassword" title="Ϊ�˱������İ�ȫ�������������д��ĸ��Сд��ĸ�Լ����ֵ����룬лл��" /> -->
		        	 	</div>
	        	 	</li>
	        	 </ul>
	        	 <ul style="list-style-type: none;">
	        	 <li><a style="padding-left:10px">�������룿</a></li>
	        	 </ul>      
        	 </form>  	 
        	 <div  style="background:#f58500;text-align:center;height:40px;margin-top:50px">
				 <button type="submit" class="btn btn-primary" style="margin:auto;width:60;height:40px" onclick="login(event)">��¼</button>  
			 </div>
        </div>
        
        <div id="otherWindow"  >
        <div id="otherWindowUrl" style="width:100%;height:83%"></div>
        <div style="margin-top:2%" id="otherWindowAcceptDiv">
			<ul>
				<li style="list-style-type: none;float:left">
				<label>
					<input type="checkbox" value="accept" name="acceptRadioGroup"/> ���ؿ���Э��</label>
				</li>
				<li style="list-style-type: none;">
					<div style="margin-left:15%;width:50%;background:#F2DEDE" id="acceptAlert" >
		                  <div style="color:#B9484A">
		                    <p><span style="float: left; margin-right: .3em;"></span>
		                    <strong>����:</strong> <span id="loginDialogAlertString">����ע��ǰ�����Ķ�����Э�鲢���ܡ�</span></p>
		                  </div>
		             </div>
				</li>
			</ul>
		</div>
        </div>
        
       
       <!-- Placed at the end of the document so the pages load faster -->
		<script src="assets/js/jquery-1.9.0.min.js" type="text/javascript"></script>
		<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="assets/js/jquery-ui-1.10.0.custom.min.js" type="text/javascript"></script>
		<script src="assets/js/jqBootstrapValidation.js" type="text/javascript"></script>
		<script src="js/md5.js" type="text/javascript"></script>
		<script src="js/json2.js" type="text/javascript"></script>
		<script src="js/adcake.js" type="text/javascript"></script>
		<script src="assets/js/alertify/alertify.min.js" type="text/javascript"></script>
        <script type="text/javascript">

			var baseurl = "<%=baseUrl%>";
        	$(document).ready(function()
        	{
        		$("input,select,textarea").not("[type=submit]").jqBootstrapValidation(); 
        		
        		//��������
        		$("div#otherWindow").dialog({
        			autoOpen:false,
        			modal:true,
        			show:"blind",
        			hide:"puff",
        			resizable:false,
        			height:500,
        			width:800,
        			open:function(event,ui)
        			{
        				if($(this).data("operation")=="register")
        				{
        					$("#otherWindowUrl").load("authentic.jsp");
        					$("#otherWindowAcceptDiv").show();
        					
        					$('input:checkbox[name="acceptRadioGroup"]').click(function(event)
                			{
        						var accept = $('input:checkbox[name="acceptRadioGroup"]:checked').val();
        						if(accept)
        							$("#acceptAlert").hide(200);
                				$(this).data("accept",accept);			
                			});
        				}
        				else
        				{
        					$("#otherWindowUrl").load("question.jsp");
        					$("#otherWindowAcceptDiv").hide();
        				}
        			}
        		});
        		$("#acceptAlert").hide();
        	});
        	
        	
        	function login(event)
        	{
        		var form = $("#dialogForm");  
        		var _email = $("#oEmail").val().trim();
        		var _password = $("#oPassword").val();
        		var _data={name:_email,password:hex_md5(_password)};
        		
        		var form = $("#dialogForm");  
        		$.ajax({  
        		    url:baseurl+form.attr('action'),  
        		    type:"POST",  
        		    data:JSON.stringify(_data),  
        		    async:false,
        		    dataType:"json", 
        		    success:function(data){ 
        		    	adcakehref(data,event,"mainpage.jsp?pagetype=ADLIST");
        		    },  
        		    error:function(){  
        		    	alertify.alert('δ֪����');
        		    }  
        		});
        		
        	}
        	
        	function register()
        	{
        		$("div#otherWindow").dialog(
        				{
        					buttons:
        					{
        						"������֤":function()
    	    					   {
        							var accept = $('input:checkbox[name="acceptRadioGroup"]:checked').val();
        							if(accept == "accept" )
    	    					   		window.open("register.jsp");
        							else
        								$("#acceptAlert").show(100);
    	    					   },
        					    "ȡ��":function()
        					    {
        					    	$("div#otherWindow").dialog("close");
        					    }
        				   },
        				   title:"������֤"
        				});
        				$("div#otherWindow").data("operation","register").dialog("open");
        	}
        	
        </script>
	</body>
</html>