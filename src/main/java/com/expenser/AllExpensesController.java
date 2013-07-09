package com.expenser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
		String userId = (String) request.getSession().getAttribute("userId");

		List<ExpensesDetail> expensesOwe = new ArrayList<ExpensesDetail>();
		List<ExpensesDetail> expensesGet = new ArrayList<ExpensesDetail>();

		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			connection = Database.getConnection();
			ps = connection.prepareStatement("select ed.expense_id expense_id,e.expense_desc expense_desc,ed.expense_share_amount share_amount,u.id paid_by,"
					+ "u.fullname fullname from expense e, expensedetail ed,user u where e.id=ed.expense_id and e.expense_by=u.id and ed.expense_shared_by="
					+ userId + ";");
			rs = ps.executeQuery();

			while (rs.next()) {
				ExpensesDetail ed = new ExpensesDetail();
				ed.setExpenseId(Integer.parseInt(rs.getString("expense_id")));
				ed.setExpenseDesc(rs.getString("expense_desc"));
				ed.setExpenseShareAmount(Double.parseDouble(rs.getString("share_amount")));
				ed.setPaidByOrFor(Integer.parseInt(rs.getString("paid_by")));
				ed.setFullName(rs.getString("fullname"));
				expensesOwe.add(ed);
			}

			ps.close();
			rs.close();

			request.getSession().setAttribute("expensesOwe", expensesOwe);

			ps = connection.prepareStatement("select e.id expense_id,e.expense_desc expense_desc,ed.expense_share_amount share_amount,ed.expense_shared_by "
					+ "paid_for,u.fullname fullname from expense e, expensedetail ed,user u where e.id=ed.expense_id and ed.expense_shared_by=u.id and "
					+ "e.expense_by=" + userId + ";");
			rs = ps.executeQuery();

			while (rs.next()) {
				ExpensesDetail ed = new ExpensesDetail();
				ed.setExpenseId(Integer.parseInt(rs.getString("expense_id")));
				ed.setExpenseDesc(rs.getString("expense_desc"));
				ed.setExpenseShareAmount(Double.parseDouble(rs.getString("share_amount")));
				ed.setPaidByOrFor(Integer.parseInt(rs.getString("paid_for")));
				ed.setFullName(rs.getString("fullname"));
				expensesGet.add(ed);
			}

			request.getSession().setAttribute("expensesGet", expensesGet);

			request.getRequestDispatcher(Constants.PATH_CONTENT + "/allexpenses.jsp").forward(request, response);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (connection != null)
					connection.close();
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
