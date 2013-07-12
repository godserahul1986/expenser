<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/content/common/header.jsp"%>

<div id="leftColumn">
	<h3>Edit Profile</h3>
	<p class="errorBox">
		<% if(error != null && !error.isEmpty()) { out.write(error); } %>
	</p>
	<form id="editprofileform" method="post" action="editprofile.htm">
		<input type="text" name="fullname" value="<% out.write((userFullname != null)?userFullname:""); %>"
			placeholder="Full Name" required autofocus>
		<input type="email"	name="email" value="<% out.write((userEmail != null)?userEmail:""); %>" placeholder="Email id" required>
		<input type="submit" value="Save Profile" disabled>
	</form>

</div>
<div id="rightColumn">
	<h3>Change Password</h3>
	<p class="errorBox">
		<% if(error != null && !error.isEmpty()) { out.write(error); } %>
	</p>
	<form id="changepasswdform" method="post" action="changepassword.htm">
		<input type="password" name="currentpassword" value="" placeholder="Current password"
			required>
		<input id="newpassword" type="password" name="newpassword" value="" placeholder="New password"
			required>
		<input id="verifypassword" type="password" name="verifypassword" value="" placeholder="New Password Again"
			required>
		<input type="submit" value="Change Password">
	</form>
</div>

<%@ include file="/WEB-INF/content/common/footer.jsp"%>
