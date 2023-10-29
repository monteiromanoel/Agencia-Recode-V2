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

@WebServlet("/CadastroCliente")
public class CadastroClienteAdmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CadastroClienteAdmServlet() {
        super();
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String nome = request.getParameter("nome");
		    String email = request.getParameter("email");
		    String senha = request.getParameter("senha");
		    String logradouro = request.getParameter("logradouro");
		    String cidade = request.getParameter("cidade");
		    String uf = request.getParameter("uf");
		    String telefone = request.getParameter("telefone");
		    String documento = request.getParameter("documento");
		    String dataNascString = request.getParameter("data_nasc");
		    LocalDate dataNasc = LocalDate.parse(dataNascString);
		    
		    Cliente objCliente = new Cliente();
		    objCliente.setNome(nome);
		    objCliente.setEmail(email);
		    objCliente.setSenha(senha);
		    objCliente.setLogradouro(logradouro);
		    objCliente.setCidade(cidade);
		    objCliente.setUf(uf);
		    objCliente.setTelefone(telefone);
		    objCliente.setDocumento(documento);
		    objCliente.setData_nasc(dataNasc);
		    
		    ClienteDAO cDao = new ClienteDAO();
		    
            cDao.salvarUsuarioCompleto(objCliente);

	
		    response.sendRedirect("/Agencia-Viagem-V2/ListarUsuarios?atualizado=true");
		}
	}


