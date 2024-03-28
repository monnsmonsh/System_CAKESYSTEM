$("#btnNuevo").click(function (even) {
    $("#modal-content").load("/Productos/Create");
});

$(".btnEdit").click(function (even) {
    $("#modal-content").load("/Productos/Edit/" + $(this).data("id"));
});

$(".btnDetails").click(function (even) {
    $("#modal-content").load("/Productos/Details/" + $(this).data("id"));
});

$(".btnDelete").click(function (even) {
    $("#modal-content").load("/Productos/Delete/" + $(this).data("id"));
});