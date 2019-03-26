package br.com.caelum.jdbc.teste;

import java.sql.Connection;
import java.util.Calendar;

import br.com.caelum.jdbc.ConnectionFactory;
import br.com.caelum.jdbc.dao.ContatoDao;
import br.com.caelum.jdbc.modelo.Contato;

public class TestaInsere {
	
	public static void main(String[] args) {
		Contato contato = new Contato();
		contato.setNome("Caelum");
		contato.setEmail("contato@caelum.com.br");
		contato.setEndereço("R. Vergueiro 3185 cj57");
		contato.setDataNascimento(Calendar.getInstance());
		Connection connection = (new ConnectionFactory()).getConnection();
		ContatoDao dao = new ContatoDao(connection);
		dao.adiciona(contato);
		System.out.println("Gravado!");
	}
}
