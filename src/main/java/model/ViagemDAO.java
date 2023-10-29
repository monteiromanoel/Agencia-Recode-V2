package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ViagemDAO {
	public void salvarViagem(Viagem viagem) {
		String sql = "INSERT INTO viagem(destino, preco, data_ida, data_volta, descricao_curta, adicional, tipo_pacote, localidade, imagem, label_promocao, descricao_longa, imagem2, imagem3, imagem4, preco_antigo) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		// Ainda não existe a conexão
		Connection conn = null;
		PreparedStatement pstm = null;

		// tentativa de conexão com o banco
		try {
			// Cria a conexão com o BD chamando a classe Connection Factory
			conn = Conexao.createConnectionToMySQL();
			// passando a string de execução sql
			pstm = conn.prepareStatement(sql);

			// Adiciona os 3 valores esperados pela Query
			pstm.setString(1, viagem.getDestino());
			pstm.setDouble(2, viagem.getPreco());
			pstm.setDate(3, Date.valueOf(viagem.getData_ida()));
			pstm.setDate(4, Date.valueOf(viagem.getData_volta()));
			pstm.setString(5, viagem.getDescricaoCurta());
			pstm.setString(6, viagem.getAdicional());
			pstm.setString(7, viagem.getTipo_pacote());
			pstm.setString(8, viagem.getLocalidade());
			pstm.setString(9, viagem.getImagem());
			pstm.setString(10, viagem.getLabel_promocao());
			pstm.setString(11, viagem.getDescricao_longa());
			pstm.setString(12, viagem.getImagem2());
			pstm.setString(13, viagem.getImagem3());
			pstm.setString(14, viagem.getImagem4());
			pstm.setDouble(15, viagem.getPreco_antigo());

			// Execução da query
			pstm.execute();
		} catch (Exception e) {
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
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	public List<Viagem> getViagens() {
		String sql = "SELECT * FROM viagem";

		// Preparação da list para receber os dados
		List<Viagem> viagens = new ArrayList<Viagem>();

		// Conexão com o BD
		Connection conn = null;
		PreparedStatement pstm = null;

		// Classe que vai recuperar os dados do BD *** SELECT ***
		ResultSet rset = null;

		try {
			conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);
			rset = pstm.executeQuery();

			// Enquanto o rset tiver dados para percorrer
			while (rset.next()) {
				Viagem viagem = new Viagem();

				// Recuperação dos dados separadamente
				viagem.setId(rset.getInt("id"));
				viagem.setDestino(rset.getString("destino"));
				viagem.setPreco(rset.getDouble("preco"));
				Date dataIda = rset.getDate("data_ida");
				viagem.setData_ida(dataIda.toLocalDate());
				Date dataVolta = rset.getDate("data_volta");
				viagem.setData_volta(dataVolta.toLocalDate());
				viagem.setDescricaoCurta(rset.getString("descricao_curta"));
				viagem.setAdicional(rset.getString("adicional"));
				viagem.setTipo_pacote(rset.getString("tipo_pacote"));
				viagem.setLocalidade(rset.getString("localidade"));
				viagem.setImagem(rset.getString("imagem"));
				viagem.setDescricao_longa(rset.getString("descricao_longa"));
				viagem.setLabel_promocao(rset.getString("label_promocao"));
				viagem.setImagem2(rset.getString("imagem2"));
				viagem.setImagem3(rset.getString("imagem3"));
				viagem.setImagem4(rset.getString("imagem4"));
				viagem.setPreco_antigo(rset.getDouble("preco_antigo"));

				viagens.add(viagem);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rset != null) {
					rset.close();
				}
				if (pstm != null) {
					pstm.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return viagens;
	}

	public void atualizarViagem(Viagem viagem) {
		String sql = "UPDATE viagem SET destino=?, preco=?, data_ida=?, data_volta=?, descricao_curta=?, adicional=?, tipo_pacote=?, localidade=?, imagem=?, descricao_longa=?, label_promocao=?, imagem2=?, imagem3=?, imagem4=?, preco_antigo=?"
				+ "WHERE id=? ";

		Connection conn = null;
		PreparedStatement pstm = null;

		try {
			// Conexão com o BD
			conn = Conexao.createConnectionToMySQL();
			// Preparação da query
			pstm = conn.prepareStatement(sql);

			pstm.setString(1, viagem.getDestino());
			pstm.setDouble(2, viagem.getPreco());
			pstm.setDate(3, Date.valueOf(viagem.getData_ida()));
			pstm.setDate(4, Date.valueOf(viagem.getData_volta()));
			pstm.setString(5, viagem.getDescricaoCurta());
			pstm.setString(6, viagem.getAdicional());
			pstm.setString(7, viagem.getTipo_pacote());
			pstm.setString(8, viagem.getLocalidade());
			pstm.setString(9, viagem.getImagem());
			pstm.setString(10, viagem.getDescricao_longa());
			pstm.setString(11, viagem.getLabel_promocao());
			pstm.setString(12, viagem.getImagem2());
			pstm.setString(13, viagem.getImagem3());
			pstm.setString(14, viagem.getImagem4());
			pstm.setDouble(15, viagem.getPreco_antigo());

			// Campo WHERE, onde pergunta qual o ID a ser editado
			pstm.setInt(16, viagem.getId());

			// Executa a query
			pstm.execute();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (pstm != null) {
					pstm.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void deletarPorId(int id) {
		String sql = "DELETE FROM viagem WHERE id=?";

		Connection conn = null;
		PreparedStatement pstm = null;

		try {
			conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);

			pstm.setInt(1, id);

			pstm.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (pstm != null) {
					pstm.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	public List<Viagem> separarPctConv() {
		String sql = "SELECT * FROM viagem WHERE tipo_pacote='convencional'";

		List<Viagem> viagensConv = new ArrayList<Viagem>();

		Connection conn = null;
		PreparedStatement pstm = null;

		// Classe que vai recuperar os dados do BD *** SELECT ***
		ResultSet rset = null;

		try {
			conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);
			rset = pstm.executeQuery();

			// Enquanto o rset tiver dados para percorrer
			while (rset.next()) {
				Viagem viagemConv = new Viagem();

				// Recuperação dos dados separadamente
				viagemConv.setId(rset.getInt("id"));
				viagemConv.setDestino(rset.getString("destino"));
				viagemConv.setPreco(rset.getDouble("preco"));
				Date dataIda = rset.getDate("data_ida");
				viagemConv.setData_ida(dataIda.toLocalDate());
				Date dataVolta = rset.getDate("data_volta");
				viagemConv.setData_volta(dataVolta.toLocalDate());
				viagemConv.setDescricaoCurta(rset.getString("descricao_curta"));
				viagemConv.setAdicional(rset.getString("adicional"));
				viagemConv.setTipo_pacote(rset.getString("tipo_pacote"));
				viagemConv.setLocalidade(rset.getString("localidade"));
				viagemConv.setImagem(rset.getString("imagem"));
				viagemConv.setDescricao_longa(rset.getString("descricao_longa"));
				viagemConv.setImagem2(rset.getString("imagem2"));
				viagemConv.setImagem3(rset.getString("imagem3"));
				viagemConv.setImagem4(rset.getString("imagem4"));

				viagensConv.add(viagemConv);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rset != null) {
					rset.close();
				}
				if (pstm != null) {
					pstm.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return viagensConv;
	}

	public List<Viagem> separarPctProm() {
		String sql = "SELECT * FROM viagem WHERE tipo_pacote='promocional'";

		List<Viagem> viagensProm = new ArrayList<Viagem>();

		Connection conn = null;
		PreparedStatement pstm = null;

		// Classe que vai recuperar os dados do BD *** SELECT ***
		ResultSet rset = null;

		try {
			conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);
			rset = pstm.executeQuery();

			// Enquanto o rset tiver dados para percorrer
			while (rset.next()) {
				Viagem viagemProm = new Viagem();

				// Recuperação dos dados separadamente
				viagemProm.setId(rset.getInt("id"));
				viagemProm.setDestino(rset.getString("destino"));
				viagemProm.setPreco(rset.getDouble("preco"));
				Date dataIda = rset.getDate("data_ida");
				viagemProm.setData_ida(dataIda.toLocalDate());
				Date dataVolta = rset.getDate("data_volta");
				viagemProm.setData_volta(dataVolta.toLocalDate());
				viagemProm.setDescricaoCurta(rset.getString("descricao_curta"));
				viagemProm.setAdicional(rset.getString("adicional"));
				viagemProm.setTipo_pacote(rset.getString("tipo_pacote"));
				viagemProm.setLocalidade(rset.getString("localidade"));
				viagemProm.setImagem(rset.getString("imagem"));
				viagemProm.setDescricao_longa(rset.getString("descricao_longa"));
				viagemProm.setLabel_promocao(rset.getString("label_promocao"));
				viagemProm.setImagem2(rset.getString("imagem2"));
				viagemProm.setImagem3(rset.getString("imagem3"));
				viagemProm.setImagem4(rset.getString("imagem4"));
				viagemProm.setPreco_antigo(rset.getDouble("preco_antigo"));

				viagensProm.add(viagemProm);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rset != null) {
					rset.close();
				}
				if (pstm != null) {
					pstm.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return viagensProm;
	}

	public List<Viagem> getViagensById(int id) {
		String sql = "SELECT * FROM viagem WHERE id=?";

		// Preparação da list para receber os dados
		List<Viagem> viagens = new ArrayList<Viagem>();

		// Conexão com o BD
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
			while (rset.next()) {
				Viagem viagem = new Viagem();

				// Recuperação dos dados separadamente
				viagem.setId(rset.getInt("id"));
				viagem.setDestino(rset.getString("destino"));
				viagem.setPreco(rset.getDouble("preco"));
				Date dataIda = rset.getDate("data_ida");
				viagem.setData_ida(dataIda.toLocalDate());
				Date dataVolta = rset.getDate("data_volta");
				viagem.setData_volta(dataVolta.toLocalDate());
				viagem.setDescricaoCurta(rset.getString("descricao_curta"));
				viagem.setAdicional(rset.getString("adicional"));
				viagem.setTipo_pacote(rset.getString("tipo_pacote"));
				viagem.setLocalidade(rset.getString("localidade"));
				viagem.setImagem(rset.getString("imagem"));
				viagem.setDescricao_longa(rset.getString("descricao_longa"));
				viagem.setLabel_promocao(rset.getString("label_promocao"));
				viagem.setImagem2(rset.getString("imagem2"));
				viagem.setImagem3(rset.getString("imagem3"));
				viagem.setImagem4(rset.getString("imagem4"));
				viagem.setPreco_antigo(rset.getDouble("preco_antigo"));

				viagens.add(viagem);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rset != null) {
					rset.close();
				}
				if (pstm != null) {
					pstm.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return viagens;
	}

	public List<Viagem> getPesquisaViagem(String pesquisa) {
		String sql = "SELECT * FROM viagem WHERE destino LIKE ?";

		// Preparação da list para receber os dados
		List<Viagem> viagens = new ArrayList<Viagem>();

		// Conexão com o BD
		Connection conn = null;
		PreparedStatement pstm = null;

		// Classe que vai recuperar os dados do BD *** SELECT ***
		ResultSet rset = null;

		try {
			conn = Conexao.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, '%' + pesquisa + '%');
			rset = pstm.executeQuery();

			// Enquanto o rset tiver dados para percorrer
			while (rset.next()) {
				Viagem viagem = new Viagem();

				// Recuperação dos dados separadamente
				viagem.setId(rset.getInt("id"));
				viagem.setDestino(rset.getString("destino"));
				viagem.setPreco(rset.getDouble("preco"));
				Date dataIda = rset.getDate("data_ida");
				viagem.setData_ida(dataIda.toLocalDate());
				Date dataVolta = rset.getDate("data_volta");
				viagem.setData_volta(dataVolta.toLocalDate());
				viagem.setDescricaoCurta(rset.getString("descricao_curta"));
				viagem.setAdicional(rset.getString("adicional"));
				viagem.setTipo_pacote(rset.getString("tipo_pacote"));
				viagem.setLocalidade(rset.getString("localidade"));
				viagem.setImagem(rset.getString("imagem"));
				viagem.setDescricao_longa(rset.getString("descricao_longa"));
				viagem.setLabel_promocao(rset.getString("label_promocao"));
				viagem.setImagem2(rset.getString("imagem2"));
				viagem.setImagem3(rset.getString("imagem3"));
				viagem.setImagem4(rset.getString("imagem4"));
				viagem.setPreco_antigo(rset.getDouble("preco_antigo"));

				viagens.add(viagem);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rset != null) {
					rset.close();
				}
				if (pstm != null) {
					pstm.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return viagens;
	}

	public Double obterPrecoPorId(int id) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;

		try {
			conn = Conexao.createConnectionToMySQL();
			String sql = "SELECT preco FROM viagem WHERE id = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, id);
			rset = pstm.executeQuery();

			if (rset.next()) {
				return rset.getDouble("preco");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rset != null) {
					rset.close();
				}
				if (pstm != null) {
					pstm.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return null;
	}
}
