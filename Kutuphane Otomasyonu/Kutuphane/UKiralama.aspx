<%@ Page Title="Kiralama" Language="C#" MasterPageFile="~/Uye.Master" AutoEventWireup="true" CodeBehind="UKiralama.aspx.cs" Inherits="Kutuphane.UKiralama" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mainDiv" id="kira" runat="server">
        <asp:GridView ID="gridKitaplar" runat="server" class="grid" AutoGenerateColumns="false">
            <HeaderStyle Font-Size="Large" ForeColor="DarkBlue" Width="200" Height="30" />
            <Columns>
                <asp:TemplateField HeaderText="Kitap Adı">
                    <ItemTemplate>
                        <asp:HyperLink runat="server" class="butonKitap" Text='<%#Eval("KitapAd") %>' NavigateUrl='<%#Eval("KitapID","~/KitapInfo.aspx?bookID={0}") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Yazar">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnYazar" runat="server" OnClick="Yazar_Click" class="butonKitap" Text='<%#Eval("Yazar") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Yayinci" HeaderText="Yayıncı" />
                <asp:TemplateField HeaderText="Fotoğraf">
                    <ItemTemplate>
                        <asp:Image ID="imgKitap" runat="server" ImageUrl='<%#Eval("Fotograf") %>' Width="150" Height="200" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Baslangic" HeaderText="Başlangıç Tarihi" />
                <asp:BoundField DataField="Bitis" HeaderText="Bitiş Tarihi" />
                 <asp:TemplateField HeaderText="Teslimat Tarihi">
                    <ItemTemplate>
                        <asp:Label runat="server"  Text='<%#Eval("Teslimat").ToString().ToUpper().Equals("")?"Kitabı Henüz Teslim Etmediniz.":Eval("Teslimat") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <RowStyle ForeColor="IndianRed" Width="200" />
        </asp:GridView>
    </div>

     <div class="confirm" id="confirm" runat="server" visible="false">
        <asp:Label Text="Henüz bir kitap kiralamadınız." runat="server" class="confirmLabel2" />
    </div>
</asp:Content>
