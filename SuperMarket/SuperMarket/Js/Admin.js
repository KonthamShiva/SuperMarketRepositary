function dataBindToGrid() {
    debugger;
    AjaxgetAll("/SuperMarketWebservices.asmx/GetAllItems", 'POST', SuccessCallToBindGrid, FailureCallBack);
};
function FailureCallBack(x, a, f) {
    debugger;
    alert(a);
}
function SuccessCallToBindGrid(data) {
    debugger;
    var ItemsNames = data.d;
    var source = {
        dataType: 'json',
        datafields: [
            { name: 'Id', type: 'int' },
            { name: 'Name', type: 'string' },
            { name: 'StockAvailable', type: 'int' },
            { name: 'CP', type: 'float' },
            { name: 'SP', type: 'float' }
        ],
        Id: 'Id',
        localData: ItemsNames
    }
    var dataAdapter = new $.jqx.dataAdapter(source);
    $('#ItemDetailsGrid').jqxGrid('source', dataAdapter);
}
function AjaxgetAll(url, type, successCall, FailureCallBack) {
    debugger;
    $.ajax({
        url: url,
        type: type,
        async: true,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: successCall,
        error: FailureCallBack

    });
};
$(document).ready(function () {
        debugger;
        $("#ItemDetailsGrid").jqxGrid({
            width: 600,
            height: 250,
            columns: [
                { text: 'Id', datafield: 'Id', hidden: true },
                { text: 'Item Name', datafield: 'Name' },
                { text: 'Stock Available', datafield: 'StockAvailable' },
                { text: 'Cost Price', datafield: 'CP' },
                { text: 'Selling Price', datafield: 'SP' },
                {
                    text: 'Edit', datafield: 'Edit', columntype: 'button', width: 50, cellsrenderer: function () {
                        return "Edit";
                    }, buttonclick: function (row) {
                        editrowindex = row;
                        var ItemName = $("#ItemDetailsGrid").jqxGrid('getcellvalue', row, 'Name');
                        alert(ItemName);
                        //window.location = '/Customers/Edit/?id=' + id;

                    }
                }
            ],
            theme: 'metro',
            sortable: true,
            pageable: true,
            source: null
        });
        debugger;
        dataBindToGrid();
    });