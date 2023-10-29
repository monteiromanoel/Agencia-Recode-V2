package controller;

import java.io.IOException;
import java.sql.Date;
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

@WebServlet("/ConfirmaReserva")
public class ConfirmaReservaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ConfirmaReservaServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		HttpSession session = request.getSession();
	    int clienteID = (int) session.getAttribute("clienteID");
	    int idPacote = Integer.parseInt(request.getParameter("id"));
	    int numPassageiros = Integer.parseInt(request.getParameter("num_passageiros"));
	    
	    double precoTotal = Double.parseDouble(request.getParameter("preco")) * numPassageiros;
	    
	    Reserva reserva = new Reserva();
	    ReservaDAO rDao = new ReservaDAO();
	    
	    Cliente cliente = new Cliente();
	    cliente.setId(clienteID);
	    reserva.setIdCliente(cliente);

	    Viagem viagem = new Viagem();
	    viagem.setId(idPacote);
	    reserva.setIdViagem(viagem);
	    
	    reserva.setNum_passageiros(numPassageiros);
	    java.util.Date dataUtil = new java.util.Date();
	    reserva.setData_reserva(dataUtil);
	    
	    reserva.setPreco(precoTotal);

	    rDao.saveReserva(reserva);
	    
	    
	    response.sendRedirect("Reservas?reservaConfirmada=true");

	}

}
