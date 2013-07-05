<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Login | Expenser</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
	<header>
		<h1>expen<span>$</span>er</h1>
		<nav>
			<ul>
				<li>Dashboard</li>
				<li>Add Expense</li>
				<li>All Expenses</li>
				<li>Add Friend</li>
				<li>Settings</li>
				<li>Help</li>
				<li>Log Out</li>
			</ul>
		</nav>
	</header>

	<div id="mainContent">
		<h2>Login</h2>
		<p id="messageBox"></p>
		<form method="post" action="authenticate.htm">
			<input type="text" name="username" value="rahul" placeholder="Username/Email" required>
			<input type="password" name="password" value="rahul" placeholder="Password" required>
			<% if(error != null && !error.isEmpty()) { %><br /><span style="color:red; font-size:12px;"><% out.write(error); %></span><% } %>
			<input type="submit" value="Login">
			<a href="#">Forgot password?</a><a href="#">New user?</a>
		</form>
	</div>

	<footer>
		<p>This project is a demo project made by <a href="#">Gaurav Jain</a> and <a href="#">Rahulkumar Godse</a></p>
	</footer>
</body>
</html>