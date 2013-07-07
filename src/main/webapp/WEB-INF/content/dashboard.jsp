<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/content/common/header.jsp"%>
<p>
	Welcome,
	<%
		out.write(userFullname);
	%>
</p>
<p>
	Email:
	<%
		out.write(userEmail);
	%>
</p>

<%@ include file="/WEB-INF/content/common/footer.jsp"%>
