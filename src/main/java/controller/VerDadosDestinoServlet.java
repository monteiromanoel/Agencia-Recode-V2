package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Viagem;
import model.ViagemDAO;

@WebServlet("/VerDadosDestino")
public class VerDadosDestinoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	public VerDadosDestinoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int idViagem = Integer.parseInt(request.getParameter("idViagem"));
		
		ViagemDAO vDao = new ViagemDAO();
	    
	    List<Viagem> viagem = vDao.getViagensById(idViagem);
	    
	    request.setAttribute("viagem", viagem);
	    
	    request.getRequestDispatcher("./views/dashboard/AtualizarDestino.jsp").forward(request, response);
	
	}


}
