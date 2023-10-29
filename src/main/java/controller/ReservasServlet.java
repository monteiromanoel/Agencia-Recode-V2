package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cliente;
import model.ClienteDAO;
import model.Reserva;
import model.ReservaDAO;
import model.Viagem;
import model.ViagemDAO;

@WebServlet("/Reservas")
public class ReservasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReservasServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		HttpSession session = request.getSession();
	    int clienteID = (int) session.getAttribute("clienteID");
	    
	    ClienteDAO cDao = new ClienteDAO();		
	    List<Cliente> cliente = cDao.getClienteById(clienteID);
	    
	    ReservaDAO rDao = new ReservaDAO();
	    List<Reserva> reserva = rDao.getReservaPorIdCliente(clienteID);
	    
	    request.setAttribute("Reserva", reserva);
	    RequestDispatcher dispatcher = request.getRequestDispatcher("/views/Reservas.jsp");
		dispatcher.forward(request, response);

	    
	    
	}


}
