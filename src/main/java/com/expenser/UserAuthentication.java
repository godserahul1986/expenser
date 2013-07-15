package com.expenser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.expenser.common.Constants;
import com.expenser.db.Database;

/**
 * Class UserAuthentication handles username/password authentication
 *
 * @author gaurav
 */
public class UserAuthentication extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserAuthentication() {
		super();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			connection = Database.getConnection();
			ps = connection.prepareStatement("SELECT * FROM user WHERE username = ?");
			ps.setString(1, username);
			rs = ps.executeQuery();

			while (rs.next()) {
				if (rs.getString("username").equals(username) && rs.getString("passwd").equals(password)) {
					request.getSession().setAttribute("userId", rs.getLong("id"));
					request.getSession().setAttribute("username", rs.getString("username"));
					request.getSession().setAttribute("userEmail", rs.getString("email"));
					request.getSession().setAttribute("userFullname", rs.getString("fullname"));
					response.sendRedirect("dashboard.htm");
				} else {
					request.setAttribute("error", "Unknown login, please try again.");
					request.getRequestDispatcher(Constants.PATH_CONTENT + "/login.jsp").forward(request, response);
				}
			}
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
