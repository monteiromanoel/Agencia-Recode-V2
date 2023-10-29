package model;

import java.time.LocalDate;

public class Cliente {
	private int id;
	private String nome;
	private String email;
	private String senha;
	private String documento;
	private String telefone;
	private String logradouro;
	private String cep;
	private String cidade;
	private String uf;
	private LocalDate data_nasc;

	public Cliente() {

	}
	public Cliente(int id, String nome, String email, String senha, String documento, String telefone,
			String logradouro, String cep, String cidade, String uf, LocalDate data_nasc) {
		this.id = id;
		this.nome = nome;
		this.email = email;
		this.senha = senha;
		this.documento = documento;
		this.telefone = telefone;
		this.logradouro = logradouro;
		this.cep = cep;
		this.cidade = cidade;
		this.uf = uf;
		this.data_nasc = data_nasc;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getDocumento() {
		return documento;
	}
	public void setDocumento(String documento) {
		this.documento = documento;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getLogradouro() {
		return logradouro;
	}
	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}
	public String getCep() {
		return cep;
	}
	public void setCep(String cep) {
		this.cep = cep;
	}
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	public String getUf() {
		return uf;
	}
	public void setUf(String uf) {
		this.uf = uf;
	}
	public LocalDate getData_nasc() {
		return data_nasc;
	}
	public void setData_nasc(LocalDate data_nasc) {
		this.data_nasc = data_nasc;
	}
	
	public String toString() {
	    return "ID do Cliente: " + this.id;
	}
	
	
}
