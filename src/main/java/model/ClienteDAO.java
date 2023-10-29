package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAO {
	public void salvarUsuario(Cliente cliente) {
		String sql = "INSERT INTO cliente(nome, email, senha)" + "VALUES (?,?,?)";
		
		Connection conn = null;
		PreparedStatement pstm = null;
		
		//tentativa de conexão com o banco
		try {
			// Cria a conexão com o BD chamando a classe Connection Factory
			conn = Conexao.createConnectionToMySQL();
			// passando a string de execução sql 
			pstm = conn.prepareStatement(sql);
			
			// Adiciona os 3 valores esperados pela Query
			pstm.setString(1, cliente.getNome());
			pstm.setString(2, cliente.getEmail());
			pstm.setString(3, cliente.getSenha());
			
			//Execução da query
			pstm.execute();
		} catch(Exception e) {
			// Caso der alguma exception, ele mostra no console
			e.printStackTrace();
		} finally {
			try {
				// Fecha as conexões caso for != de null
				if (pstm != null) {
					pstm.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	public void salvarUsuarioCompleto(Cliente cliente) {
		String sql = "INSERT INTO cliente(nome, email, senha, logradouro, cidade, uf, telefone, documento, data_nasc)" + "VALUES (?,?,?,?,?,?,?,?,?)";
		
		Connection conn = null;
		PreparedStatement pstm = null;
		
		//tentativa de conexão com o banco
		try {
			// Cria a conexão com o BD chamando a classe Connection Factory
			conn = Conexao.createConnectionToMySQL();
			// passando a string de execução sql 
			pstm = conn.prepareStatement(sql);
			
			// Adiciona os 3 valores esperados pela Query
			pstm.setString(1, cliente.getNome());
			pstm.setString(2, cliente.getEmail());
			pstm.setString(3, cliente.getSenha());
			pstm.setString(4, cliente.getLogradouro());
			pstm.setString(5, cliente.getCidade());
			pstm.setString(6, cliente.getUf());
			pstm.setString(7, cliente.getTelefone());
			pstm.setString(8, cliente.getDocumento());
			pstm.setDate(9, Date.valueOf(cliente.getData_nasc()));
			
			
			//Execução da query
			pstm.execute();
		} catch(Exception e) {
			// Caso der alguma exception, ele mostra no console
			e.printStackTrace();
		} finally {
			try {
				// Fecha as conexões caso for != de null
				if (pstm != null) {
					pstm.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	

	public List<Cliente> getClientes(){
		String sql = "SELECT * FROM cliente";
		
		List<Cliente> clientes  = new ArrayList<Cliente>();
		
		//Conexão com o BD
		Connection conn = null;
		PreparedStatement pstm = null;
		
		// Classe que vai recuperar os dados do BD *** SELECT ***
		ResultSet rset = null;
		
		try {
			conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);
			rset = pstm.executeQuery();
			
			// Enquanto o rset tiver dados para percorrer
			while(rset.next()) {
				Cliente cliente = new Cliente();
				
				//Recuperação dos dados separadamente
				cliente.setId(rset.getInt("id"));
				cliente.setNome(rset.getString("nome"));
				cliente.setEmail(rset.getString("email"));
				Date dataNasc = rset.getDate("data_nasc");
				if (dataNasc != null) {
			        cliente.setData_nasc(dataNasc.toLocalDate());
			    } else {
			        cliente.setData_nasc(null);
			    };
			    
			    cliente.setLogradouro(rset.getString("logradouro"));
			    if (rset.wasNull()) {
			        cliente.setLogradouro("");
			    };
			    
			    cliente.setCep(rset.getString("cep"));
			    if (rset.wasNull()) {
			        cliente.setCep("");
			    };
			    
			    cliente.setCidade(rset.getString("cidade"));
			    if (rset.wasNull()) {
			        cliente.setCidade("");
			    };

			    cliente.setUf(rset.getString("uf"));
			    if (rset.wasNull()) {
			        cliente.setUf("");
			    };

			    cliente.setTelefone(rset.getString("telefone"));
			    if (rset.wasNull()) {
			        cliente.setTelefone("");
			    };
			    
			    cliente.setDocumento(rset.getString("documento"));
			    if (rset.wasNull()) {
			        cliente.setDocumento("");
			    }
				
				
				clientes.add(cliente);
			}
		}catch (Exception e){
			e.printStackTrace();
		} finally {
			try {
				if(rset!=null) {
				rset.close();
				}
				if(pstm!=null) {
				pstm.close();
				}
				if(conn!=null) {
				conn.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return clientes;			
	}

	public void atualizarPorId(Cliente cliente) {
		String sql = "UPDATE cliente SET nome=?, email=?, logradouro=?, cidade=?, cep=?, uf=?, telefone=?, documento=?, data_nasc=?"+"WHERE id=?";
		
		Connection conn = null;
		PreparedStatement pstm = null;
		
		try {
			//Conexão com o BD
			conn = Conexao.createConnectionToMySQL();
			//Preparação da query
			pstm = conn.prepareStatement(sql);
			
			//Adicionar os valores a atualizar
			pstm.setString(1, cliente.getNome());
			pstm.setString(2, cliente.getEmail());
			//pstm.setString(3, cliente.getSenha());
			pstm.setString(3, cliente.getLogradouro());
			pstm.setString(4, cliente.getCidade());
			pstm.setString(5, cliente.getCep());
			pstm.setString(6, cliente.getUf());
			pstm.setString(7, cliente.getTelefone());
			pstm.setString(8, cliente.getDocumento());
			pstm.setDate(9, Date.valueOf(cliente.getData_nasc()));
	
			
			//Campo WHERE, onde pergunta qual o ID a ser editado
			pstm.setInt(10, cliente.getId());
			
			//Executa a query
			pstm.execute();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {	
			try {
				if(conn!=null) {
					conn.close();
				}
				if(pstm!=null) {
					pstm.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	public void deletarPorId(int id) {
		String sql = "DELETE FROM cliente WHERE id=?";
		
		Connection conn = null;
		PreparedStatement pstm = null;
		
		try {
			conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);
			
			pstm.setInt(1, id);
			
			pstm.execute();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn!=null) {
					conn.close();
				}
				if(pstm!=null) {
					pstm.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	public List<Cliente> getClienteById(int id){
		String sql = "SELECT * FROM cliente WHERE id=?";
		
		List<Cliente> clientes  = new ArrayList<Cliente>();
		
		//Conexão com o BD
		Connection conn = null;
		PreparedStatement pstm = null;
		
		// Classe que vai recuperar os dados do BD *** SELECT ***
		ResultSet rset = null;
		
		try {
			conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1,id);	
			rset = pstm.executeQuery();
			
			
			
			// Enquanto o rset tiver dados para percorrer
			while(rset.next()) {
				Cliente cliente = new Cliente();
				
				//Recuperação dos dados separadamente
				cliente.setId(rset.getInt("id"));
				cliente.setNome(rset.getString("nome"));
				cliente.setEmail(rset.getString("email"));
				Date dataNasc = rset.getDate("data_nasc");
				if (dataNasc != null) {
			        cliente.setData_nasc(dataNasc.toLocalDate());
			    } else {
			        cliente.setData_nasc(null);
			    };
			    
			    cliente.setLogradouro(rset.getString("logradouro"));
			    if (rset.wasNull()) {
			        cliente.setLogradouro("");
			    };
			    
			    cliente.setCep(rset.getString("cep"));
			    if (rset.wasNull()) {
			        cliente.setCep("");
			    };
			    
			    cliente.setCidade(rset.getString("cidade"));
			    if (rset.wasNull()) {
			        cliente.setCidade("");
			    };

			    cliente.setUf(rset.getString("uf"));
			    if (rset.wasNull()) {
			        cliente.setUf("");
			    };

			    cliente.setTelefone(rset.getString("telefone"));
			    if (rset.wasNull()) {
			        cliente.setTelefone("");
			    };
			    
			    cliente.setDocumento(rset.getString("documento"));
			    if (rset.wasNull()) {
			        cliente.setDocumento("");
			    }
				
				
				clientes.add(cliente);
			}
		}catch (Exception e){
			e.printStackTrace();
		} finally {
			try {
				if(rset!=null) {
				rset.close();
				}
				if(pstm!=null) {
				pstm.close();
				}
				if(conn!=null) {
				conn.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return clientes;			
	}
	
	public List<Cliente> getClienteByEmail(String email){
		String sql = "SELECT * FROM cliente WHERE email=?";
		
		List<Cliente> clientes  = new ArrayList<Cliente>();
		
		//Conexão com o BD
		Connection conn = null;
		PreparedStatement pstm = null;
		
		// Classe que vai recuperar os dados do BD *** SELECT ***
		ResultSet rset = null;
		
		try {
			conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1,email);	
			rset = pstm.executeQuery();
			
			
			
			// Enquanto o rset tiver dados para percorrer
			while(rset.next()) {
				Cliente cliente = new Cliente();
				
				//Recuperação dos dados separadamente
				cliente.setId(rset.getInt("id"));
				cliente.setNome(rset.getString("nome"));
				cliente.setEmail(rset.getString("email"));
				Date dataNasc = rset.getDate("data_nasc");
	            cliente.setData_nasc(dataNasc.toLocalDate());
				cliente.setLogradouro(rset.getString("logradouro"));
				cliente.setCep(rset.getString("cep"));
				cliente.setCidade(rset.getString("cidade"));
				cliente.setUf(rset.getString("uf"));
				cliente.setTelefone(rset.getString("telefone"));
				cliente.setDocumento(rset.getString("documento"));
				
				
				clientes.add(cliente);
			}
		}catch (Exception e){
			e.printStackTrace();
		} finally {
			try {
				if(rset!=null) {
				rset.close();
				}
				if(pstm!=null) {
				pstm.close();
				}
				if(conn!=null) {
				conn.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return clientes;			
	}
	
	public void cadastrarCliente(Cliente cliente) {
		String sql = "INSERT INTO cliente(nome, email, senha, logradouro, cep, cidade, uf, telefone, documento, data_nasc)" + "VALUES (?,?,?,?,?,?,?,?,?,?)";
		
		Connection conn = null;
		PreparedStatement pstm = null;
		
		//tentativa de conexão com o banco
		try {
			// Cria a conexão com o BD chamando a classe Connection Factory
			conn = Conexao.createConnectionToMySQL();
			// passando a string de execução sql 
			pstm = conn.prepareStatement(sql);
			
			// Adiciona os 3 valores esperados pela Query
			pstm.setString(1, cliente.getNome());
			pstm.setString(2, cliente.getEmail());
			pstm.setString(3, cliente.getSenha());
			pstm.setString(4, cliente.getLogradouro());
			pstm.setString(5, cliente.getCep());
			pstm.setString(6, cliente.getCidade());
			pstm.setString(7, cliente.getUf());
			pstm.setString(8, cliente.getTelefone());
			pstm.setString(9, cliente.getDocumento());
			String dataNasc = cliente.getData_nasc().toString();
	        pstm.setString(10, dataNasc);
			
			//Execução da query
			pstm.execute();
		} catch(Exception e) {
			// Caso der alguma exception, ele mostra no console
			e.printStackTrace();
		} finally {
			try {
				// Fecha as conexões caso for != de null
				if (pstm != null) {
					pstm.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}

}
