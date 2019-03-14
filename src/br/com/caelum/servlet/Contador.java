package br.com.caelum.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/contador")
public class Contador extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 6535335667658042369L;
	private int contador = 0;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
		log("Iniciando a servlet");
		}
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		super.destroy();
		log("Destruindo a servlet");
	}
	

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		contador++;

		PrintWriter out = resp.getWriter();

		out.println("<html>");
		out.println("<body>");
		out.println("Contador agora é " + contador);
		out.println("</body>");
		out.println("</html>");
	}
}
