<%@ Page Title="" Language="C#" MasterPageFile="~/Yetkili.Master" AutoEventWireup="true" CodeBehind="YetkiliGuncelle.aspx.cs" Inherits="Kutuphane.YetkiliGuncelle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 42px;
        }
        input[type=text][class=text1]:hover{
            background-color:darkred;
        }
        input[class=buttons]:hover{
            background-color:darkcyan;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div id="add" runat="server" class="table1">
        <table>

            <tr>
                <td>
                    <asp:Label Text="Adı : " runat="server" class="label1" BackColor="DarkOliveGreen" ForeColor="Wheat" />
                </td>
                <td>
                    <asp:TextBox ID="txtAd" runat="server" class="text1" />
                    <asp:RequiredFieldValidator ID="req1" runat="server" ControlToValidate="txtAd" ErrorMessage="*" ForeColor="Blue" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Soyadı : " runat="server" class="label1" BackColor="DarkOliveGreen" ForeColor="Wheat" />
                </td>
                <td>
                    <asp:TextBox ID="txtSoyad" runat="server" class="text1" />
                    <asp:RequiredFieldValidator ID="req2" runat="server" ControlToValidate="txtSoyad" ErrorMessage="*" ForeColor="Blue" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Telefon Numarası : " runat="server" class="label1" BackColor="DarkOliveGreen" ForeColor="Wheat" />
                </td>
                <td>
                    <asp:TextBox ID="txtNo" runat="server" class="text1" onkeypress="if(isNaN(String.fromCharCode(event.keyCode))) return false;" />
                    <asp:RequiredFieldValidator ID="req3" runat="server" ControlToValidate="txtNo" ErrorMessage="*" ForeColor="Blue" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Adresi : " runat="server" class="label1" BackColor="DarkOliveGreen" ForeColor="Wheat" />
                </td>

            </tr>
            <tr>
                <td colspan="2">
                    <asp:TextBox ID="txtAdres" runat="server" class="textMulti" TextMode="MultiLine" />
                    <asp:RequiredFieldValidator ID="req" runat="server" ControlToValidate="txtAdres" ErrorMessage="*" ForeColor="Blue" />
                </td>
            </tr>
            <tr>
                <td colspan="2">

                    <asp:Button Text="Kaydet" ID="btnKaydet" runat="server" OnClick="btnKaydet_Click" type="submit" class="buttons" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td colspan="2">
                    <asp:Button Text="Şifre Güncelle" ID="btnRent" runat="server" OnClick="btnPassword_Click" type="submit" class="buttons" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label Text="Şifre Başarıyla Güncellenmiştir." ID="success" runat="server" Visible="false" ForeColor="Green" Style="transform:translate(50px,80px)" />
                </td>
            </tr>
        </table>
    </div>
    <div class="div1" id="passwordArea" runat="server" visible="false">
        <table class="table1" style="transform:translateX(-130px)">

            <tr>
                <td>
                    <asp:Label Text="Eski Şifre : " runat="server" class="label1" BackColor="DarkOliveGreen" ForeColor="Wheat" />
                </td>
                <td>
                    <asp:TextBox ID="oldPassword" runat="server" class="text1" TextMode="Password" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="oldPassword" ErrorMessage="*" ForeColor="#ff3300" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label Text="Yeni Şifre : " runat="server" class="label1" BackColor="DarkOliveGreen" ForeColor="Wheat" />
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="newPassword" runat="server" class="text1" TextMode="Password" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="newPassword" ErrorMessage="*" ForeColor="#ff3300" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Yeni Şifreyi Doğrula : " runat="server" class="label1" BackColor="DarkOliveGreen" ForeColor="Wheat" />
                </td>
                <td>
                    <asp:TextBox ID="confirmPassword" runat="server" class="text1" TextMode="Password" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="confirmPassword" ErrorMessage="*" ForeColor="#ff3300" />
                    <asp:CompareValidator ID="req4" runat="server" ControlToValidate="confirmPassword" ControlToCompare="newPassword" ErrorMessage="*" ForeColor="#ff3300" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="sonuc" runat="server" Visible="false" ForeColor="Red" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button Text="Güncelle" runat="server" class="buttons" OnClick="btnGuncelle_Click" Style="transform:translateY(10px)"/>
                </td>
            </tr>
        </table>
    </div>

     <div class="confirm" id="confirm" runat="server" visible="false">
        <asp:Label Text="Kullanıcıya ait bilgiler başarılı bir şekilde güncellenmiştir." runat="server" class="confirmLabel2" />
    </div>

</asp:Content>
