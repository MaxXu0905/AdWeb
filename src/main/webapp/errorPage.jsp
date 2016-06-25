<%@page import="com.ailk.api.impl.BaseResponse"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>馅儿饼错误页面</title>
<%
	BaseResponse resp = (BaseResponse)request.getAttribute("baseReponse");
%>
</head>
<body>
	<input type="text" id="oError" value="<%=resp.getErrorDesc() + resp.getErrorCode() %>"/>
</body>
</html>