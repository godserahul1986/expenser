<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login | Expenser</title>
</head>
<body>
	<div class="login">
		<h1>Login to Expenser</h1>
		<form method="post" action="authenticate.htm">
			<p>
				<input type="text" name="username" value="rahul" placeholder="Username or Email"><br />
				<input type="password" name="password" value="rahul" placeholder="Password">
				<% if(error != null && !error.isEmpty()) { %><br /><span style="color:red; font-size:12px;"><% out.write(error); %></span><% } %>
			</p>
			<p class="remember_me">
				<label> <input type="checkbox" name="remember_me" id="remember_me"> Remember me on this computer
				</label>
			</p>
			<p class="submit">
				<input type="submit" name="commit" value="Login">
			</p>
		</form>
	</div>

	<div class="login-help">
		<p>
			Forgot your password? <a href="login.htm">Click here to reset it</a>.
		</p>
	</div>
