<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SuperMarket.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!--style sheet-->
    <link href="css/Style.css" rel="stylesheet" />
    <link href="css/generic.css" rel="stylesheet" />
    <link href="scripts/choosen-select/chosen.min.css" rel="stylesheet" />
    <link href="scripts/Jquery-Ui/jquery-ui.min.css" rel="stylesheet" />

    <!---style sheet end here--->
    <!--script file start here---->
    <script src="scripts/query-1.11.1.min.js/jquery-1.11.1.js"></script>
    <script src="scripts/Jquery-Ui/jquery-ui.min.js"></script>
    <script src="scripts/choosen-select/chosen.jquery.min.js"></script>
    <script src="scripts/Scripts.js"></script>
    <script src="Js/Ajax.js"></script>
    <!--script file end here---->
    <!--files for slider--------->
    <link href="scripts/jsImgSlider/themes/8/js-image-slider.css" rel="stylesheet" type="text/css" />
    <script src="scripts/jsImgSlider/themes/8/js-image-slider.js" type="text/javascript"></script>
    <link href="scripts/jsImgSlider/themes/8/tooltip.css" rel="stylesheet" type="text/css" />
    <script src="scripts/jsImgSlider/themes/8/tooltip.js" type="text/javascript"></script>
    <link href="css/generic.css" rel="stylesheet" />
    <script type="text/javascript">
        imageSlider.thumbnailPreview(function (thumbIndex) { return "<img src='images/thumb" + (thumbIndex + 1) + ".jpg' style='width:70px;height:44px;' />"; });
    </script>
    <!--files for slider ending--------->
</head>
<body>
    <div class="divHeading">
        <h1>Supper Market</h1>
    </div>
    <form id="form1" runat="server">
        <div id="sliderFrame">
            <div id="slider">
                <a href="http://www.menucool.com/javascript-image-slider" target="_blank">
                    <img src="scripts/jsImgSlider/images/image-slider-1.jpg" alt="#cap1" />
                </a>
                <img src="scripts/jsImgSlider/images/image-slider-2.jpg" alt="Lorem ipsum dolor sit amet" />
                <img src="scripts/jsImgSlider/images/image-slider-3.jpg" alt="Pure Javascript. No jQuery. No flash." />
                <img src="scripts/jsImgSlider/images/image-slider-4.jpg" alt="#cap2" />
                <img src="scripts/jsImgSlider/images/image-slider-5.jpg" alt="Excepteur sint occaecat cupidatat" />
            </div>
            <div style="display: none;">
                <div id="cap1">
                    Welcome to <a href="http://www.menucool.com/">Menucool.com</a>.
                </div>
                <div id="cap2">
                    <em>HTML</em> caption. Link to <a href="http://www.google.com/">Google</a>.
                </div>
            </div>
        </div>
        <div class="fieldset" style="display: none" title="Registration Form">
            <!-- User Name -->
            <div>
                <span class="span-element">
                    <asp:Label ID="lblName" runat="server" Text="Name" CssClass="label"></asp:Label>
                </span>
                <span class="span-element">
                    <asp:TextBox ID="txt_LoginName" runat="server" ValidationGroup="Login"></asp:TextBox>
                </span>
            </div>
            <!--Password -->
            <span class="span-element">
                <asp:Label ID="lbl_DOB" runat="server" Text="Password" CssClass="label"></asp:Label>
            </span>
            <span class="span-element">
                <asp:TextBox ID="txtLoginPassword" runat="server" TextMode="Password" ValidationGroup="Login"></asp:TextBox>
            </span>
            <span>
                <asp:Button Text="Login" runat="server" ID="BtnLogin" OnClick="BtnLogin_Click" />
                <%--  <input type="button" runat="server" id="BtnLogin" value="Login"/>--%>
            </span>
        </div>
        <button type="button" id="btnLoginImg">
            <img src="scripts/jsImgSlider/images/download.jpg" style="height: 50px; width: 100px;" />
        </button>
    </form>
    <div class="dvfooter">
        <div>
            <div class="FooterDivs">
                <ul>
                    <li>sdfhgsdfhsd</li>
                    <li>sdfhsdfhsdf</li>
                    <li>sdfhdsfhsdf</li>
                </ul>
            </div>
            <div class="FooterDivs">
                <ul>
                    <li>sdhdfhsd</li>
                    <li>dfhdsfhsdh</li>
                    <li>dshdshfdsfh</li>
                </ul>
            </div>
            <div class="FooterDivs">
                <ul>
                    <li>dsfhsdhfsd</li>
                    <li>sadfasdgsadg</li>
                    <li>sadgasdgasg</li>
                </ul>
            </div>
            <div class="FooterDivs">
                <ul>
                    <li>asgsadgsag</li>
                    <li>sadgsadgasdg</li>
                    <li>sdgsagsag</li>
                </ul>
            </div>
            <div class="FooterDivs">
                <ul>
                    <li>asgsadgsag</li>
                    <li>sadgsadgasdg</li>
                    <li>sdgsagsag</li>
                </ul>
            </div>
        </div>
        <div class="CopyRight">
            Copyright SupperMarket@2014
        </div>
    </div>
</body>
</html>
