package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Viagem;
import model.ViagemDAO;

@WebServlet("/ListarDestinos")
public class ListarDestinosAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListarDestinosAdminServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		ViagemDAO vDao = new ViagemDAO();
		List<Viagem> viagens = vDao.getViagens();
		
		request.setAttribute("viagens", viagens);
	    RequestDispatcher dispatcher = request.getRequestDispatcher("/views/dashboard/ListaDestinos.jsp");
		dispatcher.forward(request, response);
	}


}
