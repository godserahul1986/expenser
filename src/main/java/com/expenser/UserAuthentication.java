package com.expenser;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.expenser.common.Constants;

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

		if (username.equals("rahul") && password.equals("rahul")) {
			request.getSession().setAttribute("user", "Rahul");
			response.sendRedirect("home.htm");
		} else {
			request.setAttribute("error", "Unknown login, please try again.");
			request.getRequestDispatcher(Constants.PATH_CONTENT + "/login.jsp").forward(request, response);
		}
	}

}
