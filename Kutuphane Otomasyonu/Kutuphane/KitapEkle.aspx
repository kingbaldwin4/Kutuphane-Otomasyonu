<%@ Page Title="Kitap Ekleme" Language="C#" MasterPageFile="~/Yetkili.Master" AutoEventWireup="true" CodeBehind="KitapEkle.aspx.cs" Inherits="Kutuphane.KitapEkle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        input[type=text]:focus{
            background-color:white;
        }
        input[type=text]:hover{
            color:black;
        }
        input[type=button]:focus{
            background-color:darkgoldenrod;
        }
    </style>
    <div id="add" runat="server" class="table1">
        <table>
            <tr>
                <td>
                    <asp:Label Text="Kitabın Adı : " runat="server" class="label1" BackColor="Beige" ForeColor="Red" />
                </td>
                <td>
                    <asp:TextBox ID="txtKitapAd" runat="server" class="text1" />
                    <asp:RequiredFieldValidator ID="req1" runat="server" ControlToValidate="txtKitapAd" ErrorMessage="*" ForeColor="DarkRed"/>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Kitabın Yazarı : " runat="server" class="label1" BackColor="Beige" ForeColor="Red" />
                </td>
                <td>
                    <asp:TextBox ID="txtYazar" runat="server" class="text1" />
                    <asp:RequiredFieldValidator ID="req2" runat="server" ControlToValidate="txtYazar" ErrorMessage="*" ForeColor="DarkRed"/>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Kitabın Yayıncısı : " runat="server" class="label1" BackColor="Beige" ForeColor="Red" />
                </td>
                <td>
                    <asp:TextBox ID="txtYayinci" runat="server" class="text1" />
                    <asp:RequiredFieldValidator ID="req3" runat="server" ControlToValidate="txtYayinci" ErrorMessage="*" ForeColor="DarkRed"/>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Kitabın Türü : " runat="server" class="label1" BackColor="Beige" ForeColor="Red" />
                </td>
                <td>
                    <asp:TextBox ID="txtTur" runat="server" class="text1" />
                    <asp:RequiredFieldValidator ID="req4" runat="server" ControlToValidate="txtTur" ErrorMessage="*" ForeColor="DarkRed"/>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Kitabın Sayfa Sayısı : " runat="server" class="label1" BackColor="Beige" ForeColor="Red" />
                </td>
                <td>
                    <asp:TextBox ID="txtSayfa" runat="server" class="text1" onkeypress="if(isNaN(String.fromCharCode(event.keyCode))) return false;"/>
                    <asp:RequiredFieldValidator ID="req5" runat="server" ControlToValidate="txtSayfa" ErrorMessage="*" ForeColor="DarkRed"/>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Basım Tarihi : " runat="server" class="label1" BackColor="Beige" ForeColor="Red"/>
                </td>
                <td>
                    <asp:TextBox ID="txtTarih" runat="server" class="text1" />
                    <asp:RequiredFieldValidator ID="req6" runat="server" ControlToValidate="txtTarih" ErrorMessage="*" ForeColor="DarkRed"/>
                </td>
            </tr> 
            <tr>
                <td>
                    <asp:Label Text="Kitap Adeti : " runat="server" class="label1" BackColor="Beige" ForeColor="Red"/>
                </td>
                <td>
                    <asp:TextBox ID="txtAdet" runat="server" class="text1" onkeypress="if(isNaN(String.fromCharCode(event.keyCode))) return false;"/>
                    <asp:RequiredFieldValidator ID="req7" runat="server" ControlToValidate="txtAdet" ErrorMessage="*" ForeColor="DarkRed"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label Text="Fotoğraf : " runat="server" class="label1"/>
                </td>
               
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Image ID="imgKitap" runat="server"  Width="150px" class="imageKitap"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:FileUpload ID="fuYukle" runat="server" Width="310" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="upload" runat="server" Text="Upload" OnClick="upload_Click" class="buttonUpload" />
                </td>
            </tr>  
            <tr>
                <td colspan="2">
                     <asp:Label ID="labelImg" runat="server" class ="errorUpload"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">

                    <asp:Button Text="Kaydet" ID="btnKaydet" runat="server" OnClick="btnKaydet_Click" type="submit" class="buttons" CausesValidation="true" />
                </td>
            </tr>

        </table>
         <asp:Label ID="lblKitapHata" runat="server" class="errorBos" visible="false" />
    </div>
    <div class="confirm" id="confirm" runat="server" visible="false">
        <asp:Label Text="Kitap kaydı oluşturulmuştur." runat="server" class="confirmLabel" />
    </div>
    <div class="confirm2" id="confirm2" runat="server" visible="false">
        <asp:Button Text="Yeni Kitap Kaydet" ID="btnYenidenkaydet" runat="server" OnClick="btnYenidenKaydet_Click" type="submit" class="buttons" />
        <asp:Button Text="Kitap Bilgilerini Düzenle" ID="btnDuzenle" runat="server" OnClick="btnDuzenle_Click" type="submit" class="buttons" />

    </div>

</asp:Content>
