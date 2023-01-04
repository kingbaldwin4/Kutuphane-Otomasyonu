<%@ Page Title="Anasayfa" Language="C#" MasterPageFile="~/Yetkili.Master" AutoEventWireup="true" CodeBehind="Anasayfa.aspx.cs" Inherits="Kutuphane.Anasayfa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> <!--Kitap türü seçmeyi sağlayan butonlar-->
    <div style="transform:translateY(15px); margin-left:680px;" id="divTur" runat="server" visible="false">
        <style>
            input[type=text][id=roman]:focus{
                background-color:blue;
            }
            input[type=text][id=siir]:focus{
                background-color:blue;
            }
            input[type=text][id=bilim]:focus{
                background-color:blue;
            }
            input[type=text][id=cocukKitabi]:focus{
                background-color:blue;
            }
            input[type=text][id=cizgiRoman]:focus{
                background-color:blue;
            }
            input[type=text][id=tarih]:focus{
                background-color:blue;
            }
            input[type=text][id=felsefe]:focus{
                background-color:blue;
            }

        </style>
        
        <table>
            <tr>
                <td class=""><asp:Button runat="server" Text="Roman" ID="roman" OnClick="Tur_Click" class="btnTur" ForeColor="Olive" BackColor="Wheat"/></td>
                <td><asp:Button runat="server" Text="Şiir" ID="siir" OnClick="Tur_Click" class="btnTur" ForeColor="Olive" BackColor="Wheat"/></td>
                <td><asp:Button runat="server" Text="Bilim" ID="bilim" OnClick="Tur_Click" class="btnTur" ForeColor="Olive" BackColor="Wheat"/></td>
                <td><asp:Button runat="server" Text="Çocuk Kitabı" ID="cocukKitabi" OnClick="Tur_Click" class="btnTur" ForeColor="Olive" BackColor="Wheat" /></td>
                <td><asp:Button runat="server" Text="Çizgi Roman" ID="cizgiRoman" OnClick="Tur_Click" class="btnTur" ForeColor="Olive" BackColor="Wheat"/></td>
                <td><asp:Button runat="server" Text="Tarih" ID="tarih" OnClick="Tur_Click" class="btnTur" ForeColor="Olive" BackColor="Wheat" /></td>
                <td><asp:Button runat="server" Text="Felsefe" ID="felsefe" OnClick="Tur_Click" class="btnTur" ForeColor="Olive" BackColor="Wheat" /></td>
            </tr>
        </table>
    </div>
    <div class="mainDiv" id="mainPage" runat="server"> <!--anasayfada gösterilecek olan kitapların listelendiği div etiketi-->
        <asp:GridView ID="gridKitaplar" runat="server" class="grid" AutoGenerateColumns="false">
            <HeaderStyle Font-Size="Large" ForeColor="#3333FF" Width="200" Height="30" BackColor="#FF9999" BorderStyle="Dashed" />
            <Columns>
                <asp:TemplateField HeaderText="Kitap Adı">
                    <ItemTemplate>
                        <asp:HyperLink runat="server" class="butonKitap" Text='<%#Eval("KitapAd") %>' NavigateUrl='<%#Eval("kitapID","~/Anasayfa.aspx?kitapID={0}") %>' />
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
                        <asp:Label runat="server" Text='<%#Convert.ToInt32(Eval("KitapSayisi").ToString())==0 ? "Kitap Bulunmamaktadır. :( " :"Kitap Bulunmaktadır. :D " %>' class="labelAna" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fotoğraf">
                    <ItemTemplate>
                        <asp:Image ID="imgKitap" runat="server" ImageUrl='<%#Eval("Fotograf") %>' Width="150" Height="200" />
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>

            <RowStyle ForeColor="#FF3300" Width="200" BorderStyle="Dashed" BackColor="MediumPurple" />
        </asp:GridView>
    </div>
    <div id="liste" class="mainDiv" runat="server" visible="false">   <!--Yazar ve yayıncıya ait kitapların listelendiği div etiketi-->
        <asp:GridView ID="gridList" runat="server" AutoGenerateColumns="false" ShowHeader="false" class="grid">
            <Columns>
                <asp:TemplateField HeaderText="Fotoğraf">
                    <ItemTemplate>
                        <asp:Image ID="imgKitap" runat="server" ImageUrl='<%#Eval("Fotograf") %>' Height="480px" />
                        <div class="overlay">
                            <table class="tablo">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Kitap Adı : " class="label1" ForeColor="LightGreen" BackColor="SandyBrown" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("KitapAd") %>' class="label1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Yazar : " class="label1" ForeColor="LightGreen" BackColor="SandyBrown" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("Yazar") %>' class="label1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Yayınevi: " class="label1" ForeColor="LightGreen" BackColor="SandyBrown" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("Yayinci") %>' class="label1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Sayfa Sayısı : " class="label1" ForeColor="LightGreen" BackColor="SandyBrown" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("SayfaSayisi") %>' class="label1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Tür : " class="label1" ForeColor="LightGreen" BackColor="SandyBrown" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("Tur") %>' class="label1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Basım Tarihi : " class="label1" ForeColor="LightGreen" BackColor="SandyBrown" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("BasimTarih") %>' class="label1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Stok : " class="label1" ForeColor="LightGreen" BackColor="SandyBrown" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("KitapSayisi")%>' class="label1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:HyperLink runat="server" class="butonKitap" Style="transform: translate(-60px,30px)" Text="Kitabı Görüntüle" NavigateUrl='<%#Eval("KitapID","~/Kiralama.aspx?kitapIDYorum={0}" )%>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:HyperLink runat="server" class="butonKitap" Text="Kitabı Düzenle" Style="transform: translate(-60px,50px)" NavigateUrl='<%#Eval("KitapID","~/KitapDuzenle.aspx?bookID={0}") %>' />
                                    </td>
                                </tr>

                            </table>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <RowStyle ForeColor="#CC0099" Height="480px" />
        </asp:GridView>
    </div>
    <%--    <button class="toTheTop"><i class="fa fa-arrow-up"></i></button>--%>
</asp:Content>
