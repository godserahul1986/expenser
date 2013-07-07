package com.expenser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.expenser.common.Constants;
import com.expenser.db.Database;

/**
 * Servlet implementation class AddExpense
 */
public class AddExpenseController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddExpenseController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HashMap<Integer, String> users = new HashMap<Integer, String>();

		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			connection = Database.getConnection();
			ps = connection.prepareStatement("SELECT * FROM user");
			rs = ps.executeQuery();

			while (rs.next()) {
				users.put(Integer.parseInt(rs.getString("id")), rs.getString("username"));
			}

			request.getSession().setAttribute("users", users);
			request.getRequestDispatcher(Constants.PATH_CONTENT + "/addexpense.jsp").forward(request, response);

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
