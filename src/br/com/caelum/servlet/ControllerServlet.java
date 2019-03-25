package br.com.caelum.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.caelum.mvc.logica.Logica;

@WebServlet("/mvc")
public class ControllerServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String parametro = req.getParameter("logica");
		String nomeDaClasse = "br.com.caelum.mvc.logica." + parametro;
		try {
			Class classe = Class.forName(nomeDaClasse);
			Logica logica = (Logica) classe.newInstance();
			String pagina = logica.executa(req, resp);
			req.getRequestDispatcher(pagina).forward(req, resp);
		} catch (Exception e) {
			throw new ServletException("A l�gica de neg�cios causou uma exce��o");
		}
	}
}
