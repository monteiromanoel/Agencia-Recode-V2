package controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cliente;
import model.ClienteDAO;
import model.Viagem;
import model.ViagemDAO;

@WebServlet("/VerificarDados")
public class VerificarDadosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public VerificarDadosServlet() {
        super();
    }
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		HttpSession session = request.getSession();
		Integer clienteID = (Integer) session.getAttribute("clienteID");
	    
	    if (clienteID == null) {
	        response.sendRedirect("login.html?naoLogado=true"); 
	        return; 
	    } else {
	    	 String idPacoteString = request.getParameter("id");
	 	    int idPacote = Integer.parseInt(idPacoteString);
	 	    ViagemDAO vDao = new ViagemDAO();
	 	    List<Viagem> destino = vDao.getViagensById(idPacote);
	 	    
	 	    ClienteDAO cDao = new ClienteDAO();
	 	    List<Cliente> clienteList = cDao.getClienteById(clienteID);

	 	    if (!clienteList.isEmpty()) {
	 	        Cliente cliente = clienteList.get(0); // Obtendo o primeiro cliente da lista

	 	        
	 	        // Verificando se todos os campos essenciais estão preenchidos
	 	        if (cliente.getNome() != null && !cliente.getNome().isEmpty() &&
	 	            cliente.getEmail() != null && !cliente.getEmail().isEmpty() &&
	 	            cliente.getTelefone() != null && !cliente.getTelefone().isEmpty() &&
	 	            cliente.getDocumento() != null && !cliente.getDocumento().isEmpty() &&
	 	            cliente.getLogradouro() != null && !cliente.getLogradouro().isEmpty() &&
	 	            cliente.getCep() != null && !cliente.getCep().isEmpty() &&
	 	            cliente.getCidade() != null && !cliente.getCidade().isEmpty() &&
	         		cliente.getData_nasc() != null && !cliente.getData_nasc().equals(LocalDate.MIN) && !cliente.getData_nasc().isEqual(LocalDate.of(1, 1, 1)) && 
	 	            cliente.getUf() != null && !cliente.getUf().isEmpty()) {

	 	            // Todos os campos estão preenchidos
	 	        	
	 	            request.setAttribute("clienteList", clienteList);
	 	            request.setAttribute("destino", destino);
	 	            request.getRequestDispatcher("/views/DetalheReserva.jsp").forward(request, response);

	 	        } else {
	 	        	request.setAttribute("idCliente", clienteID);
	 	            request.getRequestDispatcher("Perfil").forward(request, response);
	 	        }

	 	    } else {
	 	        request.setAttribute("idCliente", clienteID);
	 	        request.getRequestDispatcher("Perfil").forward(request, response);
	 	    }
	    }
	    
	   
	    
	
	
	} 
	    

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
