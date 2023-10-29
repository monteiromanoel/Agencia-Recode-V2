<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADM - Cadastrar Reserva</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>

<script
	src="https://cdn.tiny.cloud/1/8svz9148gua03293my7b0e5drfls3zdv5h5b52vt4dbntdgt/tinymce/6/tinymce.min.js"
	referrerpolicy="origin"></script>

<link rel="stylesheet" href="./views/dashboard/css/estiloDash.css">

<script>
	tinymce.init({
		selector : '#textArea'
	});
</script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">





<style>
fieldset {
	background-color: #D2E8E3 !important;
}
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
								class="nav-link dropdown-toggle active" id="dropdown"
								data-bs-toggle="dropdown" aria-expanded="false"> <i
									class="fs-4 fas fa-suitcase-rolling"></i><span
									class="ms-1 d-none d-sm-inline">Reservas</span>
							</a>
								<ul class="dropdown-menu dropdown-menu-dark text-small shadow"
									aria-labelledby="dropdown">
									<li><a class="dropdown-item" href="/Agencia-Viagem-V2/ListarReservas">Listar</a></li>
									<li><a class="dropdown-item" href="#">Cadastrar</a></li>
								</ul></li>
							<li class="nav-item"><a href="/Agencia-Viagem-V2/index.html"
								class="nav-link" target="_blank"> <i
									class="fas fa-external-link-alt"></i> Ver Loja
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
			<main class="container-fluid mb-6">
				<section class="vh-75 mt-5">
					<div class="container h-100">
						<div
							class="row d-flex justify-content-center align-items-center h-100">
							<div class="col-lg-12 col-xl-11">
								<div class="card text-black" style="border-radius: 25px;">
									<div class="card-body p-md-5">
										<div class="row justify-content-center">
											<div class="col-xxl-5">
												<h1 class="text-center">Cadastrar Nova Reserva</h1>


												<form class="mx-1 mx-md-4"
													action="<%=request.getContextPath()%>/CadastroReservaAdm"
													id="formPerfil" method="post">


													<div
														class="d-flex flex-row flex-wrap align-items-center mb-4 mt-3">
														<div class="form-outline flex-fill mx-1 mb-2">
															<label class="form-label" for="idCliente">Informe
																o ID do Cliente</label> <select name="idCliente" class="form-select"
																aria-label="">
																<option selected disabled>Selecione o Cliente</option>
																<jstl:forEach items="${clientes}" var="cliente">
																	<option value="${cliente.id}">${cliente.id}-
																		${cliente.nome}</option>
																</jstl:forEach>
															</select>
														</div>

														<div class="form-outline flex-fill mb-2">
															<label class="form-label" for="idViagem">Informe
																o ID do Pacote</label> <select class="form-select"
																aria-label="" name="idViagem">
																<option selected disabled>Selecione o
																	Destino</option>
																<jstl:forEach items="${viagens}" var="viagem">
																	<option value="${viagem.id}">${viagem.id}-
																		${viagem.destino} / ${viagem.localidade}</option>
																</jstl:forEach>
															</select>

														</div>
													</div>

													<div
														class="d-flex flex-row flex-wrap align-items-center mb-4 mt-3">
														<div class="form-outline flex-fill mx-1 mb-2">
															<label class="form-label" for="num_passageiros">Número
																de Passageiros</label> <input type="number" id="num_passageiros"
																class="form-control w-25 text-center"
																name="num_passageiros"
																value="${reserva.num_passageiros}" required />
														</div>
													</div>

													<h2 class="text-center my-3">Valor final será
														calculado ao salvar a reserva</h2>



													<div
														class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
														<button type="submit" class="btn btn-success btn-lg">Cadastrar
															Dados</button>
													</div>
												</form>

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</section>
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