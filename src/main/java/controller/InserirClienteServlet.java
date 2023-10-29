package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Cliente;
import model.ClienteDAO;

@WebServlet("/InserirCliente")
public class InserirClienteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String nome = request.getParameter("nome");
	    String email = request.getParameter("email");
	    String senha = request.getParameter("senha");
	    
	    Cliente objCliente = new Cliente();
	    objCliente.setNome(nome);
	    objCliente.setEmail(email);
	    objCliente.setSenha(senha);
	    
	    ClienteDAO cDao = new ClienteDAO();
	    

        cDao.salvarUsuario(objCliente);
           
        response.sendRedirect("./index.html");
	}


}
