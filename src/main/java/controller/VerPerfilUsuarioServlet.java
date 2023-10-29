package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Cliente;
import model.ClienteDAO;

@WebServlet("/VerPerfilUsuario")
public class VerPerfilUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	public VerPerfilUsuarioServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int idCliente = Integer.parseInt(request.getParameter("idCliente"));
		
		ClienteDAO cDao = new ClienteDAO();
	    
	    List<Cliente> cliente = cDao.getClienteById(idCliente);
	    
	    request.setAttribute("cliente", cliente);
	    
	    request.getRequestDispatcher("./views/dashboard/AtualizarCliente.jsp").forward(request, response);
	
	}


}
