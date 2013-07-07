package com.expenser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.expenser.common.Constants;
import com.expenser.db.Database;

/**
 * Class UserRegister handles user registration
 *
 * @author gaurav
 */
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserRegister() {
		super();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		String sqlInsert = "INSERT INTO user(username,passwd,email,fullname) VALUES (?,?,?,?)";

		Connection connection = null;
		PreparedStatement ps = null;
		try {
			connection = Database.getConnection();
			ps = connection.prepareStatement(sqlInsert);
			ps.setString(1, username);
			ps.setString(2, password);
			ps.setString(3, email);
			ps.setString(4, fullname);
			int result = ps.executeUpdate();

			if (result > 0) {
				request.setAttribute("status", "Registration Successful!");
				request.getRequestDispatcher(Constants.PATH_CONTENT + "/login.jsp").forward(request, response);
			} else {
				request.setAttribute("status", "Error occurred, please try again.");
				request.getRequestDispatcher(Constants.PATH_CONTENT + "/login.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (connection != null)
					connection.close();
				if (ps != null)
					ps.close();
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
