package model;

import java.util.Date;

public class Reserva {
	private int id;
	private int num_passageiros;
	private Date data_reserva;
	private Double preco;
	private Cliente idCliente;
	private Viagem idViagem;
	
	public Reserva() {
		this.preco = 0.0;
	};
	public Cliente getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(Cliente idCliente) {
		this.idCliente = idCliente;
	}
	
	public Viagem getIdViagem() {
		return idViagem;
	}
	public void setIdViagem(Viagem idViagem) {
		this.idViagem = idViagem;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getNum_passageiros() {
		return num_passageiros;
	}
	public void setNum_passageiros(int num_passageiros) {
		this.num_passageiros = num_passageiros;
	}
	public Date getData_reserva() {
		return data_reserva;
	}
	public void setData_reserva(Date data_reserva) {
		this.data_reserva = data_reserva;
	}
	public Double getPreco() {
		return preco;
	}
	public void setPreco(Double preco) {
		this.preco = preco;
	}
	
	public Double calcularPrecoFinal(int num_passageiros) {
		return this.preco * num_passageiros;
	}

	
	
}
