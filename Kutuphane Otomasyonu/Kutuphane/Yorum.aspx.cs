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
    public partial class Yorum : System.Web.UI.Page
    {

        SQLSorgu sqlSorgu = new SQLSorgu();
        VeriIslem veriIslem = new VeriIslem();
        protected void Page_Load(object sender, EventArgs e)
        {
            string deleteComment = Request.QueryString["DeleteComment"];
            string updateComment = Request.QueryString["UpdateComment"];
            string yorumdirekt = Request.QueryString["theYorum"];
            string YorumIDL = Request.QueryString["YorumIDL"]; //like için
            string YorumIDD = Request.QueryString["YorumIDD"]; //dislike için
            string YorumLK = Request.QueryString["YorumLK"]; //likelayanlar
            string YorumDK = Request.QueryString["YorumDK"]; //dislikers
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(deleteComment))
                {
                    string yorumKitap = Session["yorumKitapID"].ToString();
                    if (veriIslem.dataTable(sqlSorgu.getPuanliYorum(Convert.ToInt32(yorumKitap), Convert.ToInt32(Session["userID"].ToString()))).Rows.Count > 0)
                    {
                        double puan = Convert.ToDouble(veriIslem.dataTable(sqlSorgu.getPuan(Convert.ToInt32(yorumKitap))).Rows[0][0].ToString());
                        int puanlayan = Convert.ToInt32(veriIslem.dataTable(sqlSorgu.getPuanlayan(Convert.ToInt32(yorumKitap))).Rows[0][0].ToString());
                        int current = veriIslem.dataTable(sqlSorgu.getPuanliYorum(Convert.ToInt32(yorumKitap), Convert.ToInt32(Session["userID"].ToString()))).Rows.Count - 1;
                        int eskiPuan = Convert.ToInt32(veriIslem.dataTable(sqlSorgu.getPuanliYorum(Convert.ToInt32(yorumKitap), Convert.ToInt32(Session["userID"].ToString()))).Rows[current][8]);
                        double toplamPuan = puan * puanlayan - eskiPuan;
                        puan = Math.Round(toplamPuan / (puanlayan - 1));
                        veriIslem.dataTable(sqlSorgu.PuanInfo(Convert.ToInt32(yorumKitap), puan, (puanlayan - 1)));
                    }
                    veriIslem.dataTable(sqlSorgu.deleteYorumbyID(Convert.ToInt32(deleteComment)));
                }


                if (!string.IsNullOrEmpty(yorumdirekt))
                {
                    Session["yorumKitapID"] = yorumdirekt;
                }
                else
                {

                }
                if (!string.IsNullOrEmpty(updateComment))
                {
                    yorum.Visible = false;
                    updateName.Text = veriIslem.dataTable(sqlSorgu.getKullaniciAdi(Convert.ToInt32(Session["userID"].ToString()))).Rows[0][0].ToString();
                    updateText.Text = veriIslem.dataTable(sqlSorgu.getYorumbyID(Convert.ToInt32(updateComment))).Rows[0][0].ToString();
                    updater.Visible = true;
                    Session["updateComment"] = updateComment;

                }
                else if (!string.IsNullOrEmpty(YorumIDL))
                {
                    int yorumIDL = Convert.ToInt32(YorumIDL);
                    Like_Click(yorumIDL);
                }
                else if (!string.IsNullOrEmpty(YorumIDD))
                {
                    int yorumIDD = Convert.ToInt32(YorumIDD);
                    Dislike_Click(yorumIDD);
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
                    if (Session["alert"] != null)
                        alert2.Visible = true;
                    Curuser.Text = veriIslem.dataTable(sqlSorgu.getKullaniciAdi(Convert.ToInt32(Session["userID"].ToString()))).Rows[0][0].ToString();
                    DataTable dtYorumlar = veriIslem.dataTable(sqlSorgu.getDoluYorums(Convert.ToInt32(Session["yorumKitapID"].ToString())));
                    gridComment.DataSource = dtYorumlar;
                    gridComment.DataBind();
                    gridComment.Visible = true;
                    Session["alert"] = null;
                }
                else if (!string.IsNullOrEmpty(YorumDK))
                {
                    DataTable likers = veriIslem.dataTable(sqlSorgu.getLikers(0, Convert.ToInt32(YorumDK)));
                    if (likers.Rows.Count > 0)
                    {
                        gridLikers.DataSource = likers;
                        gridLikers.DataBind();
                        whoLiked.Visible = true;
                        YorumDK = null;
                    }
                    if (Session["alert"] != null)
                        alert2.Visible = true;
                    Curuser.Text = veriIslem.dataTable(sqlSorgu.getKullaniciAdi(Convert.ToInt32(Session["userID"].ToString()))).Rows[0][0].ToString();
                    DataTable dtYorumlar = veriIslem.dataTable(sqlSorgu.getDoluYorums(Convert.ToInt32(Session["yorumKitapID"].ToString())));
                    gridComment.DataSource = dtYorumlar;
                    gridComment.DataBind();
                    gridComment.Visible = true;
                    Session["alert"] = null;
                }

                else if (Session["yorumKitapID"] != null)
                {
                    if (Session["alert"] != null)
                        alert2.Visible = true;
                    Curuser.Text = veriIslem.dataTable(sqlSorgu.getKullaniciAdi(Convert.ToInt32(Session["userID"].ToString()))).Rows[0][0].ToString();
                    DataTable dtYorumlar = veriIslem.dataTable(sqlSorgu.getDoluYorums(Convert.ToInt32(Session["yorumKitapID"].ToString())));
                    gridComment.DataSource = dtYorumlar;
                    gridComment.DataBind();
                    gridComment.Visible = true;
                    Session["alert"] = null;
                }
            }
        }
        protected void Update_Click(object sender, EventArgs e)
        {
            string yorum = updateText.Text;
            veriIslem.dataTable(sqlSorgu.updateYorumbyID(yorum.Replace("\'", "\'\'"), Convert.ToInt32(Session["updateComment"].ToString())));
            Response.Redirect("Yorum.aspx");
        }
        protected void Like_Click(int yorumID)
        {

            int userID = Convert.ToInt32(Session["userID"].ToString());
            if (veriIslem.dataTable(sqlSorgu.LDSorgu(userID, yorumID)).Rows.Count == 0)
            {
                int begeniSayisi = Convert.ToInt32(veriIslem.dataTable(sqlSorgu.getBegen(yorumID)).Rows[0][0].ToString()) + 1;
                veriIslem.dataTable(sqlSorgu.Begen(begeniSayisi, yorumID));
                veriIslem.dataTable(sqlSorgu.LikeDislike(1, Convert.ToInt32(Session["userID"].ToString()), yorumID));
            }
            else if (veriIslem.dataTable(sqlSorgu.LDSorgu(userID, yorumID)).Rows[0][0].ToString().ToUpper().Equals("FALSE"))
            {
                int begeniSayisi = Convert.ToInt32(veriIslem.dataTable(sqlSorgu.getBegen(yorumID)).Rows[0][0].ToString()) + 1;
                veriIslem.dataTable(sqlSorgu.Begen(begeniSayisi, yorumID));
                veriIslem.dataTable(sqlSorgu.UpdateLD(1, Convert.ToInt32(Session["userID"].ToString()), yorumID));
                int dislikeSayisi = Convert.ToInt32(veriIslem.dataTable(sqlSorgu.getDislike(yorumID)).Rows[0][0].ToString()) - 1;
                veriIslem.dataTable(sqlSorgu.Dislike(dislikeSayisi, yorumID));
            }
            else if (veriIslem.dataTable(sqlSorgu.LDSorgu(userID, yorumID)).Rows[0][0].ToString().ToUpper().Equals("TRUE"))
            {
                int begeniSayisi = Convert.ToInt32(veriIslem.dataTable(sqlSorgu.getBegen(yorumID)).Rows[0][0].ToString()) - 1;
                veriIslem.dataTable(sqlSorgu.Begen(begeniSayisi, yorumID));
                veriIslem.dataTable(sqlSorgu.DelLD(userID, yorumID));
            }

            Response.Redirect("Yorum.aspx");


        }
        protected void Dislike_Click(int yorumID)
        {

            int userID = Convert.ToInt32(Session["userID"].ToString());
            if (veriIslem.dataTable(sqlSorgu.LDSorgu(userID, yorumID)).Rows.Count == 0)
            {
                int dislikeSayisi = Convert.ToInt32(veriIslem.dataTable(sqlSorgu.getDislike(yorumID)).Rows[0][0].ToString()) + 1;
                veriIslem.dataTable(sqlSorgu.Dislike(dislikeSayisi, yorumID));
                veriIslem.dataTable(sqlSorgu.LikeDislike(0, Convert.ToInt32(Session["userID"].ToString()), yorumID));
            }
            else if (veriIslem.dataTable(sqlSorgu.LDSorgu(userID, yorumID)).Rows[0][0].ToString().ToUpper().Equals("TRUE"))
            {
                int dislikeSayisi = Convert.ToInt32(veriIslem.dataTable(sqlSorgu.getDislike(yorumID)).Rows[0][0].ToString()) + 1;
                veriIslem.dataTable(sqlSorgu.Dislike(dislikeSayisi, yorumID));
                veriIslem.dataTable(sqlSorgu.UpdateLD(0, Convert.ToInt32(Session["userID"].ToString()), yorumID));
                int begeniSayisi = Convert.ToInt32(veriIslem.dataTable(sqlSorgu.getBegen(yorumID)).Rows[0][0].ToString()) - 1;
                veriIslem.dataTable(sqlSorgu.Begen(begeniSayisi, yorumID));
            }
            else if (veriIslem.dataTable(sqlSorgu.LDSorgu(userID, yorumID)).Rows[0][0].ToString().ToUpper().Equals("FALSE"))
            {
                int dislikeSayisi = Convert.ToInt32(veriIslem.dataTable(sqlSorgu.getDislike(yorumID)).Rows[0][0].ToString()) - 1;
                veriIslem.dataTable(sqlSorgu.Dislike(dislikeSayisi, yorumID));
                veriIslem.dataTable(sqlSorgu.DelLD(userID, yorumID));
            }
            Response.Redirect("Yorum.aspx");


        }
        protected void Send_Click(object sender, EventArgs e)
        {
            if (txtYorum.Text.Length > 350)
            {
                alert.Visible = true;
            }
            else
            {
                string rate = Request.Form["rate"];
                string yorumKitap = Session["yorumKitapID"].ToString();
                string yorum = txtYorum.Text;
                if (rate == null)
                {
                    double puan = Convert.ToDouble(veriIslem.dataTable(sqlSorgu.getPuan(Convert.ToInt32(yorumKitap))).Rows[0][0].ToString());
                    int puanlayan = Convert.ToInt32(veriIslem.dataTable(sqlSorgu.getPuanlayan(Convert.ToInt32(yorumKitap))).Rows[0][0].ToString());
                    veriIslem.dataTable(sqlSorgu.yorumEkle(yorum.Replace("\'", "\'\'"), Convert.ToInt32(Session["userID"].ToString()), Convert.ToInt32(yorumKitap), 0, 0));//puansız yorum 
                    veriIslem.dataTable(sqlSorgu.PuanInfo(Convert.ToInt32(yorumKitap), puan, puanlayan));
                }
                else if (veriIslem.dataTable(sqlSorgu.getPuanliYorum(Convert.ToInt32(yorumKitap), Convert.ToInt32(Session["userID"].ToString()))).Rows.Count > 0)
                {
                    Session["alert"] = rate;
                    double puan = Convert.ToDouble(veriIslem.dataTable(sqlSorgu.getPuan(Convert.ToInt32(yorumKitap))).Rows[0][0].ToString());
                    int puanlayan = Convert.ToInt32(veriIslem.dataTable(sqlSorgu.getPuanlayan(Convert.ToInt32(yorumKitap))).Rows[0][0].ToString());
                    int current = veriIslem.dataTable(sqlSorgu.getPuanliYorum(Convert.ToInt32(yorumKitap), Convert.ToInt32(Session["userID"].ToString()))).Rows.Count - 1;
                    int eskiPuan = Convert.ToInt32(veriIslem.dataTable(sqlSorgu.getPuanliYorum(Convert.ToInt32(yorumKitap), Convert.ToInt32(Session["userID"].ToString()))).Rows[current][8]);
                    double toplamPuan = puan * puanlayan - eskiPuan;
                    toplamPuan += Convert.ToInt32(rate.ToString());
                    puan = Math.Round(toplamPuan / puanlayan);
                    veriIslem.dataTable(sqlSorgu.yorumEkle(yorum.Replace("\'", "\'\'"), Convert.ToInt32(Session["userID"].ToString()), Convert.ToInt32(yorumKitap), 1, Convert.ToInt32(rate.ToString())));
                    veriIslem.dataTable(sqlSorgu.PuanInfo(Convert.ToInt32(yorumKitap), puan, puanlayan));

                }
                else
                {
                    double puan = Convert.ToDouble(veriIslem.dataTable(sqlSorgu.getPuan(Convert.ToInt32(yorumKitap))).Rows[0][0].ToString());
                    int puanlayan = Convert.ToInt32(veriIslem.dataTable(sqlSorgu.getPuanlayan(Convert.ToInt32(yorumKitap))).Rows[0][0].ToString());
                    double toplamPuan = puan * puanlayan;
                    toplamPuan += Convert.ToInt32(rate.ToString());
                    puanlayan++;
                    puan = Math.Round(toplamPuan / puanlayan);
                    veriIslem.dataTable(sqlSorgu.PuanInfo(Convert.ToInt32(yorumKitap), puan, puanlayan));
                    veriIslem.dataTable(sqlSorgu.yorumEkle(yorum.Replace("\'", "\'\'"), Convert.ToInt32(Session["userID"].ToString()), Convert.ToInt32(yorumKitap), 1, Convert.ToInt32(rate.ToString())));
                }

                txtYorum.Text = "";
                Response.Redirect("Yorum.aspx");
            }
        }
    }
}