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

@WebServlet("/DetalhesDestino")
public class DetalhesDestinoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DetalhesDestinoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int idViagem = Integer.parseInt(request.getParameter("id"));
		
		ViagemDAO vDao = new ViagemDAO();
		
		List<Viagem> destino = vDao.getViagensById(idViagem);
		
		if (!destino.isEmpty()) {
		    String descricaoLonga = destino.get(0).getDescricao_longa();

		    if (descricaoLonga != null) {
		        descricaoLonga = descricaoLonga.replace("\n", "<br>");
		    }

		    destino.get(0).setDescricao_longa(descricaoLonga);
		}
		
		
		request.setAttribute("destino", destino);
		request.getRequestDispatcher("/views/DetalheDestino.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
