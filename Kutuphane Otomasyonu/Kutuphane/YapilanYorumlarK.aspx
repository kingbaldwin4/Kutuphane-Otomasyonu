<%@ Page Title="Yorumlarım" Language="C#" MasterPageFile="~/Uye.Master" AutoEventWireup="true" CodeBehind="YapilanYorumlarK.aspx.cs" Inherits="Kutuphane.YapılanYorumlarK" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        input[class=butonKitap]:focus{
            background-color:darkorange;
            border-color:dodgerblue;
        }
    </style>
    <div class="mainDiv" id="mainPage" runat="server">
        <asp:GridView ID="gridYorumlar" runat="server" class="grid" AutoGenerateColumns="false" OnSelectedIndexChanged="gridYorumlar_SelectedIndexChanged">
            <HeaderStyle Font-Size="Large" ForeColor="DarkMagenta" Width="200" Height="30" />
            <Columns>
                <asp:TemplateField HeaderText="Kitap Adı">
                    <ItemTemplate>
                        <asp:HyperLink runat="server" class="butonKitap" Text='<%#Eval("KitapAd") %>' NavigateUrl='<%#Eval("KitapID","~/UAnasayfa.aspx?kitapID={0}") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
               
                <asp:TemplateField HeaderText="Yorum" ControlStyle-Width="600px">
                    <ItemTemplate>
                        <asp:HyperLink ID="btnYorum" runat="server"  class="butonKitap" Text='<%#Eval("Yorum") %>'  NavigateUrl='<%#Eval("KitapID","~/Yorum.aspx?theYorum={0}") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="YorumTarih" HeaderText="Tarih" />
            
            </Columns>

            <RowStyle ForeColor="ForestGreen" Height="100px" />
        </asp:GridView>
    </div>
     <div class="confirm" id="none" runat="server" visible="false">
        <asp:Label Text="Kullanıcıya ait yorum bulunamadı." runat="server" class="confirmLabel2" />
    </div>
</asp:Content>
