document.addEventListener('DOMContentLoaded', function() {
	var dataNascimentoElement = document
		.getElementById('dataNascimento');
	var dataSQL = dataNascimentoElement.textContent.trim();
	var dataPadrao = converterDataFormato(dataSQL);
	dataNascimentoElement.textContent = dataPadrao;
});

function converterDataFormato(data) {
	var partes = data.split('-');
	var novaData = partes[2] + '/' + partes[1] + '/' + partes[0];
	return novaData;
}

function formatarPreco(preco) {
    return preco.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' });
}

function calcularTotal() {
	console.log("Função calcularTotal() chamada.");
	var precoString = document.querySelector('.preco').textContent;
	var preco = parseFloat(precoString.replace('R$', '').replace(',',
		'.'));

	var numPassageiros = parseInt(document
		.getElementById('num_passageiros').value);

	if (isNaN(preco) || isNaN(numPassageiros)) {
		document.getElementById('total').textContent = 'R$0,00';
		return;
	}

	var resultado = preco * numPassageiros;

	var totalElement = document.getElementById('total');
	totalElement.textContent = 'R$'
		+ resultado.toFixed(2).replace('.', ',');
}