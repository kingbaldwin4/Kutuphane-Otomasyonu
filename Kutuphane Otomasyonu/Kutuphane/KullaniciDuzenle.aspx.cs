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
    public partial class KullaniciDuzenle : System.Web.UI.Page
    {
        SQLSorgu sqlSorgu = new SQLSorgu();
        VeriIslem veriIslem = new VeriIslem();
        protected void Page_Load(object sender, EventArgs e)
        {
            string kullaniciID = Request.QueryString["kullaniciID"];
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(kullaniciID))
                {
                    search.Visible = false;
                    add.Visible = true;
                    list.Visible = false;
                    delButon.Visible = false;
                    DataTable dt = veriIslem.dataTable(sqlSorgu.Bilgilendirme(Convert.ToInt32(kullaniciID)));
                    txtAd.Text = dt.Rows[0][0].ToString();
                    txtSoyad.Text = dt.Rows[0][1].ToString();
                    txtNo.Text = dt.Rows[0][2].ToString();
                    txtAdres.Text = dt.Rows[0][3].ToString();
                }
                else if (Session["duzenlenenKullanici"] == null)
                {
                    DataTable dt = veriIslem.dataTable(sqlSorgu.kullaniciListe());
                    gridKullanici.DataSource = dt;
                    gridKullanici.Width = 800;
                    gridKullanici.DataBind();
                }
                else
                {
                    list.Visible = false;
                    delButon.Visible = false;
                    search.Visible = false;
                    add.Visible = true;
                    string ID = null;
                    ID = Session["duzenlenenKullanici"].ToString();
                    if (ID != null)
                    {
                        DataTable dt = veriIslem.dataTable(sqlSorgu.Bilgilendirme(Convert.ToInt32(ID)));
                        txtAd.Text = dt.Rows[0][0].ToString();
                        txtSoyad.Text = dt.Rows[0][1].ToString();
                        txtNo.Text = dt.Rows[0][2].ToString();
                        txtAdres.Text = dt.Rows[0][3].ToString();


                    }
                }
            }


        }
        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            veriIslem.dataTable(sqlSorgu.UyeGuncelle(txtAd.Text, txtSoyad.Text, txtNo.Text, txtAdres.Text, Convert.ToInt32(Session["duzenlenenKullanici"].ToString())));
            add.Visible = false;
            confirm.Visible = true;
            Session["duzenlenenKullanici"] = null;
        }
        protected void btnYorum_Click(object sender, EventArgs e)
        {
            Response.Redirect("YapilanYorumlarY.aspx");
        }

        protected void btnKira_Click(object sender, EventArgs e)
        {
            if (veriIslem.dataTable(sqlSorgu.KiralamaforK(Convert.ToInt32(Session["duzenlenenKullanici"].ToString()))).Rows.Count > 0)
            {
                DataTable dt = veriIslem.dataTable(sqlSorgu.KiralamaforK(Convert.ToInt32(Session["duzenlenenKullanici"].ToString())));
                add.Visible = false;
                gridKitaplar.DataSource = dt;
                gridKitaplar.Width = 800;
                gridKitaplar.DataBind();
                kira.Visible = true;

            }
            else
            {
                kiraYok.Visible = true;
                add.Visible = false;
            }

        }
        protected void btnSil_Click(object sender, EventArgs e)
        {
            if (veriIslem.dataTable(sqlSorgu.kullaniciKitap(Convert.ToInt32(Session["duzenlenenKullanici"].ToString()))).Rows.Count == 0)
            {
                veriIslem.dataTable(sqlSorgu.KullaniciSil(Convert.ToInt32(Session["duzenlenenKullanici"].ToString())));
                add.Visible = false;
                confirmDel.Visible = true;
                Session["duzenlenenKullanici"] = null;
            }
            else
            {
                lblAciklama.Text = "Kitabı iade etmeden kullanıcıyı silemezsiniz.";
            }

        }

        protected void MultipleDel_Click(object sender, EventArgs e)
        {
            DataTable dt = veriIslem.dataTable(sqlSorgu.kullaniciListe());
            foreach (GridViewRow row in gridKullanici.Rows)
            {
                CheckBox cb = (CheckBox)row.FindControl("forDelete");
                if (cb != null && cb.Checked)
                {
                    int rowInfo = Convert.ToInt32(row.RowIndex);
                    int deleteID = Convert.ToInt32(dt.Rows[rowInfo][0].ToString());
                    if (veriIslem.dataTable(sqlSorgu.KiralamaforK(deleteID)).Rows.Count == 0)
                    {
                        veriIslem.dataTable(sqlSorgu.KullaniciSil(deleteID));
                    }
                    else
                    {
                    }
                }
            }
            Response.Redirect("KullaniciDuzenle.aspx");
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            if (txtsearchID.Text == "")
            {
            }

            else
            {

                Session["duzenlenenKullanici"] = txtsearchID.Text;
                if (veriIslem.dataTable(sqlSorgu.BilgilendirmeUsername(Session["duzenlenenKullanici"].ToString())).Rows.Count > 0)
                {
                    int ID = Convert.ToInt32(veriIslem.dataTable(sqlSorgu.BilgilendirmeUsername(Session["duzenlenenKullanici"].ToString())).Rows[0][5].ToString());
                    DataTable dt = veriIslem.dataTable(sqlSorgu.Bilgilendirme(ID));
                    txtAd.Text = dt.Rows[0][0].ToString();
                    txtSoyad.Text = dt.Rows[0][1].ToString();
                    txtNo.Text = dt.Rows[0][2].ToString();
                    txtAdres.Text = dt.Rows[0][3].ToString();
                    search.Visible = false;
                    add.Visible = true;
                    list.Visible = false;
                    delButon.Visible = false;
                    Session["duzenlenenKullanici"] = ID;
                }
                else if (int.TryParse(Session["duzenlenenKullanici"].ToString(), out int result) && veriIslem.dataTable(sqlSorgu.Bilgilendirme(Convert.ToInt32(Session["duzenlenenKullanici"].ToString()))).Rows.Count > 0)
                {
                    int ID = Convert.ToInt32(Session["duzenlenenKullanici"].ToString());
                    DataTable dt = veriIslem.dataTable(sqlSorgu.Bilgilendirme(ID));
                    txtAd.Text = dt.Rows[0][0].ToString();
                    txtSoyad.Text = dt.Rows[0][1].ToString();
                    txtNo.Text = dt.Rows[0][2].ToString();
                    txtAdres.Text = dt.Rows[0][3].ToString();
                    search.Visible = false;
                    add.Visible = true;
                    list.Visible = false;
                    delButon.Visible = false;
                }
                else
                {
                    string[] words = Session["duzenlenenKullanici"].ToString().Split(' ');
                    if (veriIslem.dataTable(sqlSorgu.BilgilendirmeAdSoyad(words)).Rows.Count > 0)
                    {
                        DataTable dt = veriIslem.dataTable(sqlSorgu.BilgilendirmeAdSoyad(words));
                        gridKullanici.DataSource = dt;
                        gridKullanici.Width = 800;
                        gridKullanici.DataBind();
                        search.Visible = false;
                    }
                    else
                    {
                        lblBulunamadi.Visible = true;
                    }
                }

            }

        }
        protected void Yazar_Click(object sender, EventArgs e)
        {
            LinkButton button = sender as LinkButton;
            if (button != null)
            {
                string[] words = button.Text.Split(' ');
                kira.Visible = false;
                DataTable dtL = veriIslem.dataTable(sqlSorgu.KitapSorguYazar(words));
                gridList.DataSource = dtL;
                gridList.Width = 400;
                gridList.DataBind();
                liste.Visible = true;
            }
        }
    }
}