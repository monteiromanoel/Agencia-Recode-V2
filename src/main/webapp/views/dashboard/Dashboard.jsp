<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard ADM</title>

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

<link rel="stylesheet" href="./css/estiloDash.css">

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
			}, 5000000);
		}
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
					<a href="#" class="navbar-brand"> Adm - Recode Viagens </a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse flex-row-reverse"
						id="navbarContent">
						<ul class="navbar-nav d-flex align-items-center">
							<li class="nav-item"><a href="#" class="nav-link active">
									<i class="fas fa-home"></i> Home
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
									<li><a class="dropdown-item" href="./CadastroCliente.jsp">Cadastrar</a></li>
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
									<li><a class="dropdown-item" href="./CadastroDestino.jsp">Cadastrar</a></li>
								</ul></li>

							<li class="dropdown"><a href="#"
								class="nav-link dropdown-toggle" id="dropdown"
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
								class="nav-link" target="_blank"> <i class="fas fa-external-link-alt"></i>
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
		<div class="container-fluid conteudo mb-3">
			<main class="row overflow-auto mb-3">
				<div class="col pt-4 pb-4">
					<h1>Dashboard de Administrador</h1>
					<p class="lead">Acesse os campos por aqui ou pelo menu</p>
					<hr />
					
					<div class="row d-flex flex-wrap justify-content-center my-3">
					  <div class="col-sm-5 mb-3">
					    <div class="card">
					      <div class="card-body">
					        <h5 class="card-title">Clientes</h5>
					        <p class="card-text">Acesse dados referentes aos clientes. Atualize, delete ou cadastre novos</p>
					        <div class="d-flex justify-content-center">
					         	<a href="/Agencia-Viagem-V2/ListarUsuarios" class="btn btn-primary mx-2">Lista de Clientes</a>
					        	<a href="./CadastroCliente.jsp" class="btn btn-primary mx-2">Cadastro de Cliente</a>
					        </div>
					       
					      </div>
					    </div>
					  </div>
					  <div class="col-sm-5">
					    <div class="card">
					      <div class="card-body">
					        <h5 class="card-title">Destinos</h5>
					        <p class="card-text">Acesse dados referentes aos destinos. Atualize, delete ou cadastre novos</p>
					        <div class="d-flex justify-content-center">
					         	<a href="/Agencia-Viagem-V2/ListarDestinos" class="btn btn-primary mx-2">Lista de Destinos</a>
					        	<a href="./CadastroDestino.jsp" class="btn btn-primary mx-2">Cadastro de Destino</a>
					        </div>
					       
					      </div>
					    </div>
					  </div>
					</div>
					
					<div class="row d-flex flex-wrap justify-content-center">
					  <div class="col-sm-5">
					    <div class="card">
					      <div class="card-body">
					        <h5 class="card-title">Reservas</h5>
					        <p class="card-text">Acesse dados referentes às reservas. Atualize, delete ou cadastre novos</p>
					        <div class="d-flex justify-content-center">
					         	<a href="/Agencia-Viagem-V2/ListarReservas" class="btn btn-primary mx-2">Lista de Reservas</a>
					        	<a href="/Agencia-Viagem-V2/CadastroReservaAdm" class="btn btn-primary mx-2">Cadastro de Reserva</a>
					        </div>
					      </div>
					    </div>
					  </div>
					</div>
				</div>
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