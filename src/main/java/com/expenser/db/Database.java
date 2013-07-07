package com.expenser.db;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 * Class handles the database connection
 *
 * @author gaurav
 *
 */
public class Database {

	public static Connection getConnection() {
		Connection connection = null;
		try {
			InitialContext ic = new InitialContext();
			Context xmlContext = (Context) ic.lookup("java:comp/env");
			DataSource dataSource = (DataSource) xmlContext.lookup("jdbc/MysqlDS");
			connection = dataSource.getConnection();

			// old school style
			//Class.forName("com.mysql.jdbc.Driver");
			//connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/expenser", "expenser", "exp3ns3r");
		} catch (SQLException e) {
			System.err.println("Database connection error (SQLException), " + e.getMessage());
		} catch (NamingException e) {
			System.err.println("Database connection error (NamingException), " + e.getMessage());
		}

		return connection;
	}

}
