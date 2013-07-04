<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String user = (String) request.getSession().getAttribute("user");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><% out.write(user); %> | Expenser</title>
</head>
<body>
	<jsp:include page="/WEB-INF/content/common/header.jsp"/>
	<p>Hi! <% out.write(user); %></p>
	<p>[home body]</p>
	<jsp:include page="/WEB-INF/content/common/footer.jsp"/>
</body>
</html>