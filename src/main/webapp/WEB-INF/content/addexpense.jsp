<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/content/common/header.jsp"%>

<%
	HashMap<Integer, String> userList = (HashMap<Integer, String>) request.getSession().getAttribute("users");
	for (Integer key : userList.keySet()) {
		out.write(key + ":" + userList.get(key) + "<br/>");
	}
%>


<%@ include file="/WEB-INF/content/common/footer.jsp"%>
