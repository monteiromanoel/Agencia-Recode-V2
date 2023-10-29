function confirmarDeletar(idUsuario) {
    var confirmacao = confirm("Tem certeza que deseja cancelar este cliente?");
    if (confirmacao) {
        window.location.href = '/Agencia-Viagem-V2/DeletarUsuario?idUsuario=' + idUsuario;
    }
}