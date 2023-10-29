<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Recode Viagens</title>

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

<link rel="stylesheet" href="../assets/css/style.css">

<link rel="shortcut icon" href="../assets/image/favicon.ico"
	type="image/x-icon">

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
</script>

<%
int clienteID = (int) session.getAttribute("clienteID");
%>
</head>

<body>
	<div class="toast align-items-center avisoPerfil" id="avisoPerfil"
		style="display: none;" aria-live="assertive" aria-atomic="true"
		role="alert">
		<div class="toast-body bg-success text-white">Dados atualizados
			com sucesso! Clique para fechar.</div>
	</div>
	<!-- Menu Principal-->
	<header class="container">
		<nav
			class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary shadow-sm"
			id="menu">
			<div class="container-fluid">
				<a href="#" class="navbar-brand fs-2"> <img
					src="../assets/image/voo-de-aviao.png" width="50" height="50"
					alt=""> Recode Viagens
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
						<li class="nav-item"><a href="#" class="nav-link active">
								<i class="fas fa-home"></i> Página Principal
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

						<c:choose>
							<c:when test="${empty sessionScope.clienteID}">
								<li class="nav-item"><a href="../cadastro.html"
									class="nav-link"><i class="fas fa-user-edit"></i> Cadastro</a>
								</li>
								<li class="nav-item"><a href="../login.html"
									class="nav-link"><i class="fas fa-sign-in-alt"></i> Login</a></li>
							</c:when>
							<c:otherwise>
								<li class="nav-item"><a href="/Agencia-Viagem-V2/Perfil"
									class="nav-link"><i class="fas fa-user"></i> Perfil</a></li>
								<li class="nav-item"><a href="/Agencia-Viagem-V2/Reservas"
									class="nav-link"><i class="fas fa-book"></i> Reservas</a></li>
								<li class="nav-item"><a href="/Agencia-Viagem-V2/Logout"
									class="nav-link"><i class="fas fa-sign-out-alt"></i> Sair</a></li>
							</c:otherwise>
						</c:choose>

					</ul>
				</div>
			</div>
		</nav>
	</header>

	<main class="container-fluid"
		style="padding-left: 0; padding-right: 0;">
		<!-- Campo de Pesquisa de Viagens -->
<!-- 		<section -->
<!-- 			class="container-fluid bg-image p-5 text-center shadow-1-strong rounded mb-5 text-white imagemPrincipal"> -->
<!-- 			<h1 class="mb-3 my-5 h2">Encontre sua viagem dos sonhos!</h1> -->
<!-- 			<form action="Pesquisar" method="post"> -->
<!-- 				<div class="input-group row"> -->
<!-- 					<div class="form-group mb-3"> -->
<!-- 						<div class="col-md-6 offset-md-3"> -->
<!-- 							<input type="text" name="pesquisaDestino" class="form-control" -->
<!-- 								placeholder=" Insira o DESTINO"> -->
<!-- 						</div> -->
<!-- 						<br> <button type="submit" -->
							
<!-- 							class="btn btn-warning shadow"> Buscar Pacotes de Viagem </button> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</form> -->
<!-- 		</section> -->

		<!-- Sessão de Avisos -->
		<section class="container" style="margin-top: 64px!important;">
			<div class="row ml-5 mr-5 mx-auto" id="conteudoAvisos">
				<a class="col btn m-3 p-2 border rounded shadow aviso"
					href="/Agencia-Viagem-V2/Promocoes"> <i class="fas fa-tags fs-2"></i>
					<h5 class="text-white fs-4">Promoções</h5>
					<p>Promoções exclusivas</p>
				</a> <a class="col btn m-3 border rounded p-2 shadow aviso"
					href="/Agencia-Viagem-V2/Destinos"> <i class="fas fa-umbrella-beach fs-2"></i>
					<h5 class="text-white fs-4">Melhores Localizações</h5>
					<p>Para descansar e se divertir</p>
				</a> <a class="col btn m-3 border rounded p-2 shadow aviso"> <i
					class="fas fa-percent fs-2"></i>
					<h5 class="text-white fs-4">Parcelamento</h5>
					<p class="m-0">Viagens em até 10x sem juros*</p> <span
					class="text-muted m-0 p-0">* consulte condições</span>
				</a> <a class="col btn m-3 border rounded p-2 shadow aviso"> <i
					class="fas fa-handshake fs-2"></i>
					<h5 class="text-white fs-4">Viagens de Negócios</h5>
					<p>Várias opções empresariais</p>
				</a>
			</div>
		</section>

		<div id="carouselExampleCaptions" class="container-sm carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active" data-bs-interval="5000">
					<img src="../assets/image/netherlands-1-1.jpg"
						class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<div class="carouselText">
							<h5>Viaje para a Holanda!</h5>
							<p>Visite os locais históricos e as paisagens monumentais</p>
						</div>
					</div>
				</div>
				<div class="carousel-item" data-bs-interval="5000">
					<img src="../assets/image/ny-1.jpg" class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<div class="carouselText">
							<h5>Visite Nova York!</h5>
							<p>Aproveite os pontos turísticos, parques, museus e vá às
								compras</p>
						</div>
					</div>
				</div>
				<div class="carousel-item" data-bs-interval="5000">
					<img src="../assets/image/japao-1.jpg" class="d-block w-100"
						alt="...">
					<div class="carousel-caption d-none d-md-block">
						<div class="carouselText">
							<h5>Visite o Japão</h5>
							<p>Aproveite as cidades que não param ou a calma dos campos e
								palácios japoneses.</p>
						</div>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</main>

	<!-- Newsletter -->
	<section class="container p-4">
		<div
			class="form-control row d-flex justify-content-center p-3 bg-info bg-image img-fluid shadow"
			id="newsletterIndex">
			<h class="text-center text-white fw-semibold fs-4 textoEmail">Receba
			Ofertas por E-mail</h>
			<div class="input-group p-3">
				<input type="email" class="form-control rounded"
					placeholder="Insira seu melhor e-mail aqui!"
					aria-label="Insira seu melhor e-mail aqui!"
					aria-describedby="search-addon" />
				<button type="submit" class="btn btn-lg btn-primary">Enviar</button>
			</div>
		</div>
	</section>

	<hr class="mt-4">

	<footer>
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
						src="../assets/image/payment-method.jpg"
						alt="Métodos de Pagamento" style="width: 300px; height: 100px;">
					</span>
				</div>
			</div>
			<div class="container text-center my-3">
				<p>&copy; 2023, Manoel - Todos os Direitos Reservados à Recode
					Viagens</p>
			</div>
		</section>
	</footer>
</body>

</html>