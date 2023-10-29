package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Reserva;
import model.ReservaDAO;

@WebServlet("/ListarReservas")
public class ListarReservasAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListarReservasAdminServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		ReservaDAO rDao = new ReservaDAO();
		
		List<Reserva> reservas = rDao.getReserva();
		
		request.setAttribute("reservas", reservas);
	    RequestDispatcher dispatcher = request.getRequestDispatcher("/views/dashboard/ListaReservas.jsp");
		dispatcher.forward(request, response);
		
	}


}
