<%@ Page Title="Kitaba Ait Yorumlar" Language="C#" MasterPageFile="~/Yetkili.Master" AutoEventWireup="true" CodeBehind="YetkiliYorumlar.aspx.cs" Inherits="Kutuphane.YetkiliYorumlar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div runat="server" id="yorum">

        <asp:GridView ID="gridComment" runat="server" AutoGenerateColumns="false" ShowHeader="false" class="gridComment">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <table>
                             <tr>
                                <td></td>
                                <td>
                                    <table class="thumbs">
                                        <tr>
                                            <td>
                                                <asp:HyperLink Style="transform: translate(810px,12px);color:black;" class="LikeButtons" ID="trash" runat="server"  NavigateUrl='<%#Eval("YorumID","~/YetkiliYorumlar.aspx?DeleteComment={0}") %>'><i class="fa fa-trash"></i></asp:HyperLink>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="NameBox">
                                        <asp:HyperLink runat="server" class="label1" Style="text-decoration: none" Text='<%#Eval("KullaniciAd")%>' NavigateUrl='<%#Eval("KullaniciID","~/YetkiliYorumlar.aspx?SelectedUser={0}") %>' />
                                    </div>
                                </td>
                                <td>
                                    <div class="CommentBox">
                                        <asp:Label ID="theComment" Text='<%#Eval("Yorum")%>' runat="server" />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>

                                    <table class="thumbs">
                                        <tr>
                                            <td>
                                                <asp:Label Text='<%#Eval("YorumTarih") %>' runat="server" class="label1" />
                                            </td>
                                            <td>
                                                <asp:HyperLink Text='<%#Eval("Begen")%>' runat="server" class="label1" NavigateUrl='<%#Eval("YorumID","~/YetkiliYorumlar.aspx?YorumLK={0}") %>' Style="text-decoration: none; transform: translateX(710px)" />
                                            </td>
                                            <td>
                                                <asp:Label class="LikeButtons" ID="likeButton" runat="server" Style="transform: translateX(710px)"><i class="fa fa-thumbs-up"></i></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label class="LikeButtons" ID="dislikeButton" runat="server" Style="transform: translateX(710px)"><i class="fa fa-thumbs-down"></i></asp:Label>
                                            </td>
                                            <td>
                                                <asp:HyperLink Text='<%#Eval("Dislike")%>' runat="server" class="label1" NavigateUrl='<%#Eval("YorumID","~/YetkiliYorumlar.aspx?YorumDK={0}") %>' Style="text-decoration: none; transform: translateX(710px)" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <RowStyle BorderColor="SeaGreen" ForeColor="SeaGreen" Height="100px" />
        </asp:GridView>
    </div>

    <div class="confirm" id="empty" runat="server" visible="false">
        <asp:Label Text="Kitap hakkında henüz bir yorum yapılmamıştır." runat="server" class="confirmLabelDel" />
    </div>

    <div class="alert" runat="server" id="alert" visible="false">
        <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
        <strong>Karakter sınırını aşmayınız!</strong> 350 karakter.
    </div>
    <div class="alert" runat="server" id="alert2" visible="false">
        <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
        <strong>Daha önce verdiğiniz puan değiştirilmiştir!</strong>
    </div>

    <div class="alert2" runat="server" id="whoLiked" visible="false">
        <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
        <asp:GridView ID="gridLikers" runat="server" AutoGenerateColumns="false" ShowHeader="false" class="likeGrid" Width="100px">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink runat="server" class="label1" Style="text-decoration: none" Text='<%#Eval("KullaniciAd")%>' NavigateUrl='<%#Eval("KullaniciID","~/YetkiliYorumlar.aspx?SelectedUser={0}") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <RowStyle BorderColor="DarkSeaGreen" ForeColor="White" Height="20px" />

        </asp:GridView>
    </div>

</asp:Content>
