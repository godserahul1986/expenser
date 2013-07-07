<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String userId = (String) request.getSession().getAttribute("userId");
	String userFullname = (String) request.getSession().getAttribute("userFullname");
	String userEmail = (String) request.getSession().getAttribute("userEmail");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><% out.write(userFullname); %> | Expenser</title>
</head>
<body>
	<%@ include file="/WEB-INF/content/common/header.jsp" %>
	<p>Hi! <% out.write(userFullname); %></p>
	<p>Email: <% out.write(userEmail); %></p>
	<%@ include file="/WEB-INF/content/common/footer.jsp" %>
</body>
</html>