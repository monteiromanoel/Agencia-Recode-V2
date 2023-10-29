package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Viagem;
import model.ViagemDAO;


@WebServlet("/Destinos")
public class MostrarDestinosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Integer clienteID = (Integer) request.getSession().getAttribute("clienteID");

		if (clienteID != null) {
		    // O cliente está autenticado. Você pode usar o ID do cliente aqui.
		    System.out.println("ID do Cliente: " + clienteID);
		} else {
		    // O cliente não está autenticado ou a sessão expirou
		    System.out.println("Cliente não autenticado");
		}
		
		List<Viagem> viagensNacionais = new ArrayList<Viagem>();
		List<Viagem> viagensInternacionais = new ArrayList<Viagem>();
		
		ViagemDAO vDao = new ViagemDAO();
		List<Viagem> destinos = vDao.separarPctConv();
		
		
		for(Viagem viagem: destinos) {
			if(viagem.getLocalidade().equals("Brasil")) {
				viagensNacionais.add(viagem);
			} else {
				viagensInternacionais.add(viagem);
			}
		}
		
		request.setAttribute("viagensNacionais", viagensNacionais);
		request.setAttribute("viagensInternacionais", viagensInternacionais);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/Destino.jsp");
		dispatcher.forward(request, response);
		
		
	}

}
