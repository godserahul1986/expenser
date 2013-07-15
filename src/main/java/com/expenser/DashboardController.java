package com.expenser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
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
 * Class HomeController displays the user's home page
 *
 * @author gaurav
 */
public class DashboardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final DecimalFormat decimalFormat = new DecimalFormat("#,###,##0.00");

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DashboardController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Long userId = (Long) request.getSession().getAttribute("userId");

		Double amountOwe = 0d, amountGet = 0d;
		List<ExpensesDetail> expensesOwe = new ArrayList<ExpensesDetail>();
		List<ExpensesDetail> expensesGet = new ArrayList<ExpensesDetail>();

		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			connection = Database.getConnection();
			ps = connection.prepareStatement("SELECT * FROM (SELECT u.id AS paid_by, u.fullname AS fullname, sum(ed.expense_share_amount) AS amount "
					+ "FROM expense e, expensedetail ed, user u WHERE e.id=ed.expense_id AND e.expense_by=u.id AND ed.expense_settle IS FALSE "
					+ "AND ed.expense_shared_by=? GROUP BY paid_by WITH ROLLUP) x ORDER BY x.paid_by IS NULL DESC, x.fullname");
			ps.setLong(1, userId);
			rs = ps.executeQuery();

			if (rs.next()) {
				amountOwe = rs.getDouble("amount");

				while (rs.next()) {
					ExpensesDetail ed = new ExpensesDetail();
					ed.setPaidByOrFor(Integer.parseInt(rs.getString("paid_by")));
					ed.setFullName(rs.getString("fullname"));
					ed.setExpenseShareAmount(Double.parseDouble(rs.getString("amount")));
					expensesOwe.add(ed);
				}
			}

			ps.close();
			rs.close();

			ps = connection.prepareStatement("SELECT * FROM (SELECT u.id AS paid_by, u.fullname AS fullname, sum(ed.expense_share_amount) AS amount "
					+ "FROM expense e, expensedetail ed, user u WHERE e.id=ed.expense_id AND ed.expense_shared_by=u.id AND ed.expense_settle IS FALSE "
					+ "AND e.expense_by=? GROUP BY paid_by WITH ROLLUP) x ORDER BY x.paid_by IS NULL DESC, x.fullname");
			ps.setLong(1, userId);
			rs = ps.executeQuery();

			if (rs.next()) {
				amountGet = rs.getDouble("amount");

				while (rs.next()) {
					ExpensesDetail ed = new ExpensesDetail();
					ed.setPaidByOrFor(Integer.parseInt(rs.getString("paid_by")));
					ed.setFullName(rs.getString("fullname"));
					ed.setExpenseShareAmount(Double.parseDouble(rs.getString("amount")));
					expensesGet.add(ed);
				}
			}

			request.setAttribute("amountOwe", decimalFormat.format(amountOwe));
			request.setAttribute("amountGet", decimalFormat.format(amountGet));
			request.setAttribute("expensesOwe", expensesOwe);
			request.setAttribute("expensesGet", expensesGet);
			request.getRequestDispatcher(Constants.PATH_CONTENT + "/dashboard.jsp").forward(request, response);
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
