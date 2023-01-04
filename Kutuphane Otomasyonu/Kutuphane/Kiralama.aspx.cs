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
    public partial class Kiralama : System.Web.UI.Page
    {
        SQLSorgu sqlSorgu = new SQLSorgu();
        VeriIslem veriIslem = new VeriIslem();
        protected void Page_Load(object sender, EventArgs e)
        {
            string kitapIDL = Request.QueryString["kitapIDL"];
            string kitapIDfromYorum = Request.QueryString["kitapIDYorum"];

            if (!IsPostBack) //kitap sayfasını açar
            {
                if (!string.IsNullOrEmpty(kitapIDfromYorum))
                {
                    Session["kitapID"] = kitapIDfromYorum;
                }
                if (Session["kitapID"] != null)
                {
                    search.Visible = false;
                    add.Visible = true;
                    int kitap = Convert.ToInt32(Session["kitapID"]);

                    int puan = Convert.ToInt32(veriIslem.dataTable(sqlSorgu.getPuan(kitap)).Rows[0][0].ToString());
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
                    voters.Text = veriIslem.dataTable(sqlSorgu.getPuanlayan(kitap)).Rows[0][0].ToString() + "  kişi puanladı.";
                    DataTable dt = veriIslem.dataTable(sqlSorgu.KitapSorguID(kitap));
                    txtKitapAd.Text = dt.Rows[0][1].ToString();
                    txtYazar.Text = dt.Rows[0][2].ToString();
                    txtYayinci.Text = dt.Rows[0][3].ToString();
                    txtSayfa.Text = dt.Rows[0][4].ToString();
                    imgKitap.ImageUrl = dt.Rows[0][7].ToString();
                    txtTur.Text = dt.Rows[0][8].ToString();
                    txtTarih.Text = dt.Rows[0][9].ToString();
                    txtAktif.Text = AktifMi(dt.Rows[0][10].ToString());
                    txtAdet.Text = dt.Rows[0][10].ToString();

                }
                else if (!string.IsNullOrEmpty(kitapIDL))
                {
                    Session["kitapID"] = kitapIDL;
                    if (veriIslem.dataTable(sqlSorgu.AktifKitap(Convert.ToInt32(kitapIDL))).Rows.Count > 0) //aranan kitap birden çoksa liste içerisinde gösterilir.
                    {
                        fillInfo();
                    }
                    else
                    {
                        Session["kitapIDiade"] = Convert.ToInt32(kitapIDL);
                        DataTable dtiade = veriIslem.dataTable(sqlSorgu.kitapKiralayanlar(Convert.ToInt32(kitapIDL)));
                        kira.Visible = false;
                        add.Visible = false;
                        liste.Visible = false;
                        search.Visible = false;
                        iade.Visible = false;
                        iadeInfo.Visible = true;
                        for (int i = 0; i < dtiade.Rows.Count; i++)
                        {
                            kullaniciIDiade.Items.Add(dtiade.Rows[i][0].ToString());
                        }
                    }
                }
                else
                {

                }
            }
        }
        protected void Changed(object sender, EventArgs e)
        {
            DropDownList comboBox = (DropDownList)sender;
            try
            {
                int kullaniciID = Convert.ToInt32(comboBox.Text.ToString());
                DataTable dt = veriIslem.dataTable(sqlSorgu.Bilgilendirme(kullaniciID));
                fullNameIade.Text = dt.Rows[0][0].ToString() + " " + dt.Rows[0][1].ToString();
                usernameIade.Text = dt.Rows[0][4].ToString();
            }
            catch(Exception)
            {
                fullNameIade.Text ="";
                usernameIade.Text = "";
            }
                
        }
        protected void iadeOnay_Click(object sender, EventArgs e)
        {
            int kullaniciID = Convert.ToInt32(kullaniciIDiade.Text.ToString());
            int kitapIDiade = Convert.ToInt32(Session["kitapIDiade"].ToString());
            int kitapSayisi = Convert.ToInt32(veriIslem.dataTable(sqlSorgu.getKitapSayisi(kitapIDiade)).Rows[0][0].ToString()) + 1;
            DataTable dtKira = veriIslem.dataTable(sqlSorgu.KitapIadeInfo(kitapIDiade, kullaniciID));
            veriIslem.dataTable(sqlSorgu.KitapSayiGuncelle(kitapSayisi, kitapIDiade));
            veriIslem.dataTable(sqlSorgu.KitapIadeKira(kitapIDiade, kullaniciID));
            kira.Visible = false;
            add.Visible = false;
            liste.Visible = false;
            search.Visible = false;
            iade.Visible = true;
            iadeInfo.Visible = false;
            lblIade.Text = veriIslem.dataTable(sqlSorgu.Bilgilendirme(kullaniciID)).Rows[0][0].ToString() + " " + veriIslem.dataTable(sqlSorgu.Bilgilendirme(kullaniciID)).Rows[0][1].ToString() + " adlı kullanıcı "
                + veriIslem.dataTable(sqlSorgu.KitapSorguID(kitapIDiade)).Rows[0][1].ToString() + " kitabını iade etmiştir.";

        }
        protected void Yorum_Click(object sender, EventArgs e)
        {

            int ID = Convert.ToInt32(Session["kitapID"]);
            Session["yorumKitapID"] = ID;
            Response.Redirect("YetkiliYorumlar.aspx");

        }


        protected void btnKira_Click(object sender, EventArgs e)
        {
            Button button = sender as Button;
            if (button.ID.Equals("btnKira") && Convert.ToInt32(veriIslem.dataTable(sqlSorgu.getKitapSayisi(Convert.ToInt32(Session["kitapID"].ToString()))).Rows[0][0].ToString()) > 0)
            {
                fillInfo();
            }
            else if (button.ID.Equals("btnKira") && Convert.ToInt32(veriIslem.dataTable(sqlSorgu.getKitapSayisi(Convert.ToInt32(Session["kitapID"].ToString()))).Rows[0][0].ToString()) == 0)
            {
                alert.Text = "Kitap bulunmamaktadır.";
                alert.Visible = true;
            }
            else if (button.ID.Equals("btnIade") && veriIslem.dataTable(sqlSorgu.kitapKiralayanlar(Convert.ToInt32(Session["kitapID"].ToString()))).Rows.Count > 0)
            {
                int kitapIDiade = Convert.ToInt32(Session["kitapID"].ToString());
                Session["kitapIDiade"] = kitapIDiade;
                DataTable dtiade = veriIslem.dataTable(sqlSorgu.kitapKiralayanlar(kitapIDiade));
                kira.Visible = false;
                add.Visible = false;
                liste.Visible = false;
                search.Visible = false;
                iade.Visible = false;
                iadeInfo.Visible = true;
                for (int i = 0; i < dtiade.Rows.Count; i++)
                {
                    kullaniciIDiade.Items.Add(dtiade.Rows[i][0].ToString());
                }

            }
            else if (button.ID.Equals("btnIade") && veriIslem.dataTable(sqlSorgu.kitapKiralayanlar(Convert.ToInt32(Session["kitapID"].ToString()))).Rows.Count == 0)
            {
                alert.Text = "Bu kitap kimse tarafından alınmamıştır.";
                alert.Visible = true;
            }

        }
        protected void btnOnay_Click(object sender, EventArgs e)
        {
            if (veriIslem.dataTable(sqlSorgu.BilgilendirmeUsername(lblKullaniciAdi.Text)).Rows.Count > 0)
            {
                int userID = Convert.ToInt32(veriIslem.dataTable(sqlSorgu.BilgilendirmeUsername(lblKullaniciAdi.Text)).Rows[0][5].ToString());
                if (veriIslem.dataTable(sqlSorgu.KitapIadeInfo(Convert.ToInt32(Session["kitapID"].ToString()), userID)).Rows.Count == 0)
                {
                    string format = "dd.MM.yyyy";
                    if (lblBaslangicTarih.SelectedDate.ToString(format) != "01.01.0001" && lblBitisTarih.SelectedDate.ToString(format) != "01.01.0001" && lblBaslangicTarih.SelectedDate < lblBitisTarih.SelectedDate)
                    {
                        DataTable dtKira = veriIslem.dataTable(sqlSorgu.KiraOlustur(userID, Convert.ToInt32(Session["kitapID"].ToString()), lblBaslangicTarih.SelectedDate.ToString(format), lblBitisTarih.SelectedDate.ToString(format)));
                        int kitapSayi = Convert.ToInt32(veriIslem.dataTable(sqlSorgu.getKitapSayisi(Convert.ToInt32(Session["kitapID"].ToString()))).Rows[0][0].ToString());
                        kitapSayi--;
                        veriIslem.dataTable(sqlSorgu.KitapSayiGuncelle(kitapSayi, Convert.ToInt32(Session["kitapID"].ToString())));
                        confirmRent.Visible = true;
                        kira.Visible = false;

                    }
                    else
                    {
                        errorMessage.Visible = true;
                    }
                }
                else
                {
                    errorKullanici.Visible = true;
                }
            }
            else
            {
                errorMessageK.Visible = true;
            }

        }

        protected void fillInfo()
        {
            kira.Visible = true;
            add.Visible = false;
            liste.Visible = false;
            search.Visible = false;
            DataTable dtKitap = veriIslem.dataTable(sqlSorgu.KitapSorguID(Convert.ToInt32(Session["kitapID"].ToString())));
            imageKitap.ImageUrl = dtKitap.Rows[0][7].ToString();
            lblkitapAd.Text = dtKitap.Rows[0][1].ToString();
            lblYazar.Text = dtKitap.Rows[0][2].ToString();

        }
        protected void Search_Click(object sender, EventArgs e)
        {
            string[] words = txtsearch.Text.Split(' ');
            if (string.IsNullOrEmpty(txtsearch.Text))
            {
            }
            else if ((veriIslem.dataTable(sqlSorgu.KitapSorguAd(words))).Rows.Count == 1)
            {

                int ID = Convert.ToInt32(veriIslem.dataTable(sqlSorgu.KitapSorguAd(words)).Rows[0][13].ToString());
                Session["kitapID"] = ID;
                OnlyOne(ID);

            }
            else if ((veriIslem.dataTable(sqlSorgu.KitapSorguAd(words))).Rows.Count > 1)
            {
                DataTable dtL = veriIslem.dataTable(sqlSorgu.KitapSorguAd(words));
                gridList.DataSource = dtL;
                MoreThanOne();
            }
            else if ((veriIslem.dataTable(sqlSorgu.KitapSorguYazar(words))).Rows.Count == 1)
            {

                int ID = Convert.ToInt32(veriIslem.dataTable(sqlSorgu.KitapSorguYazar(words)).Rows[0][0].ToString());
                Session["kitapID"] = ID;
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
        protected void OnlyOne(int ID)
        {
            search.Visible = false;
            add.Visible = true;
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

        }
        protected void MoreThanOne()
        {
            gridList.Width = 400;
            gridList.DataBind();
            liste.Visible = true;
            search.Visible = false;
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
