$("#btnNuevo").click(function (even) {
    $("#modal-content").load("/Usuarios/CreateModal");
});

$(".btnEdit").click(function (even) {
    $("#modal-content").load("/Usuarios/Edit/" + $(this).data("id"));
});

$(".btnDetails").click(function (even) {
    $("#modal-content").load("/Usuarios/Details/" + $(this).data("id"));
});

$(".btnDelete").click(function (even) {
    $("#modal-content").load("/Usuarios/Delete/" + $(this).data("id"));
});