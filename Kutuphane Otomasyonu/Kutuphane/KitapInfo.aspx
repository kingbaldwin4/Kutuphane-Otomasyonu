<%@ Page Title="Kitap Bilgileri" Language="C#" MasterPageFile="~/Uye.Master" AutoEventWireup="true" CodeBehind="KitapInfo.aspx.cs" Inherits="Kutuphane.KitapInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <style>
     input[type=text]:hover{
         color:black;
     }
 </style>
    <div id="kitapInfo" runat="server" class="table1">
        <table>
            <tr>
                <td>
                    <div class="rateBook">
                        <input runat="server" type="radio" id="no5" name="rateBook" value="5" />
                        <label for="no5"></label>
                        <input runat="server" type="radio" id="no4" name="rateBook" value="4" />
                        <label for="no4"></label>
                        <input runat="server" type="radio" id="no3" name="rateBook" value="3" />
                        <label for="no3"></label>
                        <input runat="server" type="radio" id="no2" name="rateBook" value="2" />
                        <label for="no2"></label>
                        <input runat="server" type="radio" id="no1" name="rateBook" value="1" />
                        <label for="no1"></label>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" ID="voters" class="label1" Font-Size="Small" Style="Transform:translate(90px,-10px); color:firebrick" />
                </td>
            </tr>
        </table>

        <table>

            <tr>
                <td>
                    <asp:Label Text="Kitabın Adı : " runat="server" class="label1" ForeColor="Yellow" BackColor="DarkGray" />
                </td>
                <td>
                    <asp:Label ID="txtKitapAd" runat="server" class="label1" ForeColor="Yellow" BackColor="DarkGray" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Kitabın Yazarı : " runat="server" class="label1" ForeColor="Yellow" BackColor="DarkGray" />
                </td>
                <td>
                    <asp:Label ID="txtYazar" runat="server" class="label1" ForeColor="Yellow" BackColor="DarkGray" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Kitabın Yayıncısı : " runat="server" class="label1" ForeColor="Yellow" BackColor="DarkGray" />
                </td>
                <td>
                    <asp:Label ID="txtYayinci" runat="server" class="label1" ForeColor="Yellow" BackColor="DarkGray" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Kitabın Türü : " runat="server" class="label1" ForeColor="Yellow" BackColor="DarkGray" />
                </td>
                <td>
                    <asp:Label ID="txtTur" runat="server" class="label1" ForeColor="Yellow" BackColor="DarkGray" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Kitabın Sayfa Sayısı : " runat="server" class="label1" ForeColor="Yellow" BackColor="DarkGray" />
                </td>
                <td>
                    <asp:Label ID="txtSayfa" runat="server" class="label1" ForeColor="Yellow" BackColor="DarkGray" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Basım Tarihi : " runat="server" class="label1" ForeColor="Yellow" BackColor="DarkGray" />
                </td>
                <td>
                    <asp:Label ID="txtTarih" runat="server" class="label1" ForeColor="Yellow" BackColor="DarkGray" />
                </td>
            </tr>  
            <tr>
                <td>
                    <asp:Label Text="Kitap Adeti : " runat="server" class="label1" ForeColor="Yellow" BackColor="DarkGray" />
                </td>
                <td>
                    <asp:Label ID="txtAdet" runat="server" class="label1" ForeColor="Yellow" BackColor="DarkGray" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Aktif Olma Durumu : " runat="server" class="label1" ForeColor="Yellow" BackColor="DarkGray" />
                </td>
                <td>
                    <asp:Label ID="txtAktif" runat="server" class="label1" ForeColor="Yellow" BackColor="DarkGray" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label Text="Fotoğraf : " runat="server" class="label1"/>
                </td>

            </tr>
            <tr>
                <td colspan="2">
                    <asp:Image ID="imgKitap" runat="server" Width="300px" class="imageKitap2"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button runat="server" class="butonKitap" Text="Yorum Yap" OnClick="Yorum_Click" value='<%#Eval("KitapID")%>' />
                </td>
            </tr>
        </table>
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
                                        <asp:Label runat="server" Text="Kitap Adı : " class="label1" ForeColor="LightPink" BackColor="DarkBlue" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("KitapAd") %>' class="label1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Yazar : " class="label1" ForeColor="LightPink" BackColor="DarkBlue" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("Yazar") %>' class="label1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Yayınevi: " class="label1" ForeColor="LightPink" BackColor="DarkBlue" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("Yayinci") %>' class="label1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Sayfa Sayısı : " class="label1" ForeColor="LightPink" BackColor="DarkBlue" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("SayfaSayisi") %>' class="label1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Tür : " class="label1" ForeColor="LightPink" BackColor="DarkBlue" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("Tur") %>' class="label1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Basım Tarihi : " class="label1" ForeColor="LightPink" BackColor="DarkBlue" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("BasimTarih") %>' class="label1" />
                                    </td>
                                </tr>   
                                <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Kitap Adeti : " class="label1" ForeColor="LightPink" BackColor="DarkBlue" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Eval("KitapSayisi") %>' class="label1" />
                                    </td>
                                </tr>
                                 <tr>
                                    <td>
                                        <asp:Label runat="server" Text="Aktif Olma Durumu : " class="label1" ForeColor="LightPink" BackColor="DarkBlue" />
                                    </td>
                                    <td>
                                        <asp:Label runat="server" Text='<%#Convert.ToInt32(Eval("KitapSayisi").ToString())==0 ? "Kitap Bulunmamaktadır. :( " :"Kitap Bulunmaktadır. :D " %>' class="label1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:HyperLink runat="server" class="label1" Text="Kitabı Görüntüle" NavigateUrl='<%#Eval("KitapID","~/KitapInfo.aspx?bookID={0}") %>' />
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

</asp:Content>


