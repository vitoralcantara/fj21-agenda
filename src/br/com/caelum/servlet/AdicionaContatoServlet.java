package br.com.caelum.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.caelum.jdbc.dao.ContatoDao;
import br.com.caelum.jdbc.modelo.Contato;

@WebServlet("/adicionaContato")
public class AdicionaContatoServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 885926685202019945L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String nome = req.getParameter("nome");
		String endereco = req.getParameter("endereco");
		String email = req.getParameter("email");
		String dataEmTexto = req.getParameter("dataNascimento");
		Calendar dataNascimento = null;
		try {
			Date date = new SimpleDateFormat("dd/MM/yyyy").parse(dataEmTexto);
			dataNascimento = Calendar.getInstance();
			dataNascimento.setTime(date);
		} catch (ParseException e) {
			PrintWriter out = new PrintWriter(resp.getWriter());
			out.println("Erro de convers�o da data");
			return;
		}

		Contato contato = new Contato();
		contato.setNome(nome);
		contato.setEndere�o(endereco);
		contato.setEmail(email);
		contato.setDataNascimento(dataNascimento);
		Connection connection = (Connection)req.getAttribute("conexao");
		ContatoDao dao = new ContatoDao(connection);
		dao.adiciona(contato);
		RequestDispatcher rd = req.getRequestDispatcher("/contato-adicionado.jsp");
		rd.forward(req, resp);
	}
}
