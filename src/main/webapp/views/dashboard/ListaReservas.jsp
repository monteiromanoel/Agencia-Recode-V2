<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADM - Lista de Reservas</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">

<link rel="stylesheet" href="./views/dashboard/css/estiloDash.css">

<script src="./views/dashboard/js/deleteReserva.js"></script>

<script>
	document.addEventListener('DOMContentLoaded', function() {
		// Função para obter os parâmetros da URL
		function obterParametrosUrl() {
			var params = {};
			window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(
					str, key, value) {
				params[key] = value;
			});
			return params;
		}

		var parametros = obterParametrosUrl();
		if (parametros.atualizado === 'true') {
			var aviso = document.getElementById('avisoPerfil');
			aviso.style.display = 'block';
			aviso.addEventListener('click', function() {
				aviso.style.display = 'none';
				var urlSemParametro = window.location.href.split('?')[0];
				window.history
						.replaceState({}, document.title, urlSemParametro);
			});

			// Define um temporizador para esconder o aviso após 5 segundos (5000 milissegundos)
			setTimeout(function() {
				aviso.style.display = 'none';
				var urlSemParametro = window.location.href.split('?')[0];
				window.history
						.replaceState({}, document.title, urlSemParametro);
			}, 5000);
		}
	});
	
	document.addEventListener("DOMContentLoaded", function() {
	    var dataConvertElements = document.querySelectorAll('.dataConvert');

	    dataConvertElements.forEach(function(element) {
	        var dataSQL = element.textContent;
	        var partesData = dataSQL.split('-');
	        var dataFormatada = partesData[2] + '/' + partesData[1] + '/' + partesData[0];
	        element.textContent = dataFormatada;
	    });
	});
</script>

</head>
<body>

	<div class="toast align-items-center avisoPerfil" id="avisoPerfil"
		style="display: none;" aria-live="assertive" aria-atomic="true"
		role="alert">
		<div class="toast-body bg-success text-white">Dados atualizados
			com sucesso! Clique para fechar.</div>
	</div>
	<div class="container-fluid overflow-hidden">
		<header class="container">
			<nav class="navbar navbar-expand-lg fixed-top navbar-dark shadow-sm"
				id="menu">
				<div class="container-fluid">
					<a href="./views/dashboard/Dashboard.jsp" class="navbar-brand">
						Adm - Recode Viagens </a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse flex-row-reverse"
						id="navbarContent">
						<ul class="navbar-nav d-flex align-items-center">
							<li class="nav-item"><a
								href="./views/dashboard/Dashboard.jsp" class="nav-link"> <i
									class="fas fa-home"></i> Home
							</a></li>

							<li class="dropdown"><a href="#"
								class="nav-link dropdown-toggle" id="dropdown"
								data-bs-toggle="dropdown" aria-expanded="false"> <i
									class="fas fa-users"></i><span class="ms-1 d-none d-sm-inline">Usuários</span>
							</a>
								<ul class="dropdown-menu dropdown-menu-dark text-small shadow"
									aria-labelledby="dropdown">
									<li><a class="dropdown-item"
										href="/Agencia-Viagem-V2/ListarUsuarios">Listar</a></li>
									<li><a class="dropdown-item" href="./views/dashboard/CadastroCliente.jsp">Cadastrar</a></li>
								</ul></li>

							<li class="dropdown"><a href="#"
								class="nav-link dropdown-toggle" id="dropdown"
								data-bs-toggle="dropdown" aria-expanded="false"> <i
									class="fs-5 fas fa-map-marked"></i><span
									class="ms-1 d-none d-sm-inline">Destinos</span>
							</a>
								<ul class="dropdown-menu dropdown-menu-dark text-small shadow"
									aria-labelledby="dropdown">
									<li><a class="dropdown-item" href="/Agencia-Viagem-V2/ListarDestinos">Listar</a></li>
									<li><a class="dropdown-item" href="./views/dashboard/CadastroDestino.jsp">Cadastrar</a></li>
								</ul></li>

							<li class="dropdown"><a href="#"
								class="nav-link dropdown-toggle active" id="dropdown"
								data-bs-toggle="dropdown" aria-expanded="false"> <i
									class="fs-4 fas fa-suitcase-rolling"></i><span
									class="ms-1 d-none d-sm-inline">Reservas</span>
							</a>
								<ul class="dropdown-menu dropdown-menu-dark text-small shadow"
									aria-labelledby="dropdown">
									<li><a class="dropdown-item" href="#">Listar</a></li>
									<li><a class="dropdown-item" href="/Agencia-Viagem-V2/CadastroReservaAdm">Cadastrar</a></li>
								</ul></li>
							<li class="nav-item"><a href="/Agencia-Viagem-V2/index.html"
								class="nav-link"  target="_blank"> <i class="fas fa-external-link-alt"></i>
									Ver Loja
							</a></li>

							<li class="nav-item"><a href="#" class="nav-link"> <i
									class="fas fa-sign-out-alt"></i> Sair
							</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</header>
		<div class="container-fluid conteudo">
			<main>
				<h1>Lista de Reservas</h1>
				<form>
					<div class="table-responsive">
						<table class="table table-hover text-center">
							<thead>
								<tr>
									<td scope="col" class="headerTable text-white">Id Reserva</td>
									<td scope="col" class="headerTable text-white">Id Cliente</td>
									<td scope="col" class="headerTable text-white">Id Pacote</td>
									<td scope="col" class="headerTable text-white">Data da
										Reserva</td>
									<td scope="col" class="headerTable text-white">Nº de Passageiros</td>
									<td scope="col" class="headerTable text-white">Valor Final</td>
								</tr>
							</thead>
							<jstl:forEach items="${reservas}" var="reserva">
								<tbody>
									<tr scope="row">
										<td>${reserva.id}</td>
										<td>${reserva.idCliente.id}</td>
										<td>${reserva.idViagem.id}</td>
										<td><span class="dataConvert">${reserva.data_reserva}</span></td>
										<td>${reserva.num_passageiros}</td>
										<td><fmt:formatNumber value="${reserva.preco}"
												type="currency" currencyCode="BRL" /></td>
										<td>
											<div class="d-flex justify-content-center">
												<!-- Modificar o caminho antes de ? para o servlet correto -->
												<a
													href="/Agencia-Viagem-V2/DetalheReservaAdm?idReserva=${reserva.id}&idCliente=${reserva.idCliente.id}&idViagem=${reserva.idViagem.id}"
													style="cursor: pointer;"
													class="text-white bg-primary px-2 py-1 rounded"
													data-toggle="tooltip" data-placement="top"
													title="Ver Detalhes"> <i class="fas fa-eye"></i>
												</a>
												<!-- Modificar o caminho antes de ? para o servlet correto -->
												<a
													href="/Agencia-Viagem-V2/VerDadosReserva?idReserva=${reserva.id}&idCliente=${reserva.idCliente.id}&idViagem=${reserva.idViagem.id}"
													style="cursor: pointer;"
													class="text-white bg-info px-2 py-1 rounded mx-2"
													data-toggle="tooltip" data-placement="top"
													title="Editar Cliente"> <i class="fas fa-user-edit"></i>
												</a>
												<!-- Modificar o caminho antes de ? para o servlet correto -->
												<a href="#" onclick="confirmarDeletar(${reserva.id})"
													style="cursor: pointer;"
													class="text-white bg-danger px-2 py-1 rounded"
													data-toggle="tooltip" data-placement="top"
													title="Excluir Cliente"> <i class="fas fa-window-close"></i>
												</a>
											</div>
										</td>
									</tr>
								</tbody>
							</jstl:forEach>
						</table>
					</div>
				</form>
			</main>


		</div>
	</div>
	<footer class="row container-fluid footer">
		<div class="col col-md-8">&reg; Recode Viagens - 2023</div>
		<div class="col col-6 col-md-4 d-flex justify-content-end">Versão
			- 2.0</div>
	</footer>
</body>
</html>