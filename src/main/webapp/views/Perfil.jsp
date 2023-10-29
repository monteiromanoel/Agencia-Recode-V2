<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Recode Viagens - Perfil</title>

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
								<li class="nav-item"><a href="#" class="nav-link active"><i
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
					<h1 class="mb-3">#Perfil</h1>
					<h4 class="mb-3">Verifique seus dados ou atualize-os</h4>
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

										<jstl:forEach items="${cliente}" var="usuario">
											<p class="text-center h1 fw-bold mb-5 mt-4">
												Ola! <span style="color: #8AA6A3 !important;">${usuario.nome}
												</span>
											</p>

											<form class="mx-1 mx-md-4" action="AtualizarCliente"
												id="formPerfil" method="post">

												<div class="d-flex flex-row align-items-center mb-4">
													<div class="form-outline flex-fill mb-0">
														<label class="form-label" for="nomeCliente">Seu
															Nome</label> <input type="text" id="nomeCliente"
															class="form-control" name="nome" value="${usuario.nome}"
															required />
													</div>
												</div>

												<div class="d-flex flex-row align-items-center mb-4">
													<div class="form-outline flex-fill mb-0">
														<label class="form-label" for="emailCliente">Seu
															E-mail</label> <input type="text" id="emailCliente"
															class="form-control" name="email"
															value="${usuario.email}" required />
													</div>
												</div>

												<div class="d-flex flex-row align-items-center mb-4">
													<div class="form-outline flex-fill mb-0">
														<label class="form-label" for="logradouroCliente">Endereço:
														</label> <input type="text" id="logradouroCliente"
															class="form-control" name="logradouro"
															value="${usuario.logradouro}" required />

														<div class="d-flex flex-row align-items-center my-2">
															<input type="text" id="cepCliente"
																class="form-control w-25" name="cep"
																value="${usuario.cep}" required /> <input type="text"
																id="cidadeCliente" class="form-control w-50 mx-2"
																name="cidade" value="${usuario.cidade}" required /> <select
																id="estado" class="form-control form-select w-25"
																name="uf">
																<option value="">${usuario.uf}</option>
																<option value="AC">Acre</option>
																<option value="AL">Alagoas</option>
																<option value="AP">Amapá</option>
																<option value="AM">Amazonas</option>
																<option value="BA">Bahia</option>
																<option value="CE">Ceará</option>
																<option value="DF">Distrito Federal</option>
																<option value="ES">Espírito Santo</option>
																<option value="GO">Goiás</option>
																<option value="MA">Maranhão</option>
																<option value="MT">Mato Grosso</option>
																<option value="MS">Mato Grosso do Sul</option>
																<option value="MG">Minas Gerais</option>
																<option value="PA">Pará</option>
																<option value="PB">Paraíba</option>
																<option value="PR">Paraná</option>
																<option value="PE">Pernambuco</option>
																<option value="PI">Piauí</option>
																<option value="RJ">Rio de Janeiro</option>
																<option value="RN">Rio Grande do Norte</option>
																<option value="RS">Rio Grande do Sul</option>
																<option value="RO">Rondônia</option>
																<option value="RR">Roraima</option>
																<option value="SC">Santa Catarina</option>
																<option value="SP">São Paulo</option>
																<option value="SE">Sergipe</option>
																<option value="TO">Tocantins</option>
																<option value="EX">Estrangeiro</option>
															</select>
														</div>
													</div>
												</div>

												<div class="d-flex flex-row align-items-center mb-4">
													<div class="form-outline flex-fill mb-0">
														<label class="form-label" for="telefoneCliente">Seu
															Telefone</label> <input type="text" id="telefoneCliente"
															class="form-control" name="telefone"
															value="${usuario.telefone}" required />
													</div>
												</div>

												<div class="d-flex flex-row align-items-center mb-4">
													<div class="form-outline flex-fill mb-0">
														<label class="form-label" for="documentoCliente">Seu
															Documento</label> <input type="text" id="documentoCliente"
															class="form-control" name="documento"
															value="${usuario.documento}" required />
													</div>
												</div>

												<div class="d-flex flex-row align-items-center mb-4">
													<div class="form-outline flex-fill mb-0">
														<label class="form-label" for="dataNasc">Data de
															Nascimento</label> <input type="date" id="dataNasc"
															class="form-control" name="data_nasc"
															value="${usuario.data_nasc}" required />
													</div>
												</div>

												<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
													<button type="submit" class="btn btn-primary btn-lg">Atualizar
														Dados</button>
												</div>
											</form>

										</jstl:forEach>
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
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			// Aplica a máscara no campo 'cpf'
			$('#documentoCliente').mask('000.000.000-00', {
				reverse : true,
				placeholder : "___.___.___-__"
			});

			// Aplica a máscara no campo 'telefone'
			$('#telefoneCliente').mask('(00) 00000-0000', {
				placeholder : "(__) _____-____"
			});

			// Aplica a máscara no campo 'endereco.cep'
			$('#cepCliente').mask('00000-000', {
				placeholder : "_____-___"
			});
		});
	</script>
</body>
</html>