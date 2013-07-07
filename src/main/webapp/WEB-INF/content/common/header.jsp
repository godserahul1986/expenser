	<header>
		<h1>Expenser</h1>
		<nav>
			<ul>
				<% if(userId != null) { %>
				<li><a href="dashboard.htm">Dashboard</a></li>
				<li><a href="addexpense.htm">Add Expense</a></li>
				<li><a href="allexpenses.htm">All Expenses</a></li>
				<li><a href="addfriend.htm">Add Friend</a></li>
				<li><a href="settings.htm">Settings</a></li>
				<li><a href="logout.htm">Logout</a></li>
				<% } %>
			</ul>
		</nav>
	</header>
	<body>
		<div id="mainContent">