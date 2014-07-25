/// <reference path="../Aspx/Supervisor.aspx" />
/// <reference path="../Aspx/Admin.aspx" />
    function AjaxSubmitData(dataToSend, SuccessCallBack, MethodName) {
        debugger;
        $.ajax({
            type: "POST",
            url: "/SuperMarketWebservices.asmx/" + MethodName,
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            data: dataToSend, // Check this call.
            success: SuccessCallBack,
            error: function (x, a, f) {
                debugger;
                alert(a);
            }
        });
    }

    function SuccessCall(data) {           
        debugger;
        alert(data.d);
    }
    function doRedirect(data) {
        debugger;
        var objUsers = data.d;
        if (objUsers['Name'].toLowerCase() == 'admin') {
            debugger;
            window.location.href = "Aspx/Admin.aspx";
           
        }
        else if (objUsers['Name'].toLowerCase() == 'sales') {
            window.location.href = 'SuperVisor.aspx';
        }
        else
            return false;
    }

    function AjaxSubmitDetails(Name, state, pwd, email, city, country) {
        debugger;
        $.ajax({
            url: "Login.aspx?Name=" + Name + "&state=" + state + "&pwd=" + pwd + "&email=" + email + "&city=" + city + "&country=" + country,
            async: true,
            success: function (data, textStatus, jqXHR) {
                debugger;
                $("input[type=text]").val('');
                //$("input[type=select]").find('option','');
                $("#lblStatus").html(data);
                alert(data);
            },
            error: function (x, a, f) {
                debugger;
                alert(a);
                $("#lblStatus").html(a);
            }
        })
    }

    function FailureCallBack(x, a, f) {
        debugger;
        alert(a);
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

    function SuccessCallBackDdlBind(data) {
        debugger;
        var JsonObj = JSON.parse(data);
        ddlBind("#ddlStates", JsonObj, "state", "stateId");
    }

    function ddlBind(selector, obj, dataMember, ValueMember) {
        if (selector != null) {
            debugger;

            for (var prop in obj) {
                $(selector).append('<option value=' + obj[prop][ValueMember] + '>' + obj[prop][dataMember] + '</option>');
                debugger;
            }
            $(selector).trigger("chosen:updated");

        }
    }
    
    function dataBindToGrid() {
        debugger;
        AjaxgetAll("/SuperMarketWebservices.asmx/GetAllItems", 'POST', SuccessCallToBindGrid, FailureCallBack);
    };
    function SuccessCallToBindGrid(data) {
        debugger;
        var ItemsNames = data.d;
        var source={
            dataType:'json',
            datafields:[
                {name:'Id',type:'int'},
                {name:'Name',type:'string'},
                {name:'StockAvailable',type:'int'},
                {name:'CP',type:'float'},
                {name:'SP',type:'float'}
            ],
            Id:'Id',
            localData:ItemsNames
        }
        var dataAdapter = new $.jqx.dataAdapter(source);
        $('#ItemDetailsGrid').jqxGrid('source', dataAdapter);
    }
    function GridBind()
    {
         $("#ItemDetailsGrid").jqxGrid({
             width: 600,
             height: 250,
             columns:[
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
                         window.location = '/Customers/Edit/?id=' + id;

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
    }
//DOCUMENT 
$(document).ready(function () {
    $("input[type=submit]").button();
    $("input[type=button]").button();
    $("#btnLoginImg").click(function () {
        $(".fieldset").dialog({
            modal: true
        });
        $("#BtnClose").click(function () {
            $(".fieldset").dialog('close');
        });
    });
    $("#BtnLogin").click(function () {
        debugger;
        var objUsersTable = { Name: $("#txt_LoginName").val(), Password: $("#txtLoginPassword").val() };
        AjaxSubmitData(JSON.stringify({ "objUsersTable": objUsersTable }), doRedirect, "GetUserRecord");
    });
});
