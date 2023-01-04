<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Kutuphane.Login" %>

<!DOCTYPE html>
<link href="Css/Css.css" rel="stylesheet" />

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Giriş Yap</title>
    <style type="text/css">
        input[type=text]:focus{
            background-color:orangered;
        }
        input[type=submit]:focus{
            background-color:lightcyan;
        }
        input[type=submit]:hover{
            background-color:gold;
        }
        .auto-style1 {
            margin-left: 0px;
            margin-top: 112px;
            margin-bottom: 18px;
        }
        .auto-style2 {
            margin-top: 400px;
            margin-left: 750px;
            text-align: center;
            align-items: center;
            width: 400px;
            height: 200px;
            background-color: black;
            opacity: 0.7;
            border-color: black;
            position: absolute;
            box-shadow: 0px 0px 10px 5px rgba(0,0,0,.75);
            border-radius: 15px;
            left: -166px;
            top: -33px;
        }
        .auto-style3 {
            position: absolute;
            top: 20%;
            left: 24%;
            transform: translate(-50%,-100%);
            margin-bottom: 0px;
        }
        .auto-style4 {
            left: 50px;
            top: 138px;
        }
    </style>
</head>
<body >
    <form id="form1" runat="server">
        <div class="auto-style2">
            <table class="auto-style3">
                <tr>
                    <td>
                        <asp:Label Text="Kullanıcı Adı : " runat="server" class="labels" BackColor="#CC00CC" BorderStyle="Double" ForeColor="Yellow" /></td>
                    <td>
                        <asp:TextBox ID="txtKullaniciAd" runat="server" class="textBoxes" BackColor="#333300" BorderStyle="Double" ForeColor="White" Height="16px" Width="160px" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtKullaniciAd" ErrorMessage="*" ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label Text="Parola : " runat="server" class="labels" BackColor="#CC00CC" BorderStyle="Double" ForeColor="Yellow" /></td>
                    <td>
                        <asp:TextBox ID="txtParola" runat="server" class="textBoxes" TextMode="Password" BackColor="#333300" BorderStyle="Double" ForeColor="White" Height="16px" Width="152px" /></td>
                </tr>
                
            </table>
            <br />

            <asp:Label ID="lblAciklama" runat="server" class="error" CssClass="auto-style4" />
            <asp:Label ID="lblHata" runat="server" ForeColor="White"></asp:Label>
            <asp:Button Text="Giriş" ID="btnGiris" runat="server" OnClick="btnGiris_Click" type="submit" class="buttons" BackColor="#99CCFF" BorderStyle="Double" CssClass="auto-style1" ForeColor="#00CC00" Height="38px" Width="183px" />
        </div>
    </form>
    <p>
        </p>
</body>
</html>
