function confirmarDeletar(idReserva) {
    var confirmacao = confirm("Tem certeza que deseja cancelar esta reserva?");
    if (confirmacao) {
        window.location.href = '/Agencia-Viagem-V2/DeletarReservaAdm?idReserva=' + idReserva;
    }
}