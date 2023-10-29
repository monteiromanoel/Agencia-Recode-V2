<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADM - Atualizar Cliente</title>

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

<script src="./plugins/jquery.js"></script>
<script src="./plugins/jquery-mask/jquery.mask.min.js"></script>
<script src="./plugins/select2/js/select2.full.min.js"></script>
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
								class="nav-link dropdown-toggle active" id="dropdown"
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
													<h1 class="text-center">Atualizar Dados</h1>
													<p class="text-center h1 fw-bold mb-5 mt-4">
														<span style="color: #8AA6A3 !important;">${usuario.nome}
														</span>
													</p>

													<form class="mx-1 mx-md-4" action="AtualizarUsuario"
														id="formPerfil" method="post">

														<input value="${usuario.id}" name="id" hidden />

														<div class="d-flex flex-row align-items-center mb-4">
															<div class="form-outline flex-fill mb-0">
																<label class="form-label" for="nomeCliente">Nome</label>
																<input type="text" id="nomeCliente" class="form-control"
																	name="nome" value="${usuario.nome}" required />
															</div>
														</div>

														<div class="d-flex flex-row align-items-center mb-4">
															<div class="form-outline flex-fill mb-0">
																<label class="form-label" for="emailCliente">E-mail</label>
																<input type="text" id="emailCliente"
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
																<label class="form-label" for="telefoneCliente">Telefone</label>
																<input type="text" id="telefoneCliente"
																	class="form-control" name="telefone"
																	value="${usuario.telefone}" required />
															</div>
														</div>

														<div class="d-flex flex-row align-items-center mb-4">
															<div class="form-outline flex-fill mb-0">
																<label class="form-label" for="documentoCliente">Documento</label>
																<input type="text" id="documentoCliente"
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

														<div
															class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
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

		</div>
	</div>
	<footer class="row container-fluid footer">
		<div class="col col-md-8">&reg; Recode Viagens - 2023</div>
		<div class="col col-6 col-md-4 d-flex justify-content-end">Versão
			- 2.0</div>
	</footer>


</body>
</html>