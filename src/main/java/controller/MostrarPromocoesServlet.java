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


@WebServlet("/Promocoes")
public class MostrarPromocoesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Viagem> viagensNacionais = new ArrayList<Viagem>();
		List<Viagem> viagensInternacionais = new ArrayList<Viagem>();
		
		ViagemDAO vDao = new ViagemDAO();
		List<Viagem> destinos = vDao.separarPctProm();
		
		
		for(Viagem viagem: destinos) {
			if(viagem.getLocalidade().equals("Brasil")) {
				viagensNacionais.add(viagem);
			} else {
				viagensInternacionais.add(viagem);
			}
		}
		
		request.setAttribute("viagensNacionais", viagensNacionais);
		request.setAttribute("viagensInternacionais", viagensInternacionais);

		RequestDispatcher dispatcher = request.getRequestDispatcher("./views/Promocoes.jsp");
		dispatcher.forward(request, response);
		
		
	}

}
