<%@ Page Title="Kiralanan Kitaplar" Language="C#" MasterPageFile="~/Yetkili.Master" AutoEventWireup="true" CodeBehind="Kiralananlar.aspx.cs" Inherits="Kutuphane.Kiralananlar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        input[type=text]:hover{
            color:black;
        }
    </style>
    <div class="mainDiv" id="mainPage" runat="server">
        <asp:GridView ID="gridKitaplar" runat="server" class="grid" AutoGenerateColumns="false">
            <HeaderStyle Font-Size="Large" ForeColor="#006600" Width="200" Height="30" />
            <Columns>
                <asp:TemplateField HeaderText="Kitap Adı">
                    <ItemTemplate>
                        <asp:HyperLink runat="server" class="butonKitap" Text='<%#Eval("KitapAd") %>' NavigateUrl='<%#Eval("KitapID","~/Kiralananlar.aspx?kitapID={0}") %>' />
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
                <asp:TemplateField HeaderText="Kiralayan">
                    <ItemTemplate>
                        <asp:HyperLink runat="server" class="butonKitap" Text='<%#Eval("KullaniciAd") %>' NavigateUrl='<%#Eval("ID","~/Kiralananlar.aspx?kullaniciID={0}") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Baslangic" HeaderText="Başlangıç Tarihi" />
                <asp:BoundField DataField="Bitis" HeaderText="Bitiş Tarihi" />
             <%--   <asp:TemplateField HeaderText="Teslimat Tarihi">
                    <ItemTemplate>
                        <asp:Label runat="server"  Text='<%#Eval("Teslimat").ToString().ToUpper().Equals("")?"Kitap Henüz Teslim Edilmemiştir.":Eval("Teslimat") %>' />
                    </ItemTemplate>
                </asp:TemplateField> --%>
                <asp:TemplateField HeaderText="Teslim Et">
                    <ItemTemplate>
                        <%--<asp:HyperLink runat="server" class="btnCheck"  NavigateUrl='<%#Eval("KitapID","~/Kiralananlar.aspx?kitapID2={0}"); Eval("KullaniciID","~/Kiralananlar.aspx?kullaniciID2={0}")%>' ><i class="fa fa-check"></i></asp:HyperLink>--%>
                        <asp:HyperLink runat="server" class="btnCheck"  NavigateUrl='<%# String.Format("~/Kiralananlar.aspx?kitapID2={0}&kullaniciID2={1}", DataBinder.Eval(Container.DataItem, "KitapID"), DataBinder.Eval(Container.DataItem, "KullaniciID"))%>' ><i class="fa fa-check"></i></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <RowStyle ForeColor="#336600" Width="200" />
        </asp:GridView>
    </div>

    <div id="liste" class="mainDiv" runat="server" visible="false">
        <asp:GridView ID="gridList" runat="server" AutoGenerateColumns="false" ShowHeader="false" class="grid">
            <Columns>
                <asp:TemplateField HeaderText="Fotoğraf">
                    <ItemTemplate>
                        <asp:Image ID="imgKitap" runat="server" ImageUrl='<%#Eval("Fotograf") %>' Width="300" />
                        <div class="overlay">
                            <table class="tablo">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Kitap Adı : " class="label1" BackColor="White" ForeColor="YellowGreen" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("KitapAd") %>' class="label1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Yazar : " class="label1" BackColor="White" ForeColor="YellowGreen" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("Yazar") %>' class="label1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Yayınevi: " class="label1" BackColor="White" ForeColor="YellowGreen" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("Yayinci") %>' class="label1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Sayfa Sayısı : " class="label1" BackColor="White" ForeColor="YellowGreen" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("SayfaSayisi") %>' class="label1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Tür : " class="label1" BackColor="White" ForeColor="YellowGreen" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("Tur") %>' class="label1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Basım Tarihi : " class="label1" BackColor="White" ForeColor="YellowGreen" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("BasimTarih") %>' class="label1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Aktif Olma Durumu : " class="label1" BackColor="White" ForeColor="YellowGreen" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("AktifPasif") %>' class="label1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:HyperLink runat="server" class="buttons" Text="Kitabı Düzenle" NavigateUrl='<%#Eval("KitapID","~/KitapDuzenle.aspx?bookID={0}") %>' />
                                    </td>
                                </tr>

                            </table>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

       <div class="confirm" id="iade" runat="server" visible="false">
        <asp:Label ID="lblIade" runat="server" class="confirmLabel2" />
    </div>


</asp:Content>
