using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kutuphane
{
    public partial class KitapDuzenle : System.Web.UI.Page
    {
        SQLSorgu sqlSorgu = new SQLSorgu();
        VeriIslem veriIslem = new VeriIslem();
        protected void Page_Load(object sender, EventArgs e)
        {

            string kitapID = Request.QueryString["bookID"];
            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(kitapID))
                {
                    Session["duzenlenenKitap"] = kitapID;
                    duzenPage();

                }
                else if (Session["duzenlenenKitap"] == null)
                {
                    DataTable dt = veriIslem.dataTable(sqlSorgu.KitapListele());
                    if (Session["kitapTur"] != null)
                    {
                        dt = veriIslem.dataTable(sqlSorgu.listAsType(Session["kitapTur"].ToString()));
                    }
                    gridKitaplar.DataSource = dt;
                    gridKitaplar.Width = 800;
                    gridKitaplar.DataBind();
                }

                else
                {
                    duzenPage();
                }
            }
        }
        protected void duzenPage()
        {
            divTur.Visible = false;
            list.Visible = false;
            search.Visible = false;
            delButon.Visible = false;
            add.Visible = true;
            int kitap = Convert.ToInt32(Session["duzenlenenKitap"].ToString());

            if (veriIslem.dataTable(sqlSorgu.KitapSorguID(kitap)).Rows.Count > 0)
            {
                DataTable dt = veriIslem.dataTable(sqlSorgu.KitapSorguID(kitap));
                txtKitapAd.Text = dt.Rows[0][1].ToString();
                txtYazar.Text = dt.Rows[0][2].ToString();
                txtYayinci.Text = dt.Rows[0][3].ToString();
                txtSayfa.Text = dt.Rows[0][4].ToString();
                imgKitap.ImageUrl = dt.Rows[0][7].ToString();
                txtTur.Text = dt.Rows[0][8].ToString();
                txtTarih.Text = dt.Rows[0][9].ToString();
                txtAdet.Text = dt.Rows[0][10].ToString();



            }
        }
        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            veriIslem.dataTable(sqlSorgu.KitapGuncelle(txtKitapAd.Text.Replace("\'", "\'\'"), txtYazar.Text, txtYayinci.Text, Convert.ToInt32(txtSayfa.Text), imgKitap.ImageUrl, txtTur.Text, txtTarih.Text,Convert.ToInt32(txtAdet.Text), Convert.ToInt32(Session["duzenlenenKitap"].ToString())));
            add.Visible = false;
            confirm.Visible = true;
            Session["duzenlenenKitap"] = null;
        }
        protected void btnSil_Click(object sender, EventArgs e)
        {
            if (veriIslem.dataTable(sqlSorgu.kitapKiralayanlar(Convert.ToInt32(Session["duzenlenenKitap"].ToString()))).Rows.Count > 0)
            {
                alertDel.Visible = true;
            }
            else
            {
                veriIslem.dataTable(sqlSorgu.KitapGercektenSil(Convert.ToInt32(Session["duzenlenenKitap"].ToString())));
                add.Visible = false;
                confirmDel.Visible = true;
                Session["duzenlenenKitap"] = null;
            }


        }
        protected void MultipleDel_Click(object sender, EventArgs e)
        {
            DataTable dt = veriIslem.dataTable(sqlSorgu.KitapListele());
            foreach (GridViewRow row in gridKitaplar.Rows)
            {
                CheckBox cb = (CheckBox)row.FindControl("forDelete");
                if (cb != null && cb.Checked)
                {
                    int rowInfo = Convert.ToInt32(row.RowIndex);
                    // int deleteID = Convert.ToInt32(gridKitaplar.DataKeys[row.RowIndex].Value);
                    int deleteID = Convert.ToInt32(dt.Rows[rowInfo][0].ToString());
                    if (veriIslem.dataTable(sqlSorgu.kitapKiralayanlar(deleteID)).Rows.Count == 0)
                    {
                        veriIslem.dataTable(sqlSorgu.KitapGercektenSil(deleteID));
                    }
                    else
                    {
                        multiple.Visible = true;
                    }
                }
            }
            Response.Redirect("KitapDuzenle.aspx");
        }
        protected void Search_Click(object sender, EventArgs e)
        {
            string[] words = txtsearch.Text.Split(' ');
            if (string.IsNullOrEmpty(txtsearch.Text))
            {
            }
            else if ((veriIslem.dataTable(sqlSorgu.KitapSorguAd(words))).Rows.Count == 1)
            {

                int ID = Convert.ToInt32(veriIslem.dataTable(sqlSorgu.KitapSorguAd(words)).Rows[0][0].ToString());
                Session["duzenlenenKitap"] = ID;
                OnlyOne(ID);

            }
            else if ((veriIslem.dataTable(sqlSorgu.KitapSorguAd(words))).Rows.Count > 1)
            {
                DataTable dtL = veriIslem.dataTable(sqlSorgu.KitapSorguAd(words));
                gridList.DataSource = dtL;
                MoreThanOne();
            }
            if ((veriIslem.dataTable(sqlSorgu.KitapSorguYazar(words))).Rows.Count == 1)
            {

                int ID = Convert.ToInt32(veriIslem.dataTable(sqlSorgu.KitapSorguYazar(words)).Rows[0][0].ToString());
                Session["duzenlenenKitap"] = ID;
                OnlyOne(ID);

            }
            else if ((veriIslem.dataTable(sqlSorgu.KitapSorguYazar(words))).Rows.Count > 1)
            {
                DataTable dtL = veriIslem.dataTable(sqlSorgu.KitapSorguYazar(words));
                gridList.DataSource = dtL;
                MoreThanOne();
            }
            else
            {
                lblBulunamadi.Visible = true;
            }

        }
        protected void OnlyOne(int ID) //Aranan kitap tekse
        {
            divTur.Visible = false;
            list.Visible = false;
            search.Visible = false;
            delButon.Visible = false;

            add.Visible = true;
            DataTable dt1 = veriIslem.dataTable(sqlSorgu.KitapSorguID(ID));
            txtKitapAd.Text = dt1.Rows[0][1].ToString();
            txtYazar.Text = dt1.Rows[0][2].ToString();
            txtYayinci.Text = dt1.Rows[0][3].ToString();
            txtSayfa.Text = dt1.Rows[0][4].ToString();
            imgKitap.ImageUrl = dt1.Rows[0][7].ToString();
            txtTur.Text = dt1.Rows[0][8].ToString();
            txtTarih.Text = dt1.Rows[0][9].ToString();
            txtAdet.Text = dt1.Rows[0][10].ToString();
        }
        protected void MoreThanOne() //birden çoksa listeleme
        {
            divTur.Visible = false;
            list.Visible = false;
            gridList.Width = 400;
            gridList.DataBind();
            liste.Visible = true;
            search.Visible = false;
            delButon.Visible = false;

        }
      
        protected void Tur_Click(object sender, EventArgs e)
        {
            Button buton = sender as Button;
            if (buton != null)
            {
                DataTable dt = new DataTable();
                switch (buton.ID)
                {
                    case "roman":
                        Session["kitapTur"] = "Roman";
                        break;
                    case "siir":
                        Session["kitapTur"] = "Şiir";
                        break;
                    case "bilim":
                        Session["kitapTur"] = "Bilim";
                        break;
                    case "cocukKitabi":
                        Session["kitapTur"] = "Çocuk Kitabı";
                        break;
                    case "cizgiRoman":
                        Session["kitapTur"] = "Çizgi Roman";
                        break;
                    case "tarih":
                        Session["kitapTur"] = "Tarih";
                        break;
                    case "felsefe":
                        Session["kitapTur"] = "Felsefe";
                        break;

                }
                Response.Redirect("KitapDuzenle.aspx");
            }
        }
        protected void upload_Click(object sender, EventArgs e)
        {
            imgKitap.ImageUrl = "";
            if (fuYukle.FileName.Trim() == "")
            {
                labelImg.Text = "Fotoğraf Seçilmedi";
                return;
            }
            else if (fuYukle.FileName.Trim() != "")
            {
                if (fuYukle.FileName.Split('.')[1].ToUpper() != "PNG")
                    if (fuYukle.FileName.Split('.')[1].ToUpper() != "JPG")
                    {
                        labelImg.Text = "Seçilen nesne istenen Formatta değil!";
                        return;
                    }
            }

            string foto;
            if (imgKitap.ImageUrl != "")
            {
                // "~/ Foto / ";
                foto = imgKitap.ImageUrl;

            }
            else
            {
                var uid = Regex.Replace(Convert.ToBase64String(Guid.NewGuid().ToByteArray()), "[/+=]", "");
                foto = uid + ".jpg";
            }
            fuYukle.SaveAs(Server.MapPath(@"ImgKitap\") + foto);
            imgKitap.ImageUrl = "~/ImgKitap/" + foto;

        }
        protected void Yazar_Click(object sender, EventArgs e)
        {
            LinkButton button = sender as LinkButton;
            if (button != null)
            {

                string words = button.Text;
                list.Visible = false;
                search.Visible = false;
                delButon.Visible = false;
                DataTable dtL = veriIslem.dataTable(sqlSorgu.KitapDirektSorguYazar(words));
                gridList.DataSource = dtL;
                gridList.Width = 400;
                gridList.DataBind();
                liste.Visible = true;
                divTur.Visible = false;

            }
        }
        protected void Yayinci_Click(object sender, EventArgs e)
        {
            LinkButton button = sender as LinkButton;
            if (button != null)
            {
                string words = button.Text;
                list.Visible = false;
                search.Visible = false;
                delButon.Visible = false;
                DataTable dtL = veriIslem.dataTable(sqlSorgu.KitapDirektSorguYayinci(words));
                gridList.DataSource = dtL;
                gridList.Width = 400;
                gridList.DataBind();
                liste.Visible = true;
                divTur.Visible = false;
            }
        }
       
    }

}