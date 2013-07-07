package com.expenser.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

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
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/expenser", "expenser", "exp3ns3r");
		} catch (ClassNotFoundException e) {
			System.err.println("Database connection exception, " + e.getMessage());
		} catch (SQLException e) {
			System.err.println("Database connection exception, " + e.getMessage());
		}

		return connection;
	}

}
