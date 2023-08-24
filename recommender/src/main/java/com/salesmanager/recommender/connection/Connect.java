package com.salesmanager.recommender.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connect {
	private static Connect instance;
	private static Connection connection;

	private Connect() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/viecsinhvien3";
			String username = "root";
			String pass = "1234";
			connection = DriverManager.getConnection(url, username, pass);
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		} catch (SQLException e) {
			// TODO: handle exception
		}
	}

	public static Connect getInstance() {
		if (instance == null)
			instance = new Connect();
		return instance;
	}

	public Connection getConnection() {
		return connection;
	}
}
