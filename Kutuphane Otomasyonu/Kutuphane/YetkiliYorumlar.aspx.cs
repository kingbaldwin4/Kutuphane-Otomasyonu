using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kutuphane
{
    public partial class YetkiliYorumlar : System.Web.UI.Page
    {

        SQLSorgu sqlSorgu = new SQLSorgu();
        VeriIslem veriIslem = new VeriIslem();
        protected void Page_Load(object sender, EventArgs e)
        {
            string deleteComment = Request.QueryString["DeleteComment"];
            string selectedUser = Request.QueryString["selectedUser"];
            string selected = Request.QueryString["yorumKitapID"];
            string YorumLK = Request.QueryString["YorumLK"]; //likelayanlar
            string YorumDK = Request.QueryString["YorumDK"]; //dislikers
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(deleteComment))
                {
                    veriIslem.dataTable(sqlSorgu.deleteYorumfromYetkili(Convert.ToInt32(deleteComment)));  //bu sayede sadece yorum silindi kişinin verdiği puan değişmedi(yeniden puanlama yaparsa eski puan güncellenecek)
                }

                if (!string.IsNullOrEmpty(selected))
                {
                    Session["yorumKitapID"] = selected;
                }
                if (selectedUser != null)
                {
                    int selectedUserID = Convert.ToInt32(selectedUser);
                    UserPage(selectedUserID);
                }
                if (!string.IsNullOrEmpty(YorumLK))
                {
                    DataTable likers = veriIslem.dataTable(sqlSorgu.getLikers(1, Convert.ToInt32(YorumLK)));
                    if (likers.Rows.Count > 0)
                    {
                        gridLikers.DataSource = likers;
                        gridLikers.DataBind();
                        whoLiked.Visible = true;

                    }
                    DataTable dtYorumlar = veriIslem.dataTable(sqlSorgu.getDoluYorums(Convert.ToInt32(Session["yorumKitapID"].ToString())));
                    if (dtYorumlar.Rows.Count > 0)
                    {
                        gridComment.DataSource = dtYorumlar;
                        gridComment.DataBind();
                        gridComment.Visible = true;
                        Session["alert"] = null;
                        YorumLK = null;

                    }
                    else
                    {
                        empty.Visible = true;
                    }
                }
                else if (!string.IsNullOrEmpty(YorumDK))
                {
                    DataTable likers = veriIslem.dataTable(sqlSorgu.getLikers(0, Convert.ToInt32(YorumDK)));
                    if (likers.Rows.Count > 0)
                    {
                        gridLikers.DataSource = likers;
                        gridLikers.DataBind();
                        whoLiked.Visible = true;
                    }
                    DataTable dtYorumlar = veriIslem.dataTable(sqlSorgu.getDoluYorums(Convert.ToInt32(Session["yorumKitapID"].ToString())));
                    if (dtYorumlar.Rows.Count > 0)
                    {
                        gridComment.DataSource = dtYorumlar;
                        gridComment.DataBind();
                        gridComment.Visible = true;
                        Session["alert"] = null;
                        YorumDK = null;


                    }
                    else
                    {
                        empty.Visible = true;
                    }

                }
                else if (Session["yorumKitapID"] != null)
                {
                    DataTable dtYorumlar = veriIslem.dataTable(sqlSorgu.getDoluYorums(Convert.ToInt32(Session["yorumKitapID"].ToString())));
                    if (dtYorumlar.Rows.Count > 0)
                    {
                        gridComment.DataSource = dtYorumlar;
                        gridComment.DataBind();
                        gridComment.Visible = true;
                        Session["alert"] = null;

                    }
                    else
                    {
                        empty.Visible = true;
                    }
                }
                else { }
            }
        }
        protected void UserPage(int selectedUserID)
        {
            Session["duzenlenenKullanici"] = selectedUserID;
            Response.Redirect("KullaniciDuzenle.aspx");
        }



    }
}