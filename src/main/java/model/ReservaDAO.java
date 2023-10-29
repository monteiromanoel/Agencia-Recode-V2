package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReservaDAO {
	public void saveReserva(Reserva reserva) {
		String sql = "INSERT INTO reserva(idCliente, idViagem, num_passageiros, data_reserva, preco)"+"VALUES(?,?,?,?,?)";
		
		Connection conn = null;
		PreparedStatement pstm = null;
		
		//tentativa de conexão com o banco
		try {
			// Cria a conexão com o BD chamando a classe Connection Factory
			conn = Conexao.createConnectionToMySQL();
			// passando a string de execução sql 
			pstm = conn.prepareStatement(sql);
			
			pstm.setInt(1, reserva.getIdCliente().getId());
			pstm.setInt(2, reserva.getIdViagem().getId());
			pstm.setInt(3, reserva.getNum_passageiros());
			java.util.Date dataUtil = reserva.getData_reserva();
			java.sql.Date dataSQL = new java.sql.Date(dataUtil.getTime());
			pstm.setDate(4, dataSQL);
			pstm.setDouble(5, reserva.getPreco());
			
			//Execução da query
			pstm.execute();
		} catch(Exception e) {
			// Caso der alguma exception, ele mostra no console
			e.printStackTrace();
		} finally {
			try {
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
	
	 public List<Reserva> getReserva(){
		 String sql = "SELECT * FROM reserva";
			
			//Preparação da list para receber os dados
			List<Reserva> reservas = new ArrayList<Reserva>();
			
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
					Reserva reserva = new Reserva();
					
					//Recuperação dos dados separadamente
					reserva.setId(rset.getInt("id"));
					reserva.setNum_passageiros(rset.getInt("num_passageiros"));
					reserva.setData_reserva(rset.getDate("data_reserva"));
					reserva.setPreco(rset.getDouble("preco"));
					
					int idCliente = rset.getInt("idCliente");
					Cliente cliente = new Cliente();
					cliente.setId(idCliente);
					reserva.setIdCliente(cliente);
					
					int idViagem = rset.getInt("idViagem");
					Viagem viagem = new Viagem();
					viagem.setId(idViagem);
					reserva.setIdViagem(viagem);
					
					reservas.add(reserva);
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
			return reservas; 
	 }
	 
	 public List<Reserva> getReservaPorIdCliente(int id){
		 String sql = "SELECT * FROM reserva WHERE idCliente=?";
			
			//Preparação da list para receber os dados
			List<Reserva> reservas = new ArrayList<Reserva>();
			
			//Conexão com o BD
			Connection conn = null;
			PreparedStatement pstm = null;
			
			// Classe que vai recuperar os dados do BD *** SELECT ***
			ResultSet rset = null;
			
			try {
				conn = Conexao.createConnectionToMySQL();
				pstm = conn.prepareStatement(sql);
				pstm.setInt(1, id); 
				rset = pstm.executeQuery();
				
				// Enquanto o rset tiver dados para percorrer
				while(rset.next()) {
					Reserva reserva = new Reserva();
					
					//Recuperação dos dados separadamente
					reserva.setId(rset.getInt("id"));
					reserva.setNum_passageiros(rset.getInt("num_passageiros"));
					reserva.setData_reserva(rset.getDate("data_reserva"));
					reserva.setPreco(rset.getDouble("preco"));
					
					int idCliente = rset.getInt("idCliente");
					Cliente cliente = new Cliente();
					cliente.setId(idCliente);
					reserva.setIdCliente(cliente);
					
					int idViagem = rset.getInt("idViagem");
					Viagem viagem = new Viagem();
					viagem.setId(idViagem);
					reserva.setIdViagem(viagem);
					
					reservas.add(reserva);
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
			return reservas; 
	 }
	 
	 public List<Reserva> getReservaPorIdR(int id){
		 String sql = "SELECT * FROM reserva WHERE id=?";
			
			//Preparação da list para receber os dados
			List<Reserva> reservas = new ArrayList<Reserva>();
			
			//Conexão com o BD
			Connection conn = null;
			PreparedStatement pstm = null;
			
			// Classe que vai recuperar os dados do BD *** SELECT ***
			ResultSet rset = null;
			
			try {
				conn = Conexao.createConnectionToMySQL();
				pstm = conn.prepareStatement(sql);
				pstm.setInt(1, id); 
				rset = pstm.executeQuery();
				
				// Enquanto o rset tiver dados para percorrer
				while(rset.next()) {
					Reserva reserva = new Reserva();
					
					//Recuperação dos dados separadamente
					reserva.setId(rset.getInt("id"));
					reserva.setNum_passageiros(rset.getInt("num_passageiros"));
					reserva.setData_reserva(rset.getDate("data_reserva"));
					reserva.setPreco(rset.getDouble("preco"));
					
					int idCliente = rset.getInt("idCliente");
					Cliente cliente = new Cliente();
					cliente.setId(idCliente);
					reserva.setIdCliente(cliente);
					
					int idViagem = rset.getInt("idViagem");
					Viagem viagem = new Viagem();
					viagem.setId(idViagem);
					reserva.setIdViagem(viagem);
					
					reservas.add(reserva);
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
			return reservas; 
	 }
	 
	 public void atualizar(Reserva reserva) {
			String sql = "UPDATE reserva SET num_passageiros=?, data_reserva=?, preco=?, idCliente=?, idViagem=? WHERE id=?";
			
			Connection conn = null;
			PreparedStatement pstm = null;
			
			try {
				//Conexão com o BD
				conn = Conexao.createConnectionToMySQL();
				//Preparação da query
				pstm = conn.prepareStatement(sql);
				
				//Adicionar os valores a atualizar
				pstm.setInt(1, reserva.getNum_passageiros());
				java.util.Date dataUtil = reserva.getData_reserva();
				java.sql.Date dataSQL = new java.sql.Date(dataUtil.getTime());
				pstm.setDate(2, dataSQL);
				pstm.setDouble(3, reserva.getPreco());
				int idCliente = reserva.getIdCliente().getId(); 
		        int idViagem = reserva.getIdViagem().getId(); 
		        pstm.setInt(4, idCliente);
		        pstm.setInt(5, idViagem);
				
				//Campo WHERE, onde pergunta qual o ID a ser editado
				pstm.setInt(6, reserva.getId());
				
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
	 
	 public void deleteById(int id) {
			String sql = "DELETE FROM reserva WHERE id=?";
			
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
	 
}
