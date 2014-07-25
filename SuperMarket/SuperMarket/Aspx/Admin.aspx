<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="SuperMarket.Aspx.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!--style sheet-->
    <link href="../css/Style.css" rel="stylesheet" />
    <link href="css/generic.css" rel="stylesheet" />
    <link href="scripts/choosen-select/chosen.min.css" rel="stylesheet" />
    <link href="scripts/Jquery-Ui/jquery-ui.min.css" rel="stylesheet" />
    <!---style sheet end here--->
    <!--script file start here---->
    <script src="../scripts/query-1.11.1.min.js/jquery-1.11.1.js"></script>
    <script src="../jqwidgets/jqx-all.js"></script>
    <link href="../jqwidgets/styles/jqx.base.css" rel="stylesheet" />
    <link href="../jqwidgets/styles/jqx.metro.css" rel="stylesheet" />
    <script src="../scripts/Jquery-Ui/jquery-ui.min.js"></script>
    <script src="../scripts/choosen-select/chosen.jquery.min.js"></script>
    <script src="../Js/Admin.js"></script>
    <!--script file end here---->

</head>
<body>
    <div id="cssmenu">
        <ul>
            <li class="tabs"><a href="#"><span>Home</span></a></li>
            <li class="tabs"><a href="#dvPurchaseDetails"><span>Purchase Details</span></a></li>
            <li class="tabs"><a href="#dvItemsDetails"><span>Items Details</span></a></li>
            <li class="tabs"><a href="#dvTransactionDetails"><span>Transaction Details</span></a></li>
        </ul>
    </div>
    <form id="form1" runat="server">
        <div id="dvPurchaseDetails">
            <div class="dvLeftcontent">
                <fieldset class='fieldset'>
                    <legend>
                        Modify the Tier Details...
                    </legend>
                   
                        <asp:TextBox runat="server" ID="txtId" Style="display: none" />
                    
                    <span class="span-element">
                        <label for="txtItemName">
                            Item Name
                        </label>
                        <asp:TextBox runat="server" ID="txtItemName" placeholder="Item Name" />
                    </span>
                    <span class="span-element">
                        <label for="txtQuantity">
                            Quantity 
                        </label>
                        <asp:TextBox runat="server" ID="txtQuantity" placeholder="Quantity" />
                    </span>
                    <span class="span-element">
                        <label for="txtPrice">
                            Price 
                        </label>
                        <asp:TextBox runat="server" ID="txtPrice" placeholder="Price" />
                    </span>
                    <span class="span-element">
                        <label for="txtPercentage">
                            SellingPrice Percent 
                        </label>
                        <asp:TextBox runat="server" ID="txtPercentage" placeholder="Percent" />
                    </span>
                    <div class="btnsumbit">
                        <input type="button"  value="Add Item"  id="btnAddItems" />
                     
                    </div>
                </fieldset>
            </div>
            <div class="dvRightcontent">
                <div id="ItemDetailsGrid">
                </div>
            </div>
        </div>
    </form>
</body>
</html>
