<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADM - Atualizar Destino</title>

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

<script>
	tinymce.init({
		selector : '#textArea'
	});
</script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">

<link rel="stylesheet" href="./views/dashboard/css/estiloDash.css">

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
								class="nav-link dropdown-toggle active" id="dropdown"
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
												<jstl:forEach items="${viagem}" var="viagem">
													<h1 class="text-center">Atualizar Dados</h1>

													<form class="mx-1 mx-md-4" action="AtualizarDestino"
														id="formPerfil" method="post">

														<input value="${viagem.id}" name="id" hidden />

														<div
															class="d-flex flex-row flex-wrap align-items-center mb-4 mt-3">
															<div class="form-outline flex-fill mx-1 mb-0">
																<label class="form-label" for="destino">Destino</label>
																<input type="text" id="destino" class="form-control"
																	name="destino" value="${viagem.destino}" required />
															</div>
															<div class="form-outline flex-fill mb-0">
																<label class="form-label" for="localidade">País
																	ou Localidade</label> <input type="text" id="localidade"
																	class="form-control" name="localidade"
																	value="${viagem.localidade}" required />
															</div>
														</div>

														<div
															class="d-flex flex-row flex-wrap align-items-center mb-4 mt-3">
															<div class="form-outline flex-fill mx-1 mb-0">
																<label class="form-label" for="dataIda">Data de
																	Ída</label> <input type="date" id="dataIda"
																	class="form-control" name="data_ida"
																	value="${viagem.data_ida}" required />
															</div>
															<div class="form-outline flex-fill mx-1 mb-0">
																<label class="form-label" for="dataVolta">Data
																	de Volta</label> <input type="date" id="dataVolta"
																	class="form-control" name="data_volta"
																	value="${viagem.data_volta}" required />
															</div>
														</div>

														<div
															class="d-flex flex-row flex-wrap align-items-center mb-4 mt-3">
															<div class="form-outline flex-fill mx-1 mb-0">
																<label class="form-label" for="adicional">Adicional</label>
																<input type="text" id="adicional" class="form-control"
																	name="adicional" value="${viagem.adicional}"
																	maxlength="90" required />
															</div>
															<div class="form-outline flex-fill mx-1 mb-0">
																<label class="form-label" for="tipoPacote">Tipo
																	do Pacote </label> <select id="tipoPacote"
																	class="form-control form-select" name="tipo_pacote">
																	<option class="bg-info" value="">${viagem.tipo_pacote}</option>
																	<option value="promocional">promocional</option>
																	<option value="convencional">convencional</option>

																</select>
															</div>
														</div>

														<div class="d-flex flex-row align-items-center mb-4">
															<div class="form-outline flex-fill mb-0">
																<label class="form-label" for="textAreaCurta">Descrição
																	Curta: </label>
																<textarea id="textAreaCurta" name="descricao_curta" class="form-control"
																	maxlength="230">${viagem.descricao_curta}</textarea>
															</div>
														</div>

														<div class="d-flex flex-row align-items-center mb-4">
															<div class="form-outline flex-fill mb-0">
																<label class="form-label" for="textArea">Descrição
																	Longa: </label>
																<textarea id="textArea" name="descricao_longa"
																	maxlength="4500">${viagem.descricao_longa}</textarea>
															</div>
														</div>

														<div class="container mb-4">
															<fieldset
																class="border rounded-3 p-3 d-flex flex-row flex-wrap justify-content-center align-items-center">
																<legend
																	class="float-none fs-6 w-auto px-3 bg-white rounded shadow-sm py-1">
																	Área exclusiva para pacotes <span
																		class="text-white bg-danger rounded p-1">PROMOCIONAIS</span>
																</legend>
																<div class="row justify-content-center mb-4">
																	<div class="row">
																		<div class="col-8">
																			<label class="form-label" for="labelPromocao">Etiqueta
																				de Promoção</label> <input type="text" id="labelPromocao"
																				class="form-control" name="label_promocao"
																				value="${viagem.label_promocao}"
																				placeholder="Texto não encontrado" maxlength="35" />
																		</div>
																		<div class="col-4">
																			<label class="form-label" for="precoAntigo">Preço
																				Antigo</label> <input type="text" id="precoAntigo"
																				class="form-control" name="preco_antigo"
																				value="<fmt:formatNumber value="${viagem.preco_antigo}" type="currency"
												currencyCode="BRL" />" />
																			<p class="blockquote-footer mt-2">
																				Esse valor aparece assim:
																				<del>R$2000,00</del>
																			</p>

																		</div>
																	</div>
																</div>
															</fieldset>
														</div>

														<div
															class="d-flex flex-row justify-content-center align-items-center mx-auto mb-4">
															<div
																class="d-flex form-outline justify-content-center align-items-center flex-fill mb-0">
																<label class="form-label mx-2" for="preco">Preço
																	Final: </label> <input type="text" id="preco"
																	class="form-control w-50" name="preco"
																	value="<fmt:formatNumber value="${viagem.preco}" type="currency"
												currencyCode="BRL" />"
																	required />
															</div>
														</div>

														<h4>Imagens</h4>
														<div
															class="d-flex flex-row flex-wrap align-items-center mb-4">

															<div class="form-outline flex-fill mb-0 w-50 mx-1">
																<label class="form-label" for="imagem">Imagem de
																	Capa</label> <input type="text" id="imagem"
																	class="form-control" name="imagem"
																	value="${viagem.imagem}" required /> <label
																	class="form-label" for="imagem2">Imagem 2</label> <input
																	type="text" id="imagem2" class="form-control"
																	name="imagem2" value="${viagem.imagem2}"
																	placeholder="Adicione o link da imagem" />
															</div>

															<div class="form-outline flex-fill mb-0 w-50 mx-1">
																<label class="form-label" for="imagem3">Imagem 3</label>
																<input type="text" id="imagem3" class="form-control"
																	name="imagem3" value="${viagem.imagem3}"
																	placeholder="Adicione o link da imagem" /> 
																<label
																	class="form-label" for="imagem4">Imagem 4</label> 
																<input
																	type="text" id="imagem4" class="form-control"
																	name="imagem4" value="${viagem.imagem4}"
																	placeholder="Adicione o link da imagem" />
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