<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String userId = (String) request.getSession().getAttribute("userId");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>
		Add Expense | Expenser
	</title>
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
	<%@ include file="/WEB-INF/content/common/header.jsp"%>

	<%
		HashMap<Integer,String> userList = (HashMap<Integer,String>) request.getSession().getAttribute("users");
		for(Integer key:userList.keySet()){
			out.write(key + ":" + userList.get(key) + "<br/>");
		}
	%>


	<%@ include file="/WEB-INF/content/common/footer.jsp"%>
