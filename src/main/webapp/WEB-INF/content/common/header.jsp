<%
	String userId = (String) request.getSession().getAttribute("userId");
	String userFullname = (String) request.getSession().getAttribute("userFullname");
	String userEmail = (String) request.getSession().getAttribute("userEmail");
	String error = (String) request.getAttribute("error");
	String status = (String) request.getAttribute("status");
%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>
			<%
				out.write(userFullname);
			%> | Expenser
		</title>
		<link rel="stylesheet" type="text/css" href="css/reset.css">
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>
	<header>
		<h1>Expenser</h1>
		<% if(userId != null) { %>
		<a href="logout.htm">Logout</a>
		<% } %>
		<nav>
			<ul>
				<li><a href="home.htm">Home</a></li>
				<% if(userId != null) { %>
				<li><a href="dashboard.htm">Dashboard</a></li>
				<li><a href="addexpense.htm">Add Expense</a></li>
				<li><a href="allexpenses.htm">All Expenses</a></li>
				<li><a href="addfriend.htm">Add Friend</a></li>
				<li><a href="settings.htm">Settings</a></li>
				<% } %>
			</ul>
		</nav>
	</header>
	<body>
		<div id="mainContent">