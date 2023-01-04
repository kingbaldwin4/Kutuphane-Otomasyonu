<%@ Page Title="Kitaba Ait Yorumlar" Language="C#" MasterPageFile="~/Uye.Master" AutoEventWireup="true" CodeBehind="Yorum.aspx.cs" Inherits="Kutuphane.Yorum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        input[type=button]:hover{
            background-color:red;
        }
    </style>
    <div runat="server" id="yorum">
        <table>
            <tr>
                <td>
                    <asp:Label ID="Curuser" CssClass="userC" runat="server" />
                </td>
                <td>
                    <asp:TextBox ID="txtYorum" CssClass="mainComment" TextMode="MultiLine" runat="server" MaxLength="350" Width="400px" Height="150px" />
                </td>
            </tr>
            <tr>
                <td>
                    <div class="rate">
                        <input type="radio" id="star5" name="rate" value="5" />
                        <label for="star5"></label>
                        <input type="radio" id="star4" name="rate" value="4" />
                        <label for="star4"></label>
                        <input type="radio" id="star3" name="rate" value="3" />
                        <label for="star3"></label>
                        <input type="radio" id="star2" name="rate" value="2" />
                        <label for="star2"></label>
                        <input type="radio" id="star1" name="rate" value="1" />
                        <label for="star1"></label>
                    </div>
                </td>
                <td>
                    <asp:Button runat="server" class="butonYorum" Text="Gönder" OnClick="Send_Click" />
                </td>

            </tr>
        </table>

        <br />
        <br />
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
                                                <asp:HyperLink Style="transform: translate(85px,12px)" class="LikeButtons" ID="trash" runat="server" Visible='<%#Eval("KullaniciID").ToString().Equals(Session["userID"].ToString()) ? true:false %>' NavigateUrl='<%#Eval("YorumID","~/Yorum.aspx?DeleteComment={0}") %>'><i class="fa fa-trash"></i></asp:HyperLink>
                                            </td>
                                            <td>
                                                <asp:HyperLink Style="transform: translate(85px,12px)" class="LikeButtons" ID="update" runat="server" Visible='<%#Eval("KullaniciID").ToString().Equals(Session["userID"].ToString()) ? true:false %>' NavigateUrl='<%#Eval("YorumID","~/Yorum.aspx?UpdateComment={0}") %>'><i class="fa fa-cog"></i></asp:HyperLink>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="NameBox">
                                        <asp:Label runat="server" class="label1" Text='<%#Eval("KullaniciAd")%>' Style="color:indianred;"/>
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
                                                <asp:Label Text='<%#Eval("YorumTarih") %>' runat="server" class="label1" Style="transform: translateX(-670px);color:indianred;" />
                                            </td>
                                            <td>
                                                <asp:HyperLink Text='<%#Eval("Begen")%>' runat="server" class="label1" NavigateUrl='<%#Eval("YorumID","~/Yorum.aspx?YorumLK={0}") %>' Style="text-decoration: none;color:indianred;" />
                                            </td>
                                            <td>
                                                <asp:HyperLink class="LikeButtons" ID="likeButton" runat="server" NavigateUrl='<%#Eval("YorumID","~/Yorum.aspx?YorumIDL={0}") %>'><i class="fa fa-thumbs-up"></i></asp:HyperLink>
                                            </td>
                                            <td>
                                                <asp:HyperLink class="LikeButtons" ID="dislikeButton" runat="server" NavigateUrl='<%#Eval("YorumID","~/Yorum.aspx?YorumIDD={0}") %>'><i class="fa fa-thumbs-down"></i></asp:HyperLink>
                                            </td>
                                            <td>
                                                <asp:HyperLink Text='<%#Eval("Dislike")%>' runat="server" class="label1" NavigateUrl='<%#Eval("YorumID","~/Yorum.aspx?YorumDK={0}") %>' Style="text-decoration: none;color:indianred;" />
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
            <RowStyle BorderColor="Olive" ForeColor="SandyBrown" Height="100px" />
        </asp:GridView>
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
                <asp:BoundField DataField="KullaniciAd" />
            </Columns>
            <RowStyle BorderColor="Olive" ForeColor="SandyBrown" Height="20px" />

        </asp:GridView>
    </div>

    <div runat="server" id="updater" visible="false">
        <table>
            <tr>
                <td>
                    <asp:Label ID="updateName" CssClass="userC" runat="server" Style="transform: translate(-50px,-20px)" />
                </td>
                <td>
                    <asp:TextBox ID="updateText" CssClass="mainComment" TextMode="MultiLine" runat="server" MaxLength="350" Width="400px" Height="150px" Style="transform: translateX(-215px)" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button runat="server" class="butonYorum" Text="Guncelle" OnClick="Update_Click" />
                </td>

            </tr>
        </table>
    </div>
</asp:Content>


