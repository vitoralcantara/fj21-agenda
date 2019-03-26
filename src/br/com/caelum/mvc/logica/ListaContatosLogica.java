package br.com.caelum.mvc.logica;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.caelum.jdbc.dao.ContatoDao;
import br.com.caelum.jdbc.modelo.Contato;

public class ListaContatosLogica implements Logica {

	@Override
	public String executa(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		
		Connection connection = (Connection)req.getAttribute("conexao");
		List<Contato> contatos = new ContatoDao(connection).getLista();
		req.setAttribute("contatos",contatos);
		return "/WEB-INF/jsp/lista-contatos.jsp";
		
	}

}
