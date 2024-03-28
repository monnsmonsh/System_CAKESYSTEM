//

//Show Modal.
function addNewOrder() {
    $("#newOrderModal").modal();
}

//Add Multiple Order.
$("#addToList").click(function (e) {
    e.preventDefault();

    if ($.trim($("#productName").val()) == "" || $.trim($("#price").val()) == "" || $.trim($("#quantity").val()) == "") return;

    var productName = $("#productName").val(),
        price = $("#price").val(),
        quantity = $("#quantity").val(),
        detailsTableBody = $("#detailsTable tbody");

    var productItem = '<tr><td>' + productName + '</td><td>' + quantity + '</td><td>' + price + '</td><td>' + (parseFloat(price) * parseInt(quantity)) + '</td><td><a data-itemId="0" href="#" class="deleteItem">Remove</a></td></tr>';
    detailsTableBody.append(productItem);
    clearItem();
});

//After Add A New Order In The List, Clear Clean The Form For Add More Order.
function clearItem() {
    $("#productName").val('');
    $("#price").val('');
    $("#quantity").val('');
}

// After Add A New Order In The List, If You Want, You Can Remove It.
$(document).on('click', 'a.deleteItem', function (e) {
    e.preventDefault();
    var $self = $(this);
    if ($(this).attr('data-itemId') == "0") {
        $(this).parents('tr').css("background-color", "#ff6347").fadeOut(800, function () {
            $(this).remove();
        });
    }
});

//After Click Save Button Pass All Data View To Controller For Save Database
function saveOrder(data) {
    return $.ajax({
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        type: 'POST',
        url: "/Orders/SaveOrder",
        data: data,
        success: function (result) {
            alert(result);
            location.reload();
        },
        error: function () {
            alert("Error!")
        }
    });
}


//Collect Multiple Order List For Pass To Controller
$("#saveOrder").click(function (e) {
    e.preventDefault();

    var orderArr = [];
    orderArr.length = 0;

    $.each($("#detailsTable tbody tr"), function () {
        orderArr.push({
            productName: $(this).find('td:eq(0)').html(),
            quantity: $(this).find('td:eq(1)').html(),
            price: $(this).find('td:eq(2)').html(),
            amount: $(this).find('td:eq(3)').html()
        });
    });


    var data = JSON.stringify({
        name: $("#name").val(),
        address: $("#address").val(),
        order: orderArr
    });

    $.when(saveOrder(data)).then(function (response) {
        console.log(response);
    }).fail(function (err) {
        console.log(err);
    });
});