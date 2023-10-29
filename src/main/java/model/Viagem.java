package model;

import java.time.LocalDate;

public class Viagem {
	private int id;
	private String destino;
	private Double preco;
	private LocalDate data_ida;
	private LocalDate data_volta;
	private String descricao_curta;
	private String adicional;
	private String localidade;
	private String imagem;
	private String tipo_pacote;
	private String descricao_longa;
	private String label_promocao;
	private String imagem2;
	private String imagem3;
	private String imagem4;
	private Double preco_antigo;

	public Viagem() {
		
	}

	public Viagem(int id, String destino, Double preco, LocalDate data_ida, LocalDate data_volta, String descricao_curta,
			String adicional, String localidade, String imagem, String tipo_pacote, String descricao_longa,
			String label_promocao, String imagem2, String imagem3, String imagem4, Double preco_antigo) {
		super();
		this.id = id;
		this.destino = destino;
		this.preco = preco;
		this.data_ida = data_ida;
		this.data_volta = data_volta;
		this.descricao_curta = descricao_curta;
		this.adicional = adicional;
		this.localidade = localidade;
		this.imagem = imagem;
		this.tipo_pacote = tipo_pacote;
		this.descricao_longa = descricao_longa;
		this.label_promocao = label_promocao;
		this.imagem2 = imagem2;
		this.imagem3 = imagem3;
		this.imagem4 = imagem4;
		this.preco_antigo = preco_antigo;
	}
	

	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getDestino() {
		return destino;
	}
	public void setDestino(String destino) {
		this.destino = destino;
	}
	public Double getPreco() {
		return preco;
	}
	public Double getPrecoId(int idViagem) {
		return preco;
	}
	public void setPreco(double d) {
		this.preco = d;
	}
	public LocalDate getData_ida() {
		return data_ida;
	}
	public void setData_ida(LocalDate data_ida) {
		this.data_ida = data_ida;
	}
	public LocalDate getData_volta() {
		return data_volta;
	}
	public void setData_volta(LocalDate data_volta) {
		this.data_volta = data_volta;
	}
	public String getDescricaoCurta() {
		return descricao_curta;
	}
	public void setDescricaoCurta(String descricao_curta) {
		this.descricao_curta = descricao_curta;
	}
	public String getAdicional() {
		return adicional;
	}
	public void setAdicional(String adicional) {
		this.adicional = adicional;
	}
	public String getTipo_pacote() {
		return tipo_pacote;
	}

	public void setTipo_pacote(String tipo_pacote) {
		this.tipo_pacote = tipo_pacote;
	}
	
	public String getDescricao_longa() {
		return descricao_longa;
	}

	public void setDescricao_longa(String descricao_longa) {
		this.descricao_longa = descricao_longa;
	}

	public String getLabel_promocao() {
		return label_promocao;
	}

	public void setLabel_promocao(String label_promocao) {
		this.label_promocao = label_promocao;
	}
	
	public String getLocalidade() {
		return localidade;
	}

	public void setLocalidade(String local) {
		this.localidade = local;
	}

	public String getImagem() {
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
	}

	public void setPreco(Double preco) {
		this.preco = preco;
	}

	public String toString() {
	    return "ID da Viagem: " + this.id;
	}

	public String getImagem2() {
		return imagem2;
	}

	public void setImagem2(String imagem2) {
		this.imagem2 = imagem2;
	}

	public String getImagem3() {
		return imagem3;
	}

	public void setImagem3(String imagem3) {
		this.imagem3 = imagem3;
	}

	public String getImagem4() {
		return imagem4;
	}

	public void setImagem4(String imagem4) {
		this.imagem4 = imagem4;
	}

	public String getDescricao_curta() {
		return descricao_curta;
	}

	public void setDescricao_curta(String descricao_curta) {
		this.descricao_curta = descricao_curta;
	}

	public Double getPreco_antigo() {
		return preco_antigo;
	}

	public void setPreco_antigo(Double preco_antigo) {
		this.preco_antigo = preco_antigo;
	}
	
	
	
	
}
