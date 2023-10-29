package controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Cliente;
import model.ClienteDAO;

@WebServlet("/AtualizarUsuario")
public class AtualizarUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AtualizarUsuarioServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idUsuarioString = request.getParameter("id");
		int idUsuario = Integer.parseInt(idUsuarioString);
		
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
	    clienteAlterado.setId(idUsuario);
	    
	    ClienteDAO cd = new ClienteDAO();
	    cd.atualizarPorId(clienteAlterado);
	    
	    response.sendRedirect("/Agencia-Viagem-V2/ListarUsuarios?atualizado=true");
	    
	    
	}

}
