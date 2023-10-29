package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ReservaDAO;

@WebServlet("/DeletarReserva")
public class DeletarReservaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeletarReservaServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		HttpSession session = request.getSession();
	    int clienteID = (int) session.getAttribute("clienteID");
		
	    int idReserva = Integer.parseInt(request.getParameter("idReserva"));
	    
	    ReservaDAO rDao = new ReservaDAO();
	    
	    rDao.deleteById(idReserva);
	    
	    response.sendRedirect("Reservas");
		
	}


}
