<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Recode Viagens - Reservas </title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">

<link rel="stylesheet" href="./assets/css/style.css">

<link rel="shortcut icon" href="./assets/image/favicon.ico"
	type="image/x-icon">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="./assets/js/scriptDeleteReserva.js"></script>

<%
int clienteID = (int) session.getAttribute("clienteID");
%>

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
		if (parametros.reservaConfirmada === 'true') {
			var aviso = document.getElementById('avisoReserva');
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
	<div class="toast align-items-center avisoPerfil" id="avisoReserva"
		style="display: none;" aria-live="assertive" aria-atomic="true"
		role="alert">
		<div class="toast-body bg-success text-white">Reserva confirmada
			com sucesso! Clique para fechar.</div>
	</div>

	<!-- Menu Principal-->
	<header class="container">
		<nav
			class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary shadow-sm"
			id="menu">
			<div class="container-fluid">
				<a href="./views/IndexLogado.jsp" class="navbar-brand fs-2"> <img
					src="./assets/image/voo-de-aviao.png" width="50" height="50" alt="">
					Recode Viagens
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse flex-row-reverse"
					id="navbarContent">
					<ul class="navbar-nav d-flex align-items-center">
						<li class="nav-item"><a href="./views/IndexLogado.jsp"
							class="nav-link"> <i class="fas fa-home"></i> Página
								Principal
						</a></li>

						<li class="nav-item"><a href="/Agencia-Viagem-V2/Destinos"
							class="nav-link"> <i class="fas fa-map-marked-alt"></i>
								Destino
						</a></li>
						<li class="nav-item"><a href="/Agencia-Viagem-V2/Promocoes"
							class="nav-link"> <i class="fas fa-tags"></i> Promoções
						</a></li>
						<li class="nav-item"><a
							href="/Agencia-Viagem-V2/views/Contato.jsp" class="nav-link"><i
								class="fas fa-phone"></i> Contato</a></li>

						<jstl:choose>
							<jstl:when test="${empty sessionScope.clienteID}">
								<li class="nav-item"><a href="../cadastro.html"
									class="nav-link"><i class="fas fa-user-edit"></i> Cadastro</a>
								</li>
								<li class="nav-item"><a href="../login.html"
									class="nav-link"><i class="fas fa-sign-in-alt"></i> Login</a></li>
							</jstl:when>
							<jstl:otherwise>
								<li class="nav-item"><a href="/Agencia-Viagem-V2/Perfil" class="nav-link"><i
										class="fas fa-user"></i> Perfil</a></li>
								<li class="nav-item"><a href="#" class="nav-link active"><i
										class="fas fa-book"></i> Reservas</a></li>
								<li class="nav-item"><a href="/Agencia-Viagem-V2/Logout"
									class="nav-link"><i class="fas fa-sign-out-alt"></i> Sair</a></li>
							</jstl:otherwise>
						</jstl:choose>

					</ul>
				</div>
			</div>
		</nav>
	</header>

	<!-- Hero -->
	<div class="text-center bg-image p-5 hero">
		<div class="mask" style="background-color: rgba(0, 0, 0, 0.6);">
			<div
				class="d-flex justify-content-center align-items-center h-100 w-100">
				<div class="text-white">
					<h1 class="mb-3">Suas Reservas</h1>
					<h4 class="mb-3">Veja suas reservas</h4>
				</div>
			</div>
		</div>
	</div>

	<!-- Área Principal -->
	<main class="container-fluid mb-6">
		<section class="vh-75 mt-5">
			<div class="container h-100">
				<div
					class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-lg-12 col-xl-11">
						<div class="card text-black" style="border-radius: 25px;">
							<div class="card-body p-md-5">
								<div class="row justify-content-center">
									<div>
										<form>
											<div class="table-responsive">
												<table class="table table-hover text-center">
													<thead>
														<tr>
															<td scope="col" class="bg-info text-white">Id
																Reserva</td>
															<td scope="col" class="bg-info text-white">Id
																Cliente</td>
															<td scope="col" class="bg-info text-white">Id Pacote</td>
															<td scope="col" class="bg-info text-white">Data da
																Reserva</td>
															<td scope="col" class="bg-info text-white">Número de
																Passageiros</td>
															<td scope="col" class="bg-info text-white">Preço
																Final</td>
														</tr>
													</thead>
													<jstl:forEach items="${Reserva}" var="reserva">
														<tbody>
															<tr scope="row">
																<td>${reserva.id}</td>
																<td>${reserva.idCliente.id}</td>
																<td>${reserva.idViagem.id}</td>
																<td><span class="dataConvert">${reserva.data_reserva}</span></td>
																<td>${reserva.num_passageiros}</td>
																<td><fmt:formatNumber value="${reserva.preco}" type="currency" currencyCode="BRL" /></td>
																<td>
																	<div class="d-flex justify-content-end">
																		<a
																		href="DadosReserva?idReserva=${reserva.id}&idPacote=${reserva.idViagem.id}"
																		style="cursor: pointer;"
																		class="text-white bg-primary px-2 py-1 rounded mx-2"
																		data-toggle="tooltip" data-placement="top"
																		title="Ver Detalhes"> <i class="fas fa-eye"></i></a> 
																		<a
																		href="#" onclick="confirmarDeletar(${reserva.id})"
																		style="cursor: pointer;"
																		class="text-white bg-danger px-2 py-1 rounded"
																		data-toggle="tooltip" data-placement="top"
																		title="Cancelar Reserva"> <i
																			class="fas fa-window-close"></i>
																		</a>
																	</div>
																</td>
															</tr>
														</tbody>
													</jstl:forEach>
												</table>
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

	<hr class="mt-4">

	<footer class="mt-5">
		<section class="container-fluid my-4">
			<div class="row">
				<div class="col mb-4">
					<h5>Recode Viagens</h5>
					<p>
						<span class="fw-semibold">Endereço: </span>Avenida das Viagens,
						100 - São Paulo, SP. CEP: 08123-456
					</p>
					<p>
						<span class="fw-semibold">Tel.:</span> (11)4321-1234 /
						(11)91234-5678
					</p>
					<p>
						<span class="fw-semibold">E-mail: </span>
						RecodeViagens@viagens.com.br
					</p>
				</div>

				<div class="col mb-4">
					<h5>Sobre</h5>
					<p>
						<a href="#" class="linksFooter fw-semibold">Sobre nós</a>
					</p>
					<p>
						<a href="#" class="linksFooter fw-semibold">Política de
							Privacidade</a>
					</p>
					<p>
						<a href="#" class="linksFooter fw-semibold">Termos e Condições</a>
					</p>
					<p>
						<a href="#" class="linksFooter fw-semibold">Entre em Contato</a>
					</p>
				</div>

				<div class="col mb-4">
					<h4>Siga-nos</h4>
					<div class="fs-2">

						<i class="fab fa-instagram redeSocial mx-1"></i> <i
							class="fab fa-facebook-f redeSocial mx-1"></i> <i
							class="fab fa-twitter redeSocial mx-1"></i> <i
							class="fab fa-tiktok redeSocial mx-1"></i>

					</div>
				</div>

				<div class="col">
					<h5>Formas de Pagamento</h5>
					<span class="bg-image"> <img
						src="./assets/image/payment-method.jpg" alt="Métodos de Pagamento"
						style="width: 300px; height: 100px;">
					</span>
				</div>
			</div>
			<div class="container text-center my-3">
				<p>&copy; 2023, Manoel - Todos os Direitos Reservados à Recode
					Viagens</p>
			</div>
		</section>
	</footer>

	<script src="./assets/js/plugins/jquery-mask/jquery.mask.min.js"></script>
	<script src="./assets/js/plugins/select2/js/select2.full.min.js"></script>
</body>
</html>