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
import model.Reserva;
import model.ReservaDAO;
import model.Viagem;
import model.ViagemDAO;

@WebServlet("/VerDadosReserva")
public class VerDadosReservaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public VerDadosReservaServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int idReserva = Integer.parseInt(request.getParameter("idReserva"));
		int idCliente = Integer.parseInt(request.getParameter("idCliente"));
		int idViagem = Integer.parseInt(request.getParameter("idViagem"));
		
		ReservaDAO rDao = new ReservaDAO();
		ClienteDAO cDao = new ClienteDAO();
		ViagemDAO vDao = new ViagemDAO();
		
		List<Reserva> reserva = rDao.getReservaPorIdR(idReserva);
		List<Cliente> clienteR = cDao.getClienteById(idCliente);
		List<Viagem> viagemR = vDao.getViagensById(idViagem);
		
		request.setAttribute("reserva", reserva);
		request.setAttribute("viagemR", viagemR);
		request.setAttribute("clienteR", clienteR);
		request.getRequestDispatcher("./views/dashboard/AtualizarReserva.jsp").forward(request, response);
		
	}


}
