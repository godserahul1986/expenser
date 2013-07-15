<%@page import="com.expenser.dao.ExpensesDetail"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/content/common/header.jsp"%>

<div id="leftColumn">
	<h3>You Owe &#36;<% out.write((String)request.getAttribute("amountOwe")); %></h3>
	<p class="errorBox">
		<% if(error != null && !error.isEmpty()) { out.write(error); } %>
	</p>
	<table id="expenseOwe">
		<tr>
			<th>To?</th>
			<th>Amount?</th>
			<th>Settle</th>
		</tr>
		<%
			List<ExpensesDetail> expensesOwe = (ArrayList<ExpensesDetail>) request.getAttribute("expensesOwe");
			for (ExpensesDetail ed : expensesOwe) {
				out.write("<tr>");
				out.write("<td>"+ ed.getFullName() +"</td>");
				out.write("<td>&#36;"+ ed.getExpenseShareAmount() +"</td>");
				out.write("<input type='hidden' name='paid_by_for_id' value"+ ed.getPaidByOrFor() +">");
				out.write("<td><button>Settle</button></td>");
				out.write("</tr>");
			}
		%>

	</table>

</div>
<div id="rightColumn">
	<h3>You Get &#36;<% out.write((String)request.getAttribute("amountOwe")); %></h3>
	<p class="errorBox">
		<% if(error != null && !error.isEmpty()) { out.write(error); } %>
	</p>
	<table id="expenseGet">
		<tr>
			<th>From?</th>
			<th>Amount?</th>
			<th>Settle</th>
		</tr>
		<%
			List<ExpensesDetail> expensesGet = (ArrayList<ExpensesDetail>) request.getAttribute("expensesGet");
			for (ExpensesDetail ed : expensesGet) {
				out.write("<tr>");
				out.write("<td>"+ ed.getFullName() +"</td>");
				out.write("<td>&#36;"+ ed.getExpenseShareAmount() +"</td>");
				out.write("<input type='hidden' name='paid_by_for_id' value"+ ed.getPaidByOrFor() +">");
				out.write("<td><button>Settle</button></td>");
				out.write("</tr>");
			}
		%>

	</table>

</div>

<%@ include file="/WEB-INF/content/common/footer.jsp"%>
