package br.com.caelum.jdbc.teste;

import java.sql.Connection;
import java.util.List;

import br.com.caelum.jdbc.ConnectionFactory;
import br.com.caelum.jdbc.dao.ContatoDao;
import br.com.caelum.jdbc.modelo.Contato;

public class TestaLista {

	public static void main(String[] args) {
		Connection connection = (new ConnectionFactory()).getConnection();
		ContatoDao dao = new ContatoDao(connection);
		List<Contato> contatos = dao.getLista();
		
		for(Contato contato : contatos) {
			System.out.println("Nome: " + contato.getNome());
			System.out.println("Email: " + contato.getEmail());
			System.out.println("Endereço: " + contato.getEndereco());
			System.out.println("Data de nascimento: " + contato.getDataNascimento().getTime() + "\n" );
		}
	}
}
