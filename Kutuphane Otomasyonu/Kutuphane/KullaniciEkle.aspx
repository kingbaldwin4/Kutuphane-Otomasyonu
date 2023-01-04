<%@ Page Title="Kullanıcı Ekleme" Language="C#" MasterPageFile="~/Yetkili.Master" AutoEventWireup="true" CodeBehind="KullaniciEkle.aspx.cs" Inherits="Kutuphane.KullaniciEkle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        input[type=text][id=txtAd],[id=txtSoyad],[id=txtNo],[txtAdres],[id=txtuserName],[id=txtParola]:focus{
            color:wheat;
        }
    </style>
    <div id="add" runat="server" class="table1">
        <table>

            <tr>
                <td>
                    <asp:Label Text="Adı : " runat="server" class="label1" ForeColor="Black" BackColor="LightGreen" />
                </td>
                <td>
                    <asp:TextBox ID="txtAd" runat="server" class="text1" ForeColor="DarkBlue" />
                    <asp:RequiredFieldValidator ID="req1" runat="server" ControlToValidate="txtAd" ErrorMessage="*" ForeColor="DarkRed"/>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Soyadı : " runat="server" class="label1" ForeColor="Black" BackColor="LightGreen" />
                </td>
                <td>
                    <asp:TextBox ID="txtSoyad" runat="server" class="text1" ForeColor="DarkBlue"  />
                     <asp:RequiredFieldValidator ID="req2" runat="server" ControlToValidate="txtSoyad" ErrorMessage="*" ForeColor="DarkRed" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Telefon Numarası : " runat="server" class="label1" ForeColor="Black" BackColor="LightGreen" />
                </td>
                <td>
                    <asp:TextBox ID="txtNo" runat="server" class="text1" ForeColor="DarkBlue" onkeypress="if(isNaN(String.fromCharCode(event.keyCode))) return false;" />
                     <asp:RequiredFieldValidator ID="req3" runat="server" ControlToValidate="txtNo"  ErrorMessage="*" ForeColor="DarkRed" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Adresi : " runat="server" class="label1" ForeColor="Black" BackColor="LightGreen" />
                </td>
               
            </tr>
            <tr>
                 <td colspan="2">
                    <asp:TextBox ID="txtAdres" runat="server" class="textMulti" TextMode="MultiLine"/>
                      <asp:RequiredFieldValidator ID="req" runat="server" ControlToValidate="txtAdres" ForeColor="DarkBlue" ErrorMessage="*" BackColor="DarkRed" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Kullanıcı Adı : " runat="server" class="label1" ForeColor="Black" BackColor="LightGreen" />
                </td>
                <td>
                    <asp:TextBox ID="txtuserName" runat="server" class="text1" />
                     <asp:RequiredFieldValidator ID="req5" runat="server" ControlToValidate="txtUserName" ForeColor="DarkBlue" ErrorMessage="*" BackColor="DarkRed"/>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Şifresi : " runat="server" class="label1" ForeColor="Black" BackColor="LightGreen" />
                </td>
                <td>
                    <asp:TextBox ID="txtParola" runat="server" class="text1" TextMode="Password" />
                     <asp:RequiredFieldValidator ID="req6" runat="server" ControlToValidate="txtParola" ForeColor="DarkBlue" ErrorMessage="*" BackColor="DarkRed" />
                </td>
            </tr>
            <tr>
                <td colspan="2">

                    <asp:Button Text="Kaydet" ID="btnKaydet" runat="server" OnClick="btnKaydet_Click" type="submit" class="buttons" />
                </td>
            </tr>




        </table>
        <asp:Label ID="lblAciklamaBos" runat="server" class="errorBos" visible="false" Text="Lütfen boş alan bırakmayınız."/>
        <asp:Label ID="lblAciklamaOlan" runat="server" class="errorOlan" visible="false" Text="Bu kullanıcı adı zaten başka bir üye tarafından kullanılmaktadır.Lütfen başka bir kullanıcı adı seçiniz."/>
        <asp:Label ID="lblAciklamaSayi" runat="server" class="errorBos" visible="false" Text="Kullanıcıya ait numarayı doğru giriniz."/>
        <asp:Label ID="lblAciklamaParola" runat="server" class="errorBos" visible="false" Text="Özel karakter bulundurmayan güçlü bir şifre belirleyiniz."/>
    </div>
    <div class="confirm" id="confirm" runat="server" visible="false">
        <asp:Label Text="Kullanıcı kaydı oluşturulmuştur." runat="server" class="confirmLabel" />
    </div>
    <div class="confirm2" id="confirm2" runat="server" visible="false">
        <asp:Button Text="Yeni Kişi Kaydet" ID="btnYenidenkaydet" runat="server" OnClick="btnYenidenKaydet_Click" type="submit" class="buttons" />
        <asp:Button Text="Kişiyi Düzenle" ID="btnDuzenle" runat="server" OnClick="btnDuzenle_Click" type="submit" class="buttons" />

    </div>

</asp:Content>
