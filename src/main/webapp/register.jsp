<!DOCTYPE html>
<%@page import="com.ailk.jdbc.entity.InfoCust"%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="GBK"%>

        <html lang="en">
        <head>
            <meta charset="utf-8">
            <title>�ڶ�������ע��</title>
            
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            
            <!-- Le styles -->
            <link rel="shortcut icon" href="images/icon/favicon.ico"/>
            <link href="assets/css/bootstrap.min.css" rel="stylesheet">
            <link type="text/css" href="css/custom-theme/jquery-ui-1.10.0.custom.css" rel="stylesheet" />
           	<link rel="stylesheet" href="assets/css/alertify/alertify.core.css" />
			<link rel="stylesheet" href="assets/css/alertify/alertify.default.css" id="toggleCSS" />
          
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

        <body data-spy="scroll" data-target=".bs-docs-sidebar" data-twttr-rendered="true">
				<div class="row" style="padding-left:3%;height:90%;display:inline;font-size:12px" >
				    <div class="span8" style="border-right:1px solid #e5e5e5;" >
				      <form class="form-horizontal" id="oForm" method="post" novalidate>
				        <fieldset style="width:100%;">
				          <legend ><span style="font-size:14px;color:#B9484A;padding-left:3%;"><strong style="font-size:20px;color:#000">ע��</strong>(��������ʵ����Ϣ���Է�Ӱ����ˣ�лл��)</span></legend>
				          <div class="control-group">
				            <label class="control-label" for="focusedInput">������</label>
				            <div class="controls">
				              <input class="input-xlarge focused" id="oName" type="text" value="dddd" required data-validation-required-message="��������ʵ����">
				               <span  class="help-inline" style="color:red;">*</span>
				            </div>
				          </div>
				          <div class="control-group">
				            <label class="control-label" for="focusedInput">��ϵ�绰��</label>
				            <div class="controls">
				              <input class="input-xlarge focused" id="oTelephone" type="number" value="11111" required data-validation-number-message="��ϵ�绰����������">
				              <span  class="help-inline" style="color:red">*</span>
				            </div>
				          </div>
				          <div class="control-group">
				            <label class="control-label" for="focusedInput">�̶��绰��</label>
				            <div class="controls">
				              <input class="input-xlarge focused" id="oAreaCode" style="width:50px" type="number" value="111" maxlength="4" data-validation-number-message="�̶��绰����������">
				              <span>-</span>
				              <input class="input-xlarge focused" id="oPhone" style="width:120px" type="number" value="111"  maxlength="8" data-validation-number-message="�̶��绰����������">
				            </div>
				          </div>
				          <div class="control-group">
				            <label class="control-label" for="focusedInput">���䣺</label>
				            <div class="controls">
				              <input class="input-xlarge focused" id="oEmail" type="email" value="linmengya@sina.com"  required data-validation-required-message="��������ȷ��ʽ�����䡣�磺aaa@adlooker.com" data-validation-email-message="��������ȷ��ʽ�����䡣�磺aaa@adlooker.com"/>
				              <span  class="help-inline" style="color:red">*</span>
				              <span  class="help-inline" style="font-size:12px" id="oEmailSpan">���佫��Ϊ��¼�ʺ�ʹ��</span>
				            </div>
				          </div>
				          <div class="control-group">
				            <label class="control-label" for="focusedInput">���룺</label>
				            <div class="controls">
				              <input class="input-xlarge focused" id="oPassword" name="oPassword" type="password" required value="dddd11111" minlength="8" data-validation-minlength-message="���������8λ������" />
				              <!--  data-validation-regex-regex="/[a-zA-Z0-9~!@#$%^&*()_+]{n,m}/" data-validation-regex-message="�������������֡���д��ĸ��Сд��ĸ�Լ������ַ�������������" -->
				              <span  class="help-inline" style="color:red">*</span>
				              <span  class="help-inline" style="font-size:12px" id="oPasswordSpan"></span>
				            </div>
				          </div>
				          <div class="control-group">
				            <label class="control-label" for="focusedInput">ȷ�����룺</label>
				            <div class="controls">
				              <input class="input-xlarge focused" name="oPasswordAgain" type="password" required  value="dddd11111"  data-validation-required-message="���ٴ���������" minlength="6" data-validation-minlength-message="���������6λ������" data-validation-matches-match="oPassword" data-validation-matches-message="������ͬ������">

				             
				              <span  class="help-inline" style="color:red">*</span>
				              <span  class="help-inline" style="font-size:12px" id="oRepasswordSpan"></span>
				            </div>
				          </div>
				           <div class="control-group">
				            <label class="control-label" for="focusedInput">��˾���ƣ�</label>
				            <div class="controls">
				              <input class="input-xlarge focused" id="oCompanyName" type="text"  value="dddd">
				              <span  class="help-inline" style="color:red">*</span>
				              <span  class="help-inline" style="font-size:12px" id="oCompanyNameSpan"></span>
				            </div>
				          </div>
				          <div class="control-group">
				            <label class="control-label" for="focusedInput">��˾��ַ��</label>
				            <div class="controls">
				              <input class="input-xlarge focused" id="oCompanyAddress" type="text"  value="dddd">
				              <span  class="help-inline" style="color:red">*</span>
				              <span  class="help-inline" style="font-size:12px" id="oCompanyAddressSpan"></span>
				            </div>
				          </div>
				        </fieldset>
				        <div class="form-actions" style="text-align:left;padding-left:40%;background:#f58500;">
				         <button type="submit" class="btn btn-primary" style="height:80%;width:25%" >ע�Ტ��¼</button>  
				      	</div>
				      </form>
				    </div>
				  </div>
				  <div style="padding-left:30%;margin-top:10%;">
			            <h4 class="alert-heading">���ϸ��</h4>
			            <ul style="list-style-type: none;">
			            <li>
			             CPEչ�֣����Ϊ5Ԫ/ǧ�Σ�����0.1Ԫ����
			            <p style="color:#c0c0c0;font-size:12px;"><span>��CPEչ��Ϊ��</span></p>
			            </li>
			            <li>
			             CPEչ�֣����Ϊ5Ԫ/ǧ�Σ�����0.1Ԫ����
			            <p style="color:#c0c0c0;font-size:12px;"><span>��CPEչ��Ϊ��</span></p>
			            </li>
			            <li>
			             CPEչ�֣����Ϊ5Ԫ/ǧ�Σ�����0.1Ԫ����
			            <p style="color:#c0c0c0;font-size:12px;"><span>��CPEչ��Ϊ��</span></p>
			            </li>
			            </ul>
			        </div>
			        
			        <!-- Placed at the end of the document so the pages load faster -->
			        <script src="assets/js/jquery-1.9.0.min.js" type="text/javascript"></script>
					<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
					<script src="assets/js/jquery-ui-1.10.0.custom.min.js" type="text/javascript"></script>
					<script src="assets/js/jqBootstrapValidation.js" type="text/javascript"></script>
					<script src="assets/js/jquery.cookie.js" type="text/javascript"></script>
					<script src="js/md5.js" type="text/javascript"></script>
					<script src="js/json2.js" type="text/javascript"></script>
					<script src="js/adcake.js" type="text/javascript"></script>
					<script src="assets/js/alertify/alertify.min.js" type="text/javascript"></script>
			        <script  type="text/javascript">
			        	var baseurl = "<%="http://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/"%>";
			       		$(document).ready(function() { $("input,select,textarea").not("[type=submit]").jqBootstrapValidation({
			       			submitSuccess: function ($form, event) {
			       				register(event);
			       				event.preventDefault();
			       			}
			       		
			       		}); } );
			       		
			       		function register(event)
			       		{
			       			var _data = {
			       				'custName':$("#oCompanyName").val().trim(),
			       				'contact':$("#oName").val().trim(),
			       				'address':$("#oCompanyAddress").val().trim(),
			       				'phoneNo':$("#oTelephone").val().trim(),
			       				'telephoneNo':$("#oAreaCode").val().trim()+"-"+$("#oPhone").val().trim(),
			       				'email':$("#oEmail").val().trim(),
			       				'password':hex_md5($("#oPassword").val())
			       			};
			       			event.target.disabled = true;
			       			
			       			var form = $("#oForm");  
			        		$.ajax({  
			        		    url:baseurl+"cust/register.do",  
			        		    type:form.attr('method'),  
			        		    data:JSON.stringify(_data),  
			        		    dataType:"json", 
			        		    timeout:30000,
			        		    success:function(data){ 
			        		    
			        		    	$.cookie("username",$("#oEmail").val().trim(),{ path: "/" });
			        		   		$.cookie("telephone",$("#oTelephone").val().trim(),{ path: "/" });
			        		    
			        		    	adcakehref(data,event,"mainpage.jsp");
			        		    	event.target.disabled = false;
			        		    },  
			        		    error:function(){
			        		    	alertify.alert('δ֪����������ע��');
			        		    	event.target.disabled = false;
			        		    }  
			        		});
			       		}
			       		
			       		var reset = function () {
			    			alertify.set({
			    				labels : {
			    					ok     : "OK",
			    					cancel : "Cancel"
			    				},
			    				delay : 5000,
			    				buttonReverse : false,
			    				buttonFocus   : "ok"
			    			});
			    		};
			    		
			        </script>
			        
		
		
		
</body>
</html>