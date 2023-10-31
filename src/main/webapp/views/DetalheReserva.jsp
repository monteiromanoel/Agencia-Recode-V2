<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Recode Viagens - Confirmação de Reserva</title>

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

<script src="./assets/js/scriptDetalheReserva.js"></script>

<script>
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

<%
int clienteID = (int) session.getAttribute("clienteID");
%>



</head>
<body>

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
								<li class="nav-item"><a href="/Agencia-Viagem-V2/Reservas"
									class="nav-link"><i class="fas fa-book"></i> Reservas</a></li>
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
					<h1 class="mb-3">#Reserva</h1>
					<h4 class="mb-3">Verifique os dados de sua reserva</h4>
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
									<div class="col-xxl-5">
										
										<form class="mx-1 my-3 mx-md-4" action="ConfirmaReserva"
											id="formReserva" method="post">
											<jstl:forEach items="${destino}" var="viagem">
												<p class="text-center h2 fw-bold mb-5 mt-4">
												<input type="hidden" name="preco" value="${viagem.preco}">
												<input type="hidden" name="id" value="${viagem.id}">
													Seu Destino: <span style="color: #8AA6A3 !important;">${viagem.destino}
														- ${viagem.localidade}</span>
												</p>
												<ul class="list-group">
													<li class="list-group-item">Data da Ida:
														<span class="dataConvert">${viagem.data_ida}</span></li>
													<li class="list-group-item">Data da Volta:
														<span class="dataConvert">${viagem.data_volta}</span></li>
													<li class="list-group-item">Adicional do Pacote:
														${viagem.adicional}</li>
													<li class="list-group-item">Tipo do Pacote:
														${viagem.tipo_pacote}</li>
													<li class="list-group-item">Preço: R$<span
														class="preco">${viagem.preco}</span></li>
													<li class="list-group-item d-flex justify-content-start">Número
														de Passageiros: <input type="number"
														class="form-control w-25 mx-2" required
														id="num_passageiros" min="1" value="1"
														name="num_passageiros" >
														<button type="button" class="btn btn-warning text-white mx-2" onclick="calcularTotal()">Calcular Total</button>
													</li>
													<li class="list-group-item">Total: <span id="total">R$0,00</span></li>
												</ul>
											<hr class="mt-3">
											</jstl:forEach>
											<jstl:forEach items="${clienteList}" var="usuario">
												<p class="text-center h2 fw-bold mb-5 mt-4">
													Seus Dados: <span style="color: #8AA6A3 !important;">${usuario.nome}
													</span>
												</p>

												<ul class="list-group">
													<li class="list-group-item">E-mail: ${usuario.email}</li>
													<li class="list-group-item">Endereço:
														${usuario.logradouro}, CEP: ${usuario.cep}</li>
													<li class="list-group-item">Cidade:
														${usuario.cidade}/${usuario.uf}</li>
													<li class="list-group-item">Telefone:
														${usuario.telefone}</li>
													<li class="list-group-item">Documento:
														${usuario.documento}</li>
													<li class="list-group-item">Data de Nascimento: <span
														id="dataNascimento">${usuario.data_nasc}</span></li>
												</ul>
											</jstl:forEach>
											<div class="py-3 d-flex justify-content-center">
												<button href="ConfirmaReserva" class="btn btn-success">Confirmar Reserva</button>
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
