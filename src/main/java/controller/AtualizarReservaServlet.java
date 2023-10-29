package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Cliente;
import model.Reserva;
import model.ReservaDAO;
import model.Viagem;
import model.ViagemDAO;

@WebServlet("/AtualizarReserva")
public class AtualizarReservaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AtualizarReservaServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String idReservaString = request.getParameter("id");
		int idReserva = Integer.parseInt(idReservaString);
		
		Reserva reservaAlterada = new Reserva();
		ReservaDAO rDao = new ReservaDAO();
		
		String idClienteString = request.getParameter("idCliente");
		int idCliente = Integer.parseInt(idClienteString);
		Cliente cliente = new Cliente();
		cliente.setId(idCliente);
		reservaAlterada.setIdCliente(cliente);
		
		String idViagemString = request.getParameter("idViagem");
		int idViagem = Integer.parseInt(idViagemString);
		Viagem viagem = new Viagem();
		viagem.setId(idViagem);
		reservaAlterada.setIdViagem(viagem);
		
		String numPassString = request.getParameter("num_passageiros");
		int numPass = Integer.parseInt(numPassString);
		reservaAlterada.setNum_passageiros(numPass);
		
		java.util.Date dataUtil = new java.util.Date();
		reservaAlterada.setData_reserva(dataUtil);
		

		ViagemDAO vDao = new ViagemDAO();
		Double precoPacote = vDao.obterPrecoPorId(idViagem);
		Double precoFinal = precoPacote * numPass;
		reservaAlterada.setPreco(precoFinal);
		
		reservaAlterada.setId(idReserva);
		
		rDao.atualizar(reservaAlterada);
		
		response.sendRedirect("/Agencia-Viagem-V2/ListarReservas?atualizado=true");
		
	}

}
