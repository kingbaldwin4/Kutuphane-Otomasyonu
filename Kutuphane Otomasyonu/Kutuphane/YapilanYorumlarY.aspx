<%@ Page Title="Kullanıcıya Ait Yorumlar" Language="C#" MasterPageFile="~/Yetkili.Master" AutoEventWireup="true" CodeBehind="YapilanYorumlarY.aspx.cs" Inherits="Kutuphane.YapilanYorumlarY" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mainDiv" id="mainPage" runat="server">
        <asp:GridView ID="gridYorumlar" runat="server" class="grid" AutoGenerateColumns="false">
            <HeaderStyle Font-Size="Large" ForeColor="DarkSeaGreen" Width="200" Height="30" />
            <Columns>
                <asp:TemplateField HeaderText="Kitap Adı">
                    <ItemTemplate>
                        <asp:HyperLink runat="server" class="butonKitap" Text='<%#Eval("KitapAd") %>' NavigateUrl='<%#Eval("KitapID","~/Kiralama.aspx?kitapIDYorum={0}") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
               
                <asp:TemplateField HeaderText="Yorum" ControlStyle-Width="600px">
                    <ItemTemplate>
                        <asp:HyperLink ID="btnYorum" runat="server"  class="butonKitap" Text='<%#Eval("Yorum") %>'  NavigateUrl='<%#Eval("KitapID","~/YetkiliYorumlar.aspx?yorumKitapID={0}") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="YorumTarih" HeaderText="Tarih" />
            
            </Columns>

            <RowStyle ForeColor="DarkSeaGreen" Height="100px" />
        </asp:GridView>
    </div>
     <div class="confirm" id="none" runat="server" visible="false">
        <asp:Label Text="Kullanıcıya ait yorum bulunamadı." runat="server" class="confirmLabel2" style ="transform:translateX(60px)"/>
    </div>
</asp:Content>
