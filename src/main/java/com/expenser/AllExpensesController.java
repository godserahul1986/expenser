package com.expenser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.expenser.common.Constants;
import com.expenser.dao.ExpensesDetail;
import com.expenser.db.Database;

/**
 * Servlet implementation class AllExpensesController
 */
public class AllExpensesController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yy");

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AllExpensesController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Long userId = (Long) request.getSession().getAttribute("userId");

		List<ExpensesDetail> expensesOwe = new ArrayList<ExpensesDetail>();
		List<ExpensesDetail> expensesGet = new ArrayList<ExpensesDetail>();

		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			connection = Database.getConnection();
			ps = connection.prepareStatement("SELECT ed.expense_id AS expense_id, e.expense_desc AS expense_desc, e.expense_date AS expense_date, "
					+ "ed.expense_share_amount AS share_amount, u.id AS paid_by, u.fullname AS fullname "
					+ "FROM expense e, expensedetail ed, user u WHERE e.id=ed.expense_id AND e.expense_by=u.id AND ed.expense_settle IS FALSE "
					+ "AND ed.expense_shared_by=? ORDER BY expense_date, fullname, share_amount");
			ps.setLong(1, userId);
			rs = ps.executeQuery();

			while (rs.next()) {
				ExpensesDetail ed = new ExpensesDetail();
				ed.setExpenseId(Integer.parseInt(rs.getString("expense_id")));
				ed.setExpenseDesc(rs.getString("expense_desc"));
				ed.setExpenseDate(dateFormat.format(rs.getTimestamp("expense_date")));
				ed.setExpenseShareAmount(Double.parseDouble(rs.getString("share_amount")));
				ed.setPaidByOrFor(Integer.parseInt(rs.getString("paid_by")));
				ed.setFullName(rs.getString("fullname"));
				expensesOwe.add(ed);
			}
			ps.close();
			rs.close();

			ps = connection.prepareStatement("SELECT e.id AS expense_id, e.expense_desc AS expense_desc, e.expense_date AS expense_date, "
					+ "ed.expense_share_amount AS share_amount, ed.expense_shared_by AS paid_for, u.fullname AS fullname "
					+ "FROM expense e, expensedetail ed, user u WHERE e.id=ed.expense_id AND ed.expense_shared_by=u.id AND ed.expense_settle IS FALSE "
					+ "AND e.expense_by=? ORDER BY expense_date, fullname, share_amount");
			ps.setLong(1, userId);
			rs = ps.executeQuery();

			while (rs.next()) {
				ExpensesDetail ed = new ExpensesDetail();
				ed.setExpenseId(Integer.parseInt(rs.getString("expense_id")));
				ed.setExpenseDesc(rs.getString("expense_desc"));
				ed.setExpenseDate(dateFormat.format(rs.getTimestamp("expense_date")));
				ed.setExpenseShareAmount(Double.parseDouble(rs.getString("share_amount")));
				ed.setPaidByOrFor(Integer.parseInt(rs.getString("paid_for")));
				ed.setFullName(rs.getString("fullname"));
				expensesGet.add(ed);
			}

			request.setAttribute("expensesOwe", expensesOwe);
			request.setAttribute("expensesGet", expensesGet);
			request.getRequestDispatcher(Constants.PATH_CONTENT + "/allexpenses.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
