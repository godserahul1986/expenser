<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String userId = (String) request.getSession().getAttribute("userId");
	String error = (String) request.getAttribute("error");
	String status = (String) request.getAttribute("status");
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Login | Expenser</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
	<%@ include file="/WEB-INF/content/common/header.jsp" %>

	<div id="mainContent">
		<h2>Login</h2>
		<p class="errorBox"><% if(error != null && !error.isEmpty()) { out.write(error); } %></p>
		<form method="post" action="authenticate.htm">
			<input type="text" name="username" value="rgodse" placeholder="Username/Email" required>
			<input type="password" name="password" value="abc123" placeholder="Password" required>
			<input type="submit" value="Login">
			<a href="#">Forgot password?</a>
		</form>

		<br /><br />

		 <h2>Register</h2>
         <p class="errorBox"><% if(status != null && !status.isEmpty()) { out.write(status); } %></p>
         <form method="post" action="register.htm">
             <input type="text" name="fullname" value="" placeholder="Full name" required>
             <input type="email" name="email" value="" placeholder="Email" required>
             <input type="text" name="username" value="" min=6 placeholder="Username" required>
             <input type="password" name="password" value="" placeholder="Password" required>
             <input type="submit" value="Register">
         </form>
	</div>

	<%@ include file="/WEB-INF/content/common/footer.jsp" %>
</body>
</html>