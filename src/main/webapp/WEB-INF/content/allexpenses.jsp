<%@page import="com.expenser.dao.ExpensesDetail"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/content/common/header.jsp"%>

<div id="leftColumn">
	<h3><% out.write((userId != null)?"You":""); %> Owe To</h3>
	<p class="errorBox">
		<% if(error != null && !error.isEmpty()) { out.write(error); } %>
	</p>
	<table  id="expenseOwe">
		<tr>
			<th>What for?</th>
			<th>How much?</th>
			<th>Who Paid?</th>
			<th>Settled?</th>
		</tr>
		<%
			List<ExpensesDetail> expensesOwe = (ArrayList<ExpensesDetail>) request.getSession().getValue("expensesOwe");
			for (ExpensesDetail ed : expensesOwe) {
				out.write("<tr>");
				out.write("<td>"+ ed.getExpenseDesc() +"</td>");
				out.write("<td>"+ ed.getFullName() +"</td>");
				out.write("<td>"+ ed.getExpenseShareAmount() +"</td>");
				out.write("<input type='hidden' name='expense_id' value"+ ed.getExpenseId() +">");
				out.write("<input type='hidden' name='paid_by_for_id' value"+ ed.getPaidByOrFor() +">");
				out.write("<td><button>Settle</button></td>");
				out.write("</tr>");
			}
		%>

	</table>

</div>
<div id="rightColumn">
	<h3><% out.write((userId != null)?"You":""); %> Get From</h3>
	<p class="errorBox">
		<% if(error != null && !error.isEmpty()) { out.write(error); } %>
	</p>
	<table id="expenseGet">
		<tr>
			<th>What for?</th>
			<th>How much?</th>
			<th>Who Shared?</th>
			<th>Settled?</th>
		</tr>
		<%
			List<ExpensesDetail> expensesGet = (ArrayList<ExpensesDetail>) request.getSession().getValue("expensesGet");
			for (ExpensesDetail ed : expensesGet) {
				out.write("<tr>");
				out.write("<td>"+ ed.getExpenseDesc() +"</td>");
				out.write("<td>"+ ed.getFullName() +"</td>");
				out.write("<td>"+ ed.getExpenseShareAmount() +"</td>");
				out.write("<input type='hidden' name='expense_id' value"+ ed.getExpenseId() +">");
				out.write("<input type='hidden' name='paid_by_for_id' value"+ ed.getPaidByOrFor() +">");
				out.write("<td><button>Settle</button></td>");
				out.write("</tr>");
			}
		%>

	</table>

</div>

<%@ include file="/WEB-INF/content/common/footer.jsp"%>
