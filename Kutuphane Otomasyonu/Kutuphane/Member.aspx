<%@ Page Title="Profilim" Language="C#" MasterPageFile="~/Uye.Master" AutoEventWireup="true" CodeBehind="Member.aspx.cs" Inherits="Kutuphane.Member" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="header1">ÜYENİN BİLGİLERİ</h2>
    <div class="div1" id="profil" runat="server">
        <table class="tableProfil">
            <tr>
                <td>
                    <asp:Label Text="İsim : " runat="server" class="label2" BackColor="Wheat" ForeColor="Black" />
                </td>
                <td></td>
                <td>
                    <asp:Label ID="txtname" runat="server" class="label2" BackColor="Gold" ForeColor="Brown"/>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Telefon Numarası : " runat="server" class="label2" BackColor="Wheat" ForeColor="Black" />
                </td>
                <td></td>
                <td>
                    <asp:Label ID="txtphoneNo" runat="server" class="label2" BackColor="Gold" ForeColor="Brown" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Adres : " runat="server" class="label2" BackColor="Wheat" ForeColor="Black" />
                </td>
                <td></td>
                <td>
                    <asp:Label ID="txtaddress" runat="server" class="label2" BackColor="Gold" ForeColor="Brown" />
                </td>
            </tr>   
            <tr>
                <td>
                    <asp:Label Text="Kullanıcı ID : " runat="server" class="label2" BackColor="Wheat" ForeColor="Black"/>
                </td>
                <td></td>
                <td>
                    <asp:Label ID="txtKullaniciId" runat="server" class="label2" BackColor="Gold" ForeColor="Brown"/>
                </td>
            </tr>
            <tr>
                <td colspan="3"></td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Button runat="server" Text="Kullanıcıya Ait Yorumlar" CssClass="butonKitap" OnClick="Comment_Click" Style="transform:translate(-25px,10px)" />
                </td>
            </tr>
        </table>
      
    </div>
    
</asp:Content>
