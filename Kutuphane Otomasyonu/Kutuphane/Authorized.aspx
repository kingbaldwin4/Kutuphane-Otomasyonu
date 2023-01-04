<%@ Page Title="Profil" Language="C#" MasterPageFile="~/Yetkili.Master" AutoEventWireup="true" CodeBehind="Authorized.aspx.cs" Inherits="Kutuphane.Authorized" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/CssOther.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            height: 31px;
        }
        .auto-style2 {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="header1">YETKİLİNİN BİLGİLERİ</h2>
    <div class="div1">
        <table class="table2">
            <tr>
                <td class="auto-style1">
                    <asp:Label Text="İsim : " runat="server" class="label1" BackColor="LightBlue" ForeColor="Black" BorderStyle="Ridge" />
                </td>
                <td class="auto-style1"></td>
                <td class="auto-style1">
                    <asp:Label ID="txtname" runat="server" class="label1" BackColor="LightBlue" ForeColor="Black"  BorderStyle="Ridge"/>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label Text="Telefon Numarası : " runat="server" class="label1" BackColor="LightYellow" ForeColor="Black" BorderStyle="Ridge"/>
                </td>
                <td class="auto-style2"></td>
                <td class="auto-style2">
                    <asp:Label ID="txtphoneNo" runat="server" class="label1" Backcolor="LightYellow" ForeColor="Black" BorderStyle="Ridge"/>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Adres : " runat="server" class="label1" BackColor="SandyBrown" ForeColor="Black" BorderStyle="Ridge"/>
                </td>
                <td></td>
                <td>
                    <asp:Label ID="txtaddress" runat="server" class="label1" BackColor="SandyBrown" ForeColor="Black" BorderStyle="Ridge" />
                </td>
            </tr>
          
        </table>
    </div>
</asp:Content>
