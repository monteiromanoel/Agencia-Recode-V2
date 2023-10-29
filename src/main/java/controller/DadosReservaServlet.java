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

@WebServlet("/DadosReserva")
public class DadosReservaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public DadosReservaServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		HttpSession session = request.getSession();
		int clienteID = (int) session.getAttribute("clienteID");
		int idPacote = Integer.parseInt(request.getParameter("idPacote"));
		int idReserva = Integer.parseInt(request.getParameter("idReserva"));
		
		ReservaDAO rDao = new ReservaDAO();
	    List<Reserva> dadoReserva = rDao.getReservaPorIdR(idReserva);
	    
	    ClienteDAO cDao = new ClienteDAO();
	    List<Cliente> dadoCliente = cDao.getClienteById(clienteID);
	    
	    ViagemDAO vDao = new ViagemDAO();
	    List<Viagem> dadoViagem = vDao.getViagensById(idPacote);
	    
	    request.setAttribute("dadoCliente", dadoCliente);
	    request.setAttribute("dadoViagem", dadoViagem);
	    request.setAttribute("dadoReserva", dadoReserva);
	    RequestDispatcher dispatcher = request.getRequestDispatcher("./views/DadosReserva.jsp");
	    dispatcher.forward(request, response);		
		
	}


}
