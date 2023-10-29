<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Recode Viagens - Detalhe</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
	crossorigin="anonymous"></script>

<script async src="./assets/js/scriptDetalhes.js"></script>


<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">

<link rel="stylesheet" href="./assets/css/style.css">

<link rel="stylesheet" href="./assets/css/estiloDestinos.css">

<link rel="stylesheet" href="./assets/css/estiloDetalhes.css">


<link rel="shortcut icon" href="./assets/image/favicon.ico"
	type="image/x-icon">

</head>
<body>

	<!-- Menu Principal-->
	<header class="container">
		<nav
			class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary shadow-sm"
			id="menu">
			<div class="container-fluid">
				<jstl:choose>
					<jstl:when test="${empty sessionScope.clienteID}">
						<a href="./Index.jsp" class="navbar-brand fs-2"> <img
							src="./assets/image/voo-de-aviao.png" width="50" height="50"
							alt=""> Recode Viagens
						</a>

					</jstl:when>
					<jstl:otherwise>
						<a href="./views/IndexLogado.jsp" class="navbar-brand fs-2"> <img
							src="./assets/image/voo-de-aviao.png" width="50" height="50"
							alt=""> Recode Viagens
						</a>
					</jstl:otherwise>
				</jstl:choose>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse flex-row-reverse"
					id="navbarContent">
					<ul class="navbar-nav d-flex align-items-center">
						<jstl:choose>
							<jstl:when test="${empty sessionScope.clienteID}">
								<li class="nav-item"><a href="./Index.jsp" class="nav-link">
										<i class="fas fa-home"></i> Página Principal
								</a></li>

							</jstl:when>
							<jstl:otherwise>
								<li class="nav-item"><a href="./views/IndexLogado.jsp"
									class="nav-link"> <i class="fas fa-home"></i> Página
										Principal
								</a></li>
							</jstl:otherwise>
						</jstl:choose>
						<li class="nav-item"><a href="Destinos" class="nav-link">
								<i class="fas fa-map-marked-alt"></i> Destino
						</a></li>
						<li class="nav-item"><a href="Promocoes"
							class="nav-link active"> <i class="fas fa-tags"></i>
								Promoções
						</a></li>
						<li class="nav-item"><a
							href="/Agencia-Viagem-V2/views/Contato.jsp" class="nav-link"><i
								class="fas fa-phone"></i> Contato</a></li>
						<jstl:choose>
							<jstl:when test="${empty sessionScope.clienteID}">
								<li class="nav-item"><a href="./cadastro.html"
									class="nav-link"><i class="fas fa-user-edit"></i> Cadastro</a>
								</li>
								<li class="nav-item"><a href="./login.html"
									class="nav-link"><i class="fas fa-sign-in-alt"></i> Login</a></li>
							</jstl:when>
							<jstl:otherwise>
								<li class="nav-item"><a href="Perfil" class="nav-link"><i
										class="fas fa-user"></i> Perfil</a></li>
								<li class="nav-item"><a href="Reservas"
									class="nav-link"><i class="fas fa-book"></i> Reservas</a></li>
								<li class="nav-item"><a href="Logout" class="nav-link"><i
										class="fas fa-sign-out-alt"></i> Sair</a></li>
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
					<h1 class="mb-3">Promoções Imperdíveis</h1>
					<h4 class="mb-3">Viagens com as melhores condições e os
						melhores preços!</h4>
				</div>
			</div>
		</div>
	</div>

	<!-- Área Principal -->
	<main class="container-fluid">
		<section class="container">

			<form class="input-group" action="Pesquisar" method="post">
				<input type="search" class="form-control my-4"
					placeholder="Pesquisar Destinos" name="pesquisaDestino"
					aria-label="Pesquisar Destinos" aria-describedby="search-addon" />
				<button type="submit" class="btn btn-primary my-4">Pesquisar</button>
			</form>

			<jstl:forEach items="${destino}" var="viagem">
				<h2 class="text-primary">Detalhes do Pacote</h2>
				<section id="proDetails" class="section-p1">
					<div class="single-pro-image" id="imageContainer">
						<img src="${viagem.imagem}" width="100%" id="mainImage" alt=""
							class="img-fluid">
						<div class="small-img-group my-2">
							<div class="small-img-col">
								<img src="${viagem.imagem}" width="100%" class="small-img"
									alt="" class="img-fluid">
							</div>
							<div class="small-img-col">
								<img src="${viagem.imagem2}" width="100%" class="small-img"
									alt="" class="img-fluid">
							</div>
							<div class="small-img-col">
								<img src="${viagem.imagem3}" width="100%" class="small-img"
									alt="" class="img-fluid">
							</div>
							<div class="small-img-col">
								<img src="${viagem.imagem4}" width="100%" class="small-img"
									alt="" class="img-fluid">
							</div>
						</div>

					</div>

					<div class="single-pro-details">
						<h4>${viagem.destino}- ${viagem.localidade}</h4>

						<h4 class="my-3" style="color: #127369 !important;">Informações
							Adicionais</h4>
						<p>${viagem.descricao_longa}</p>

						<h2 class="text-primary">
							De: <span class="fs-2 valorAntigo"> <fmt:formatNumber
									value="${viagem.preco_antigo}" type="currency"
									currencySymbol="R$ " />
							</span>
						</h2>

						<h2 class="text-primary">
							<span class="fs-2">Por: <fmt:formatNumber
									value="${viagem.preco}" type="currency" currencySymbol="R$ " />
							</span> <span class="fs-4 text-success"> em até 10x</span> <br>
						</h2>
						<a href="VerificarDados?id=${viagem.id}" class="btn btn-success p-2 border-0 text-white rounded">Prosseguir
							para Reserva</a>
					</div>
				</section>
			</jstl:forEach>

		</section>

	</main>

	<!-- Newsletter -->
	<section class="container p-4 mt-2">
		<div
			class="form-control row d-flex justify-content-center p-3 bg-info bg-image img-fluid"
			id="newsletter">
			<h5 class="text-center">
				<mark>Receba Ofertas por E-mail</mark>
			</h5>
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

</body>
</html>