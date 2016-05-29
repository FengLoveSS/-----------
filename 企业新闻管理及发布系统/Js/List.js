function Delete(id) {
    $.post("../Asmx/List.asmx/Delete", {
        ID:id


    }, function (data) {
        alert(data);
        location.reload();


    });
}