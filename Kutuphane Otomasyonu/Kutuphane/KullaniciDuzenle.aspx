<%@ Page Title="Kullanıcıyı Düzenle" Language="C#" MasterPageFile="~/Yetkili.Master" AutoEventWireup="true" CodeBehind="KullaniciDuzenle.aspx.cs" Inherits="Kutuphane.KullaniciDuzenle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        input[type=text]:hover{
            color:black;
        }
        input[type=text]:focus{
            border-color:chocolate;
        }
    </style>
    <div id="search" runat="server" class="searchDuzen">

        <table class="tableSearch">
            <tr>
                <td>
                    <asp:TextBox type="text" placeholder="Kullanıcı adını ya da ID bilgisini giriniz.." name="search2" ID="txtsearchID" runat="server" />

                </td>
                <td>
                    <asp:Button Text="Arama" runat="server" OnClick="Search_Click" ID="Button1" class="butonForSearching" />

                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label Text="Aradığınız Kullanıcı Bulunamadı." runat="server" ID="lblBulunamadi" Visible="false" />
                </td>
            </tr>
        </table>
    </div>

    <div class="mainDiv" id="list" runat="server" style="transform: translate(-30px,200px)">
        <asp:GridView ID="gridKullanici" runat="server" class="grid" AutoGenerateColumns="false">
            <HeaderStyle Font-Size="Large" ForeColor="#006600" Width="200" Height="30" />
            <Columns>
                <asp:TemplateField HeaderText="Kullanıcı ID">
                    <ItemTemplate>
                        <asp:HyperLink runat="server" class="butonKitap" Text='<%#Eval("ID") %>' NavigateUrl='<%#Eval("ID","~/KullaniciDuzenle.aspx?kullaniciID={0}") %>' ForeColor="DarkRed" BackColor="White"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Kullanıcı Adı">
                    <ItemTemplate>
                        <asp:HyperLink runat="server" class="butonKitap" Text='<%#Eval("KullaniciAd") %>' NavigateUrl='<%#Eval("ID","~/KullaniciDuzenle.aspx?kullaniciID={0}") %>' ForeColor="DarkRed" BackColor="White" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Ad" HeaderText="Kullanıcının Adı" />
                <asp:BoundField DataField="Soyad" HeaderText="Kullanıcının Soyadı" />
                <asp:BoundField DataField="Telefon" HeaderText="Telefon Numarası" />
                <asp:BoundField DataField="Adres" HeaderText="Adresi" />
            <%--    <asp:TemplateField HeaderText="Düzenle">
                    <ItemTemplate>
                        <asp:HyperLink runat="server" class="imge" NavigateUrl='<%#Eval("ID","~/KullaniciDuzenle.aspx?kullaniciID={0}" )%>'><i class="fa fa-cog"></i></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>--%>
                <asp:TemplateField HeaderText="Kullanıcıyı Sil">
                    <ItemTemplate>
                        <asp:CheckBox runat="server" ID="forDelete"></asp:CheckBox>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

            <RowStyle ForeColor="#336600" Width="200" />
        </asp:GridView>
    </div>

    <div id="delButon" runat="server" class="delBox">
        <asp:Button Text="Seçilen Kişileri Sil" runat="server" class="delButton" OnClick="MultipleDel_Click" />
    </div>

    <div id="add" runat="server" class="table1" visible="false">
        <table>

            <tr>
                <td>
                    <asp:Label Text="Adı : " runat="server" class="label1" BackColor="HotPink" ForeColor="LightGray" />
                </td>
                <td>
                    <asp:TextBox ID="txtAd" runat="server" class="text1" />
                    <asp:RequiredFieldValidator ID="req1" runat="server" ControlToValidate="txtAd" ErrorMessage="*" ForeColor="#ff3300" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Soyadı : " runat="server" class="label1" BackColor="HotPink" ForeColor="LightGray" />
                </td>
                <td>
                    <asp:TextBox ID="txtSoyad" runat="server" class="text1" />
                    <asp:RequiredFieldValidator ID="req2" runat="server" ControlToValidate="txtSoyad" ErrorMessage="*" ForeColor="#ff3300" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Telefon Numarası : " runat="server" class="label1" BackColor="HotPink" ForeColor="LightGray" />
                </td>
                <td>
                    <asp:TextBox ID="txtNo" runat="server" class="text1" onkeypress="if(isNaN(String.fromCharCode(event.keyCode))) return false;" />
                    <asp:RequiredFieldValidator ID="req3" runat="server" ControlToValidate="txtNo" ErrorMessage="*" ForeColor="#ff3300" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Adresi : " runat="server" class="label1" BackColor="HotPink" ForeColor="LightGray" />
                </td>

            </tr>
            <tr>
                <td colspan="2">
                    <asp:TextBox ID="txtAdres" runat="server" class="textMulti" TextMode="MultiLine" />
                    <asp:RequiredFieldValidator ID="req" runat="server" ControlToValidate="txtAdres" ErrorMessage="*" ForeColor="#ff3300" />
                </td>
            </tr>
            <tr>
                <td colspan="2">

                    <asp:Button Text="Kaydet" ID="btnKaydet" runat="server" OnClick="btnKaydet_Click" type="submit" class="buttons" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button Text="Kiralanan Kitapları Gör" ID="btnRent" runat="server" OnClick="btnKira_Click" type="submit" class="buttons"  />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button Text="Kullanıcıya Ait Yorumlar" ID="btnComment" runat="server" OnClick="btnYorum_Click" type="submit" class="buttons" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button Text="Kullanıcıyı Sil" ID="btnSil" runat="server" OnClick="btnSil_Click" type="submit" class="buttons" />
                </td>
            </tr>


            <tr>
                <td colspan="2">

                    <asp:Label ID="lblAciklama" runat="server" class="errorBos" />
                </td>
            </tr>

        </table>
    </div>

    <div class="mainDiv" id="kira" runat="server" visible="false">
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

                <asp:BoundField DataField="Baslangic" HeaderText="Başlangıç Tarihi" />
                <asp:BoundField DataField="Bitis" HeaderText="Bitiş Tarihi" />
                <asp:TemplateField HeaderText="Teslimat Tarihi">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%#Eval("Teslimat").ToString().ToUpper().Equals("")?"Kitap Henüz Teslim Edilmemiştir.":Eval("Teslimat") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>

            <RowStyle ForeColor="#336600" Width="200" />
        </asp:GridView>
    </div>

    <div class="confirm" id="confirm" runat="server" visible="false">
        <asp:Label Text="Kullanıcıya ait bilgiler başarılı bir şekilde güncellenmiştir." runat="server" class="confirmLabel2" />
    </div>
    <div class="confirm" id="confirmDel" runat="server" visible="false">
        <asp:Label Text="Kullanıcı başarılı bir şekilde silinmiştir." runat="server" class="confirmLabelDel" />
    </div>
    <div class="confirm" id="kiraYok" runat="server" visible="false">
        <asp:Label Text="Kullanıcı henüz herhangi bir kitap kiralamamıştır." runat="server" class="confirmLabelDel" />
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
                                        <asp:Label runat="server" Text="Kitap Adı : " class="label1" BackColor="WhiteSmoke" ForeColor="SeaGreen" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("KitapAd") %>' class="label1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Yazar : " class="label1" BackColor="WhiteSmoke" ForeColor="SeaGreen" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("Yazar") %>' class="label1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Yayınevi: " class="label1" BackColor="WhiteSmoke" ForeColor="SeaGreen" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("Yayinci") %>' class="label1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Sayfa Sayısı : " class="label1" BackColor="WhiteSmoke" ForeColor="SeaGreen" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("SayfaSayisi") %>' class="label1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Tür : " class="label1" BackColor="WhiteSmoke" ForeColor="SeaGreen"/>
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("Tur") %>' class="label1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Basım Tarihi : " class="label1" BackColor="WhiteSmoke" ForeColor="SeaGreen" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("BasimTarih") %>' class="label1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Aktif Olma Durumu : " class="label1" BackColor="WhiteSmoke" ForeColor="SeaGreen" />
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
</asp:Content>
