<%@ Page Title="Kitap Kiralama" Language="C#" MasterPageFile="~/Yetkili.Master" AutoEventWireup="true" CodeBehind="Kiralama.aspx.cs" Inherits="Kutuphane.Kiralama" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div id="search" runat="server" class="search">
        <table class="tableSearch">
            <tr>
                <td>
                    <asp:TextBox type="text" placeholder="Kitabın ya da yazarın adını giriniz.." name="search2" ID="txtsearch" runat="server" BackColor="Black" ForeColor="Pink" />

                </td>
                <td>
                    <asp:Button Text="Arama" runat="server" OnClick="Search_Click" ID="Button1" class="butonForSearching" BackColor="LightGreen" ForeColor="DarkRed" />

                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label Text="Aradığınız Kitap Bulunamadı." runat="server" ID="lblBulunamadi" Visible="false" BackColor="Gold" ForeColor="Pink" />
                </td>
            </tr>
        </table>
    </div>


    <div id="add" runat="server" class="table1" visible="false" BackColor="LightGreen" ForeColor="DarkRed">
        <table>
            <tr>
                <td>
                    <div class="rateBook">
                        <input runat="server" type="radio" id="no5" name="rateBook" value="5" BackColor="Brown" ForeColor="White"/>
                        <label for="no5"></label>
                        <input runat="server" type="radio" id="no4" name="rateBook" value="4" BackColor="Brown" ForeColor="White" />
                        <label for="no4"></label>
                        <input runat="server" type="radio" id="no3" name="rateBook" value="3" BackColor="Brown" ForeColor="White"/>
                        <label for="no3"></label>
                        <input runat="server" type="radio" id="no2" name="rateBook" value="2" BackColor="Brown" ForeColor="White" />
                        <label for="no2"></label>
                        <input runat="server" type="radio" id="no1" name="rateBook" value="1" BackColor="Brown" ForeColor="White" />
                        <label for="no1"></label>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" ID="voters" class="label1" Font-Size="Small" Style="transform: translate(90px,-10px); color: firebrick" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:Label Text="Kitabın Adı : " runat="server" class="label1" BackColor="LightGreen" ForeColor="DarkRed" />
                </td>
                <td>
                    <asp:Label ID="txtKitapAd" runat="server" class="label1" BackColor="LightGray" ForeColor="DarkRed" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Kitabın Yazarı : " runat="server" class="label1" BackColor="LightGreen" ForeColor="DarkRed"/>
                </td>
                <td>
                    <asp:Label ID="txtYazar" runat="server" class="label1" BackColor="LightGray" ForeColor="DarkRed" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Kitabın Yayıncısı : " runat="server" class="label1" BackColor="LightGreen" ForeColor="DarkRed" />
                </td>
                <td>
                    <asp:Label ID="txtYayinci" runat="server" class="label1" BackColor="LightGray" ForeColor="DarkRed" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Kitabın Türü : " runat="server" class="label1" BackColor="LightGreen" ForeColor="DarkRed" />
                </td>
                <td>
                    <asp:Label ID="txtTur" runat="server" class="label1" BackColor="LightGray" ForeColor="DarkRed" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Kitabın Sayfa Sayısı : " runat="server" class="label1" BackColor="LightGreen" ForeColor="DarkRed" />
                </td>
                <td>
                    <asp:Label ID="txtSayfa" runat="server" class="label1" BackColor="LightGray" ForeColor="DarkRed" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Basım Tarihi : " runat="server" class="label1" BackColor="LightGreen" ForeColor="DarkRed"/>
                </td>
                <td>
                    <asp:Label ID="txtTarih" runat="server" class="label1" BackColor="LightGray" ForeColor="DarkRed" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Kitap Adeti : " runat="server" class="label1" BackColor="LightGreen" ForeColor="DarkRed" />
                </td>
                <td>
                    <asp:Label ID="txtAdet" runat="server" class="label1" BackColor="LightGray" ForeColor="DarkRed" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Aktif Olma Durumu : " runat="server" class="label1" BackColor="LightGreen" ForeColor="DarkRed" />
                </td>
                <td>
                    <asp:Label ID="txtAktif" runat="server" class="label1" BackColor="LightGray" ForeColor="DarkRed"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label Text="Fotoğraf : " runat="server" class="label1" />
                </td>

            </tr>
            <tr>
                <td colspan="2">
                    <asp:Image ID="imgKitap" runat="server" Width="300px" class="imageKitap2" />
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <asp:Button Text="Kitabı Kirala" ID="btnKira" runat="server" OnClick="btnKira_Click" type="submit" class="buttonKira" BackColor="LightGreen" ForeColor="DarkRed"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button Text="Kitabı İade Et" ID="btnIade" runat="server" OnClick="btnKira_Click" type="submit" class="buttonKira" BackColor="LightGray" ForeColor="DarkRed" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button runat="server" class="buttonKira" Text="Yorumları Görüntüle" ID="showComments" OnClick="Yorum_Click" BackColor="Beige" ForeColor="DarkGreen" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label class="label1" Text="Seçtiğiniz kitap bulunmamaktadır." ID="nobookA" Visible="false" runat="server" BackColor="Beige" ForeColor="DarkGreen" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label class="label1" ID="alert" Visible="false" runat="server" />
                </td>
            </tr>

        </table>
        <asp:Label ID="lblKitapHata" runat="server" class="errorBos" Visible="false" BackColor="Purple" ForeColor="Brown" />
    </div>


    <div class="confirm" id="confirm" runat="server" visible="false">
        <asp:Label Text="Kitaba ait bilgiler başarılı bir şekilde güncellenmiştir." runat="server" class="confirmLabel2" BackColor="Beige" ForeColor="DarkGreen" />
    </div>


    <div class="confirm" id="confirmDel" runat="server" visible="false">
        <asp:Label Text="Kitap başarılı bir şekilde silinmiştir." runat="server" class="confirmLabelDel" BackColor="Beige" ForeColor="DarkGreen" />
    </div>

    <div class="confirm" id="confirmRent" runat="server" visible="false">
        <asp:Label Text="Kitap kiralama başarılı bir şekilde kaydedilmiştir." runat="server" class="confirmLabelDel" BackColor="Beige" ForeColor="DarkGreen" />
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
                                        <asp:Label runat="server" Text="Kitap Adı : " class="label1" BackColor="Orange" ForeColor="DarkBlue"/>
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("KitapAd") %>' class="label1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Yazar : " class="label1" BackColor="Orange" ForeColor="DarkBlue" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("Yazar") %>' class="label1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Yayınevi: " class="label1" BackColor="Orange" ForeColor="DarkBlue" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("Yayinci") %>' class="label1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Sayfa Sayısı : " class="label1" BackColor="Orange" ForeColor="DarkBlue" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("SayfaSayisi") %>' class="label1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Tür : " class="label1" BackColor="Orange" ForeColor="DarkBlue" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("Tur") %>' class="label1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Basım Tarihi : " class="label1" BackColor="Orange" ForeColor="DarkBlue" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("BasimTarih") %>' class="label1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Kitap Adeti : " class="label1" BackColor="Orange" ForeColor="DarkBlue" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("KitapSayisi") %>' class="label1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Aktif Olma Durumu : " class="label1" BackColor="Orange" ForeColor="DarkBlue" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Convert.ToInt32(Eval("KitapSayisi").ToString())==0 ? "Kitap Bulunmamaktadır. :( " :"Kitap Bulunmaktadır. :D " %>' class="label1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:HyperLink runat="server" Text="Kitabı Görüntüle" NavigateUrl='<%#Eval("KitapID","~/Kiralama.aspx?kitapIDYorum={0}" )%>' class="label1" />
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

    <div class="divKira" id="kira" visible="false" runat="server">
        <asp:Image ID="imageKitap" runat="server" Width="300px" class="imageKira" />
        <table class="tableKira">
            <tr>
                <td>
                    <asp:Label runat="server" Text="Kitap Adı : " class="label1" BackColor="Orange" ForeColor="DarkBlue" />
                </td>
                <td>
                    <asp:Label runat="server" class="label1" ID="lblkitapAd" BackColor="Orange" ForeColor="DarkBlue" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" Text="Yazar : " class="label1" BackColor="Orange" ForeColor="DarkBlue" />
                </td>
                <td>
                    <asp:Label runat="server" class="label1" ID="lblYazar" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" Text="Kullanıcı Adı : " class="label1" BackColor="Orange" ForeColor="DarkBlue" />
                </td>
                <td>
                    <asp:TextBox runat="server" ID="lblKullaniciAdi" class="text1" />
                    <asp:RequiredFieldValidator ID="req1" runat="server" ControlToValidate="lblKullaniciAdi" ErrorMessage="*" ForeColor="#ff3300" />


                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <asp:Label runat="server" Text="Başlangıç Tarihi : " class="label1"  />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Calendar runat="server" class="calendar" ID="lblBaslangicTarih"  />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label runat="server" Text="Bitiş Tarihi : " class="label1" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Calendar runat="server" class="calendar" ID="lblBitisTarih" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnKitap" class="buttons" Text="Kiralamayı Onayla" OnClick="btnOnay_Click" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="errorMessage" runat="server" class="labelError" Text="Lütfen günü doğru seçiniz" Visible="false" BackColor="LightYellow" ForeColor="DarkSalmon" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="errorMessageK" runat="server" class="labelError" Text="Seçtiğiniz kullanıcı bulunamadı." Visible="false" BackColor="LightYellow" ForeColor="DarkSalmon" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="errorKullanici" runat="server" class="labelError" Text="Kitabı iade etmeden tekrar kiralayamazsınız." Visible="false" style="transform:translate(5px,-10px)" BackColor="LightYellow" ForeColor="DarkSalmon"/>
                </td>
            </tr>
        </table>
    </div>

    <div class="confirm" id="iade" runat="server" visible="false">
        <asp:Label ID="lblIade" runat="server" class="confirmLabelDel" Style="transform: translateX(-20px)" />
    </div>

    <div class="confirm" id="iadeInfo" runat="server" visible="false">
        <table class="table1" style="transform: translate(-40px,10px)">
            <tr>
                <td><asp:Label CssClass="label1" Text="Adı Soyadı : " runat="server" BackColor="LightGreen" ForeColor="DarkSalmon" /></td>
                <td>
                    <asp:Label CssClass="label1" id="fullNameIade" runat="server" BackColor="LightGreen" ForeColor="DarkSalmon" />
                </td>
            </tr>
            <tr>
                <td><asp:Label CssClass="label1" Text="Kullanıcı Adı : " runat="server" BackColor="LightGreen" ForeColor="DarkSalmon" /></td>
                <td>
                    <asp:Label CssClass="label1" id="usernameIade" runat="server" BackColor="LightGreen" ForeColor="DarkSalmon"/>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label CssClass="label1" Text="Kullanıcı ID : " runat="server" BackColor="LightGreen" ForeColor="DarkSalmon" /></td>
                <td>
                    <asp:DropDownList ID="kullaniciIDiade" AutoPostBack="true" runat="server" OnSelectedIndexChanged="Changed" >
                         <asp:ListItem Value="" Text="" />
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button CssClass="butonKitap" runat="server" OnClick="iadeOnay_Click" Text="İade Et" BackColor="LightGreen" ForeColor="DarkSalmon" />
                </td>
            </tr>
        </table>
    </div>

</asp:Content>
