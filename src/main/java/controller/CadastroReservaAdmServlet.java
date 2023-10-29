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
import model.Reserva;
import model.ReservaDAO;
import model.Viagem;
import model.ViagemDAO;

@WebServlet("/CadastroReservaAdm")
public class CadastroReservaAdmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CadastroReservaAdmServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		ClienteDAO cDao = new ClienteDAO();
		List<Cliente> clientes = cDao.getClientes();
		
		ViagemDAO vDao = new ViagemDAO();
		List<Viagem> viagens = vDao.getViagens();
		
		request.setAttribute("viagens", viagens);
		request.setAttribute("clientes", clientes);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/dashboard/CadastroReserva.jsp");
		dispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		ReservaDAO rDao = new ReservaDAO();
		Reserva reserva = new Reserva();
		
		String idClienteString = request.getParameter("idCliente");
		int idCliente = Integer.parseInt(idClienteString);
		Cliente cliente = new Cliente();
		cliente.setId(idCliente);
		reserva.setIdCliente(cliente);
		
		String idViagemString = request.getParameter("idViagem");
		int idViagem = Integer.parseInt(idViagemString);
		Viagem viagem = new Viagem();
		viagem.setId(idViagem);
		reserva.setIdViagem(viagem);
		
		String numPassString = request.getParameter("num_passageiros");
		int numPass = Integer.parseInt(numPassString);
		reserva.setNum_passageiros(numPass);
		
		java.util.Date dataUtil = new java.util.Date();
		reserva.setData_reserva(dataUtil);
		
		ViagemDAO vDao = new ViagemDAO();
		Double precoPacote = vDao.obterPrecoPorId(idViagem);
		Double precoFinal = precoPacote * numPass;
		reserva.setPreco(precoFinal);
		
		rDao.saveReserva(reserva);
		
		response.sendRedirect("/Agencia-Viagem-V2/ListarReservas?atualizado=true");
	}

}
