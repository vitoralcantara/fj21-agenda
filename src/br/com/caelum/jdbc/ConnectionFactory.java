package br.com.caelum.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
	
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection("jdbc:mysql://localhost:3306/fj21?useTimezone=true&serverTimezone=UTC","root","");
		}catch(SQLException | ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
	}
}
