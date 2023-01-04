<%@ Page Title="Kitap Düzenleme" Language="C#" MasterPageFile="~/Yetkili.Master" AutoEventWireup="true" CodeBehind="KitapDuzenle.aspx.cs" Inherits="Kutuphane.KitapDuzenle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        input[type=text]:hover{
            color:black;
        }
    </style>
    
    <div id="search" runat="server" class="searchDuzen">

        <table class="tableSearch">
            <tr>
                <td>
                    <asp:TextBox type="text" placeholder="Kitabın ya da yazarın adını giriniz.." name="search2" ID="txtsearch" runat="server" BackColor="Turquoise" ForeColor="SandyBrown" />

                </td>
                <td>
                    <asp:Button Text="Arama" runat="server" OnClick="Search_Click" ID="Button1" class="butonForSearching" />

                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label Text="Aradığınız Kitap Bulunamadı." runat="server" ID="lblBulunamadi" Visible="false" BackColor="Turquoise" ForeColor="SandyBrown"/>
                </td>
            </tr>
        </table>
    </div>
    <div style="transform: translateY(205px); margin-left: 640px;" id="divTur" runat="server" >
        <table>
            <tr>
                <td>
                    <asp:Button runat="server" Text="Roman" ID="roman" OnClick="Tur_Click" class="btnTur" BackColor="Turquoise" ForeColor="Gold" /></td>
                <td>
                    <asp:Button runat="server" Text="Şiir" ID="siir" OnClick="Tur_Click" class="btnTur" BackColor="Turquoise" ForeColor="Gold" /></td>
                <td>
                    <asp:Button runat="server" Text="Bilim" ID="bilim" OnClick="Tur_Click" class="btnTur" BackColor="Turquoise" ForeColor="Gold" /></td>
                <td>
                    <asp:Button runat="server" Text="Çocuk Kitabı" ID="cocukKitabi" OnClick="Tur_Click" class="btnTur" BackColor="Turquoise" ForeColor="Gold"/></td>
                <td>
                    <asp:Button runat="server" Text="Çizgi Roman" ID="cizgiRoman" OnClick="Tur_Click" class="btnTur" BackColor="Turquoise" ForeColor="Gold"/></td>
                <td>
                    <asp:Button runat="server" Text="Tarih" ID="tarih" OnClick="Tur_Click" class="btnTur" BackColor="Turquoise" ForeColor="Gold"/></td>
                <td>
                    <asp:Button runat="server" Text="Felsefe" ID="felsefe" OnClick="Tur_Click" class="btnTur" BackColor="Turquoise" ForeColor="Gold"/></td>
            </tr>
        </table>
    </div>
    <div id="delButon" runat="server" class="delBox">
        <asp:Button Text="Seçili Ögeleri Sil" runat="server" class="delButton" OnClick="MultipleDel_Click" />
    </div>
    <div class="mainDiv" id="list" runat="server" style="transform: translate(-30px,200px)">
        <asp:GridView ID="gridKitaplar" runat="server" class="grid" AutoGenerateColumns="false">
            <HeaderStyle Font-Size="Large" ForeColor="#006600" Width="200" Height="30" />
            <Columns>
                <asp:TemplateField HeaderText="Kitap Adı">
                    <ItemTemplate>
                        <asp:HyperLink runat="server" class="butonKitap" Text='<%#Eval("KitapAd") %>' NavigateUrl='<%#Eval("KitapID","~/Kiralama.aspx?kitapIDYorum={0}") %>' />
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
                <asp:TemplateField HeaderText="Düzenle">
                    <ItemTemplate>
                        <asp:HyperLink runat="server" class="imge" NavigateUrl='<%#Eval("KitapID","~/KitapDuzenle.aspx?bookID={0}" )%>'><i class="fa fa-cog"></i></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Kitabı Sil">
                    <ItemTemplate>
                        <asp:CheckBox runat="server" ID="forDelete"></asp:CheckBox>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>

            <RowStyle ForeColor="#336600" Width="200" />
        </asp:GridView>
    </div>
    <div id="add" runat="server" class="table1" visible="false">
        <table>

            <tr>
                <td>
                    <asp:Label Text="Kitabın Adı : " runat="server" class="label1" />
                </td>
                <td>
                    <asp:TextBox ID="txtKitapAd" runat="server" class="text1" />
                    <asp:RequiredFieldValidator ID="req1" runat="server" ControlToValidate="txtKitapAd" ErrorMessage="*" ForeColor="Black" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Kitabın Yazarı : " runat="server" class="label1" />
                </td>
                <td>
                    <asp:TextBox ID="txtYazar" runat="server" class="text1" />
                    <asp:RequiredFieldValidator ID="req2" runat="server" ControlToValidate="txtYazar" ErrorMessage="*" ForeColor="Black" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Kitabın Yayıncısı : " runat="server" class="label1" />
                </td>
                <td>
                    <asp:TextBox ID="txtYayinci" runat="server" class="text1" />
                    <asp:RequiredFieldValidator ID="req3" runat="server" ControlToValidate="txtYayinci" ErrorMessage="*" ForeColor="Black" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Kitabın Türü : " runat="server" class="label1" />
                </td>
                <td>
                    <asp:TextBox ID="txtTur" runat="server" class="text1" />
                    <asp:RequiredFieldValidator ID="req4" runat="server" ControlToValidate="txtTur" ErrorMessage="*" ForeColor="Black" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Kitabın Sayfa Sayısı : " runat="server" class="label1" />
                </td>
                <td>
                    <asp:TextBox ID="txtSayfa" runat="server" class="text1" onkeypress="if(isNaN(String.fromCharCode(event.keyCode))) return false;" />
                    <asp:RequiredFieldValidator ID="req5" runat="server" ControlToValidate="txtSayfa" ErrorMessage="*" ForeColor="Black" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Basım Tarihi : " runat="server" class="label1" />
                </td>
                <td>
                    <asp:TextBox ID="txtTarih" runat="server" class="text1" />
                    <asp:RequiredFieldValidator ID="req6" runat="server" ControlToValidate="txtTarih" ErrorMessage="*" ForeColor="Black" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Kitap Adeti : " runat="server" class="label1" />
                </td>
                <td>
                    <asp:TextBox ID="txtAdet" runat="server" class="text1" />
                    <asp:RequiredFieldValidator ID="req7" runat="server" ControlToValidate="txtTarih" ErrorMessage="*" ForeColor="Black" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label Text="Fotoğraf : " runat="server" class="label1" />
                </td>

            </tr>
            <tr>
                <td colspan="2">
                    <asp:Image ID="imgKitap" runat="server" Height="135px" Width="100px" class="imageKitap" />
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
                    <asp:Label ID="labelImg" runat="server" class="errorUpload" />
                </td>
            </tr>
            <tr>
                <td colspan="2">

                    <asp:Button Text="Kaydet" ID="btnKaydet" runat="server" OnClick="btnKaydet_Click" type="submit" class="buttons" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button Text="Kitabı Sil" ID="btnSil" runat="server" OnClick="btnSil_Click" type="submit" class="buttons" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="alertDel" Text="Kitap iade edilmeden silinemez." CssClass="label1" runat="server" Visible="false" Style="transform: translate(20px,40px)" />
                </td>
            </tr>

            <tr>
                <td colspan="2">

                    <asp:Label ID="lblKitapDuzenle" runat="server" class="error" />
                </td>
            </tr>

        </table>
        <asp:Label ID="lblKitapHata" runat="server" class="errorBos" Visible="false" />
    </div>
    <div class="confirm" id="confirm" runat="server" visible="false">
        <asp:Label Text="Kitaba ait bilgiler başarılı bir şekilde güncellenmiştir." runat="server" class="confirmLabel2" BackColor="Turquoise" ForeColor="SandyBrown"/>
    </div>
    <div class="confirm" id="confirmDel" runat="server" visible="false">
        <asp:Label Text="Kitap başarılı bir şekilde silinmiştir." runat="server" class="confirmLabelDel" BackColor="Turquoise" ForeColor="SandyBrown" />
    </div>

    <div id="liste" class="mainDiv" runat="server" visible="false">
        <asp:GridView ID="gridList" runat="server" AutoGenerateColumns="false" ShowHeader="false" class="grid">
            <Columns>
                <asp:TemplateField HeaderText="Fotoğraf">
                    <ItemTemplate>
                        <asp:Image ID="imgKitap" runat="server" ImageUrl='<%#Eval("Fotograf") %>' Height="480px" />
                        <div class="overlay">
                            <table class="tablo">
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Kitap Adı : " class="label1" BackColor="SkyBlue" ForeColor="DarkGray"/>
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("KitapAd") %>' class="label1" BackColor="SkyBlue" ForeColor="DarkGray" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Yazar : " class="label1" BackColor="SkyBlue" ForeColor="DarkGray" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("Yazar") %>' class="label1" BackColor="SkyBlue" ForeColor="DarkGray"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Yayınevi: " class="label1" BackColor="SkyBlue" ForeColor="DarkGray" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("Yayinci") %>' class="label1" BackColor="SkyBlue" ForeColor="DarkGray" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Sayfa Sayısı : " class="label1" BackColor="SkyBlue" ForeColor="DarkGray" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("SayfaSayisi") %>' class="label1" BackColor="SkyBlue" ForeColor="DarkGray"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Tür : " class="label1" BackColor="SkyBlue" ForeColor="DarkGray"/>
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("Tur") %>' class="label1" BackColor="SkyBlue" ForeColor="DarkGray"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Basım Tarihi : " class="label1" BackColor="SkyBlue" ForeColor="DarkGray"/>
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("BasimTarih") %>' class="label1" BackColor="SkyBlue" ForeColor="DarkGray"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Kitap Adeti : " class="label1" BackColor="SkyBlue" ForeColor="DarkGray"/>
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("KitapSayisi") %>' class="label1" BackColor="SkyBlue" ForeColor="DarkGray"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:HyperLink runat="server" class="label1" Text="Kitabı Düzenle" NavigateUrl='<%#Eval("KitapID","~/KitapDuzenle.aspx?bookID={0}") %>' Style="text-decoration: none" />
                                    </td>
                                </tr>

                            </table>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <RowStyle ForeColor="Bisque" Height="480px" />
        </asp:GridView>
    </div>

    <div class="alert" runat="server" id="multiple" visible="false">
        <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
        <strong>İade edilmeyen kitaplar silinmedi!</strong>
    </div>

</asp:Content>
