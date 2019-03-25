package br.com.caelum.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import br.com.caelum.jdbc.dao.ContatoDao;
import br.com.caelum.jdbc.modelo.Contato;

public class ConnectionFactory {
	
	public Connection getConnection() {
		try {
	        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	        return DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=fj21;integratedSecurity=true;");
		}catch(SQLException | ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
	}
}
