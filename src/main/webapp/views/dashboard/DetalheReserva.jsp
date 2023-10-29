<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADM - Detalhe da Reserva</title>

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

<script>
	document.addEventListener("DOMContentLoaded", function() {
		var dataConvertElements = document.querySelectorAll('.dataConvert');

		dataConvertElements.forEach(function(element) {
			var dataSQL = element.textContent;
			var partesData = dataSQL.split('-');
			var dataFormatada = partesData[2] + '/' + partesData[1] + '/'
					+ partesData[0];
			element.textContent = dataFormatada;
		});
	});
</script>

<style>
</style>

</head>
<body>
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
									<li><a class="dropdown-item"
										href="./views/dashboard/CadastroCliente.jsp">Cadastrar</a></li>
								</ul></li>

							<li class="dropdown"><a href="#"
								class="nav-link dropdown-toggle" id="dropdown"
								data-bs-toggle="dropdown" aria-expanded="false"> <i
									class="fs-5 fas fa-map-marked"></i><span
									class="ms-1 d-none d-sm-inline">Destinos</span>
							</a>
								<ul class="dropdown-menu dropdown-menu-dark text-small shadow"
									aria-labelledby="dropdown">
									<li><a class="dropdown-item"
										href="/Agencia-Viagem-V2/ListarDestinos">Listar</a></li>
									<li><a class="dropdown-item" href="./CadastroDestino.jsp">Cadastrar</a></li>
								</ul></li>

							<li class="dropdown"><a href="#"
								class="nav-link dropdown-toggle active" id="dropdown"
								data-bs-toggle="dropdown" aria-expanded="false"> <i
									class="fs-4 fas fa-suitcase-rolling"></i><span
									class="ms-1 d-none d-sm-inline">Reservas</span>
							</a>
								<ul class="dropdown-menu dropdown-menu-dark text-small shadow"
									aria-labelledby="dropdown">
									<li><a class="dropdown-item" href="/Agencia-Viagem-V2/ListarReservas">Listar</a></li>
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
		<div class="container-fluid mb-3 conteudo">

			<main class="col pt-2 pb-4">
				<jstl:forEach items="${reserva}" var="reserva">
					<h1>Dados da Reserva</h1>
					<hr>
					<div class="col-lg-8 mx-auto">
						<div class="card mb-4">
							<div class="card-body">
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">ID</p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0">${reserva.id}</p>
									</div>
								</div>
								
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">Cliente</p>
									</div>
									<div class="col-sm-9">
									<jstl:forEach items="${clienteR}" var="cliente">
										<p class="text-muted mb-0">${cliente.nome}</p>
									</jstl:forEach>
									</div>
								</div>
								<hr>
								
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">Destino</p>
									</div>
									<div class="col-sm-9">
									<jstl:forEach items="${viagemR}" var="destino">
										<p class="text-muted mb-0">${destino.destino}-
											${destino.localidade}</p>
									</jstl:forEach>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">Data da Reserva</p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0">
											<span class="dataConvert">${reserva.data_reserva}</span>
										</p>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">Número de Passageiros</p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0">
											${reserva.num_passageiros}
										</p>
									</div>
								</div>
								<hr>
						
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">Valor Final</p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0">
											<fmt:formatNumber value="${reserva.preco}" type="currency"
												currencyCode="BRL" />
										</p>
									</div>
								</div>
								<hr>
							</div>
						</div>
					</div>
				</jstl:forEach>

				<div class="d-flex justify-content-center my-3">
					<a href="/Agencia-Viagem-V2/ListarReservas"
						class="btn btn-lg btn-success"> Voltar </a>
				</div>
			</main>


		</div>
	</div>
	<footer class="row container-fluid footer mt-3">
		<div class="col col-md-8">&reg; Recode Viagens - 2023</div>
		<div class="col col-6 col-md-4 d-flex justify-content-end">Versão
			- 2.0</div>
	</footer>


</body>
</html>