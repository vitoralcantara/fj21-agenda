package br.com.caelum.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import br.com.caelum.jdbc.dao.ContatoDao;
import br.com.caelum.jdbc.modelo.Contato;

public class ConnectionFactory {
	
	public Connection getConnection() {
		try {
			Class.forName("org.sqlite.JDBC");
			return DriverManager.getConnection("jdbc:sqlite:C:\\Users\\Vítor\\eclipse-workspace\\fj21-agenda\\WebContent\\WEB-INF\\db\\fj21.db");
		}catch(SQLException | ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
	}
	
	public static void main(String[] args) {
		Connection c = new ConnectionFactory().getConnection();
		ContatoDao cd = new ContatoDao();
		cd.adiciona(new Contato());
	}
}
