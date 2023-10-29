document.getElementById("formCadastro").addEventListener("submit", function(event) {
	if (!document.getElementById("formCheckbox").checked) {
		alert("Você precisa concordar com os Termos de Uso para continuar");
		event.preventDefault();
	}
});
