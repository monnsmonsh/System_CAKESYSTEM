$("#btnNuevo").click(function (even) {
    $("#modal-content").load("/Clientes/CreateModal");
});

$(".btnEdit").click(function (even) {
    $("#modal-content").load("/Clientes/Edit/" + $(this).data("id"));
});

$(".btnDetails").click(function (even) {
    $("#modal-content").load("/Clientes/Details/" + $(this).data("id"));
});

$(".btnDelete").click(function (even) {
    $("#modal-content").load("/Clientes/Delete/" + $(this).data("id"));
});