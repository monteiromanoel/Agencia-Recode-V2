package controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cliente;
import model.ClienteDAO;

@WebServlet("/AtualizarCliente")
public class AtualizarClienteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AtualizarClienteServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
	    int clienteID = (int) session.getAttribute("clienteID");
	    
	    Cliente clienteAlterado = new Cliente();
	    clienteAlterado.setNome(request.getParameter("nome"));
	    clienteAlterado.setEmail(request.getParameter("email"));
	    clienteAlterado.setLogradouro(request.getParameter("logradouro"));
	    String ufSelecionado = request.getParameter("uf");
	    clienteAlterado.setUf(ufSelecionado);
	    clienteAlterado.setCep(request.getParameter("cep"));
	    clienteAlterado.setCidade(request.getParameter("cidade"));
	    clienteAlterado.setDocumento(request.getParameter("documento"));
	    clienteAlterado.setTelefone(request.getParameter("telefone"));
	    String dataNascString = request.getParameter("data_nasc");
	    LocalDate dataNasc = LocalDate.parse(dataNascString);
	    clienteAlterado.setData_nasc(dataNasc);
	    clienteAlterado.setId(clienteID);
	    
	    ClienteDAO cd = new ClienteDAO();
	    cd.atualizarPorId(clienteAlterado);
	    
	    response.sendRedirect("./views/IndexLogado.jsp?atualizado=true");
	}

}
