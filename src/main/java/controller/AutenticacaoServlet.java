package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Conexao;

@WebServlet("/Autenticacao")
public class AutenticacaoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AutenticacaoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		try {
			try {
				conn = Conexao.createConnectionToMySQL();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			String sql = "SELECT * FROM cliente WHERE email = ? AND senha = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, email);
			pstm.setString(2, senha);
			rset = pstm.executeQuery();
			
			if(rset.next()) {
				int clienteID = rset.getInt("id");
				String nomeCliente = rset.getString("nome");
				
			    HttpSession session = request.getSession();
			    session.setAttribute("clienteID", clienteID);
			    session.setAttribute("nomeCliente", nomeCliente);
			    response.sendRedirect("./views/IndexLogado.jsp");
			} else {
				response.sendRedirect("login.html?error=1");
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm!=null) {
					pstm.close();
				}
				if (conn!=null) {
					conn.close();
				}
				if (rset!=null) {
					rset.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		
	}

}
