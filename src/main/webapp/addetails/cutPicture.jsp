<%@ page language="java" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=gbk"%>
<%
	String path = request.getContextPath();
	String basePath =  request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String url = "contextpath="+basePath;
%>
<base href="<%=basePath+"/addetails/"%>" />
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
			id="cutPicture" width="100%" height="100%"
			codebase="http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab">
			<param name="movie" value="cutPicuter.swf" />
			<param name="quality" value="high" />
			<param name="bgcolor" value="#869ca7" />
			<param name="allowScriptAccess" value="sameDomain" />
			<param name="allowFullScreen" value="true" />
			<param name="FlashVars" value="<%=url %>" />
			<embed src="cutPicuter.swf" quality="high" bgcolor="#869ca7"
				width="100%" height="100%" name="AddReportCompare" align="middle"
				play="true"
				loop="false"
				quality="high"
				allowScriptAccess="sameDomain"
   				allowFullScreen  ="true"
				type="application/x-shockwave-flash"
				pluginspage="http://www.adobe.com/go/getflashplayer"
				FlashVars ="<%=url %>">
			</embed>
</object>
