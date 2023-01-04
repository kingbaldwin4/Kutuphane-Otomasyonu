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
    public partial class KitapInfo : System.Web.UI.Page
    {
        SQLSorgu sqlSorgu = new SQLSorgu();
        VeriIslem veriIslem = new VeriIslem();
        protected void Page_Load(object sender, EventArgs e)
        {
            string IDKitap = Request.QueryString["bookID"];
            if (!IsPostBack)
            {

                if (!String.IsNullOrEmpty(IDKitap))
                {
                    Session["yorumKitapID"] = IDKitap;
                    OnlyOne(Convert.ToInt32(IDKitap));
                }
                else if (Session["kitapID"] == null)
                {
                    if (Session["arananKitaplar"] == null)
                    {
                        if (Session["istenen"] == null)
                        {

                        }
                        else
                        {
                            string word = Session["istenen"].ToString();
                            if (veriIslem.dataTable(sqlSorgu.KitapDirektSorguYazar(word)).Rows.Count >= 1)
                            {
                                DataTable dtL = veriIslem.dataTable(sqlSorgu.KitapDirektSorguYazar(word));
                                gridList.DataSource = dtL;
                                MoreThanOne();
                            }
                            else if (veriIslem.dataTable(sqlSorgu.KitapDirektSorguYayinci(word)).Rows.Count >= 1)
                            {
                                DataTable dtL = veriIslem.dataTable(sqlSorgu.KitapDirektSorguYayinci(word));
                                gridList.DataSource = dtL;
                                MoreThanOne();
                            }
                        }
                    }
                    else
                    {
                        string[] words = Session["arananKitaplar"].ToString().Split(' ');
                        if ((veriIslem.dataTable(sqlSorgu.KitapSorguAd(words))).Rows.Count >= 1)
                        {
                            DataTable dtL = veriIslem.dataTable(sqlSorgu.KitapSorguAd(words));
                            gridList.DataSource = dtL;
                            MoreThanOne();
                        }
                        else if ((veriIslem.dataTable(sqlSorgu.KitapSorguYazar(words))).Rows.Count >= 1)
                        {
                            DataTable dtL = veriIslem.dataTable(sqlSorgu.KitapSorguYazar(words));
                            gridList.DataSource = dtL;
                            MoreThanOne();
                        }
                    }
                }

                else if ((veriIslem.dataTable(sqlSorgu.KitapSorguID(Convert.ToInt32(Session["kitapID"].ToString())))).Rows.Count == 1)
                {
                    int ID = Convert.ToInt32(Session["kitapID"].ToString());
                    OnlyOne(ID);
                }
            }
        }


        protected void Yorum_Click(object sender, EventArgs e)
        {
            Response.Redirect("Yorum.aspx");
        }

        protected void OnlyOne(int ID)
        {
            liste.Visible = false;
            kitapInfo.Visible = true;
            DataTable dt1 = veriIslem.dataTable(sqlSorgu.KitapSorguID(ID));
            txtKitapAd.Text = dt1.Rows[0][1].ToString();
            txtYazar.Text = dt1.Rows[0][2].ToString();
            txtYayinci.Text = dt1.Rows[0][3].ToString();
            txtSayfa.Text = dt1.Rows[0][4].ToString();
            txtAktif.Text = AktifMi(dt1.Rows[0][10].ToString());
            imgKitap.ImageUrl = dt1.Rows[0][7].ToString();
            txtTur.Text = dt1.Rows[0][8].ToString();
            txtTarih.Text = dt1.Rows[0][9].ToString();
            txtAdet.Text = dt1.Rows[0][10].ToString();
            int puan = Convert.ToInt32(veriIslem.dataTable(sqlSorgu.getPuan(ID)).Rows[0][0].ToString());
            switch (puan)
            {
                case 1:
                    no1.Checked = true;
                    break;
                case 2:
                    no2.Checked = true;
                    break;
                case 3:
                    no3.Checked = true;
                    break;
                case 4:
                    no4.Checked = true;
                    break;
                case 5:
                    no5.Checked = true;
                    break;
            }
            voters.Text = veriIslem.dataTable(sqlSorgu.getPuanlayan(ID)).Rows[0][0].ToString() + "  kişi puanladı.";
            Session["yorumKitapID"] = ID;
        }
        protected void MoreThanOne()
        {
            kitapInfo.Visible = false;
            gridList.Width = 400;
            gridList.DataBind();
            liste.Visible = true;
        }
        protected string AktifMi(string a)
        {
            if (Convert.ToInt32(a) == 0)
            {
                return "Kitap Bulunmamaktadır. :( ";
            }
            else
            {
                return "Kitap Bulunmaktadır. :D ";
            }
        }
    }
}
