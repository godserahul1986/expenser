<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/content/common/header.jsp"%>

<div id="leftColumn">
	<h3>Login</h3>
	<p class="errorBox">
		<% if(error != null && !error.isEmpty()) { out.write(error); } %>
	</p>
	<form method="post" action="authenticate.htm">
		<input type="text" name="username" value="rgodse"
			placeholder="Username/Email" required> <input type="password"
			name="password" value="abc123" placeholder="Password" required>
		<input type="submit" value="Login"> <a href="#">Forgot
			password?</a>
	</form>

	<form method="post" action="dashboard.html">
		<input id="verifyemail" type="verifyemail" name="userEmail" value=""
			placeholder="Verify Email" required style="display: none;">
	</form>
</div>
<div id="rightColumn">
	<h3>Register</h3>
	<p class="errorBox">
		<% if(error != null && !error.isEmpty()) { out.write(error); } %>
	</p>
	<form method="post" action="register.htm">
		<input type="text" name="fullname" value="" placeholder="Full name"
			required> <input type="email" name="email" value=""
			placeholder="Email" required> <input type="text"
			name="username" value="" min=6 placeholder="Username" required>
		<input type="password" name="password" value="" placeholder="Password"
			required> <input type="submit" value="Register">
	</form>
</div>

<%@ include file="/WEB-INF/content/common/footer.jsp"%>
