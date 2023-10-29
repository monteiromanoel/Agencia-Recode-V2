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

@WebServlet("/Pesquisar")
public class PesquisarDestinosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PesquisarDestinosServlet() {
        super();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String pesquisaDestino = request.getParameter("pesquisaDestino");
	    
	    ViagemDAO vDao = new ViagemDAO();
	    List<Viagem> destinos = vDao.getPesquisaViagem(pesquisaDestino);
	    
	    request.setAttribute("pesquisaDestino", destinos);
	    

	    RequestDispatcher dispatcher = request.getRequestDispatcher("/views/ResultadoPesquisa.jsp");
	    dispatcher.forward(request, response);
    
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		
	}

}
