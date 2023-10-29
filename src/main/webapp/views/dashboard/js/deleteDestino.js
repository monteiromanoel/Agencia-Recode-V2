function confirmarDeletar(idViagem) {
    var confirmacao = confirm("Tem certeza que deseja cancelar este destino?");
    if (confirmacao) {
        window.location.href = '/Agencia-Viagem-V2/DeletarDestino?idViagem=' + idViagem;
    }
}