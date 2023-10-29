package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Cliente;
import model.ClienteDAO;

@WebServlet("/ListarUsuarios")
public class ListarUsuariosAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListarUsuariosAdminServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		ClienteDAO cDao = new ClienteDAO();
		List<Cliente> clientes = cDao.getClientes();
		
		request.setAttribute("clientes", clientes);
	    RequestDispatcher dispatcher = request.getRequestDispatcher("/views/dashboard/ListaClientes.jsp");
		dispatcher.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
