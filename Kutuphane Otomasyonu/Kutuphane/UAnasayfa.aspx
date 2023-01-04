<%@ Page Title="Anasayfa" Language="C#" MasterPageFile="~/Uye.Master" AutoEventWireup="true" CodeBehind="UAnasayfa.aspx.cs" Inherits="Kutuphane.UAnasayfa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="alertWelcome" runat="server" id="alertWelcome" visible="false">
        <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
        <asp:Label runat="server" ID="txtCountDown" CssClass="labelWelcome" />
        <br />
        <asp:Label runat="server" ID="txtCountDown2" CssClass="labelWelcome2" />
    </div>
    <div style="transform: translateY(15px); margin-left: 680px;">
        <table>
            <tr>
                <td>
                    <asp:Button runat="server" Text="Roman" ID="roman" OnClick="Tur_Click" class="btnTur" BackColor="LightGreen" ForeColor="Black" /></td>
                <td>
                    <asp:Button runat="server" Text="Şiir" ID="siir" OnClick="Tur_Click" class="btnTur" BackColor="LightGreen" ForeColor="Black" /></td>
                <td>
                    <asp:Button runat="server" Text="Bilim" ID="bilim" OnClick="Tur_Click" class="btnTur" BackColor="LightGreen" ForeColor="Black"/></td>
                <td>
                    <asp:Button runat="server" Text="Çocuk Kitabı" ID="cocukKitabi" OnClick="Tur_Click" class="btnTur" BackColor="LightGreen" ForeColor="Black" /></td>
                <td>
                    <asp:Button runat="server" Text="Çizgi Roman" ID="cizgiRoman" OnClick="Tur_Click" class="btnTur" BackColor="LightGreen" ForeColor="Black" /></td>
                <td>
                    <asp:Button runat="server" Text="Tarih" ID="tarih" OnClick="Tur_Click" class="btnTur" BackColor="LightGreen" ForeColor="Black" /></td>
                <td>
                    <asp:Button runat="server" Text="Felsefe" ID="felsefe" OnClick="Tur_Click" class="btnTur" BackColor="LightGreen" ForeColor="Black" /></td>
            </tr>
        </table>
    </div>
    <div class="mainDiv" id="mainPage" runat="server">
        <asp:GridView ID="gridKitaplar" runat="server" class="grid" AutoGenerateColumns="false">
            <HeaderStyle Font-Size="Large" ForeColor="Gold" Width="200" Height="30" />
            <Columns>
                <asp:TemplateField HeaderText="Kitap Adı">
                    <ItemTemplate>
                        <asp:HyperLink runat="server" class="butonKitap" Text='<%#Eval("KitapAd") %>' NavigateUrl='<%#Eval("KitapID","~/UAnasayfa.aspx?kitapID={0}") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Yazar">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnYazar" runat="server" OnClick="Yazar_Click" class="butonKitap" Text='<%#Eval("Yazar") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Yayıncı">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnYayinci" runat="server" OnClick="Yayinci_Click" class="butonKitap" Text='<%#Eval("Yayinci") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="SayfaSayisi" HeaderText="Sayfa Sayısı" />
                <asp:BoundField DataField="Tur" HeaderText="Tür" />
                <asp:BoundField DataField="BasimTarih" HeaderText="Basım Tarihi" />
                <asp:BoundField DataField="KitapSayisi" HeaderText="Stok" />
                <asp:TemplateField HeaderText="Aktif Olma Durumu">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%#Convert.ToInt32(Eval("KitapSayisi").ToString())==0 ? "Kitap Bulunmamaktadır. :( " :"Kitap Bulunmaktadır. :D " %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fotoğraf">
                    <ItemTemplate>
                        <asp:Image ID="imgKitap" runat="server" ImageUrl='<%#Eval("Fotograf") %>' Width="150" Height="200" />
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>

            <RowStyle ForeColor="IndianRed" Width="200" />
        </asp:GridView>
    </div>



</asp:Content>
