package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ReservaDAO;

@WebServlet("/DeletarReservaAdm")
public class DeletarReservaAdmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeletarReservaAdmServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	    int idReserva = Integer.parseInt(request.getParameter("idReserva"));
	    
	    ReservaDAO rDao = new ReservaDAO();
	    
	    rDao.deleteById(idReserva);
	    
	    response.sendRedirect("/Agencia-Viagem-V2/ListarReservas");

    }
}
