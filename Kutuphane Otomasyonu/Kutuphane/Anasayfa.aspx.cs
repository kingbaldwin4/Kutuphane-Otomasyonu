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
    public partial class Anasayfa : System.Web.UI.Page
    {

        SQLSorgu sqlSorgu = new SQLSorgu();
        VeriIslem veriIslem = new VeriIslem();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            string kitapID = Request.QueryString["kitapID"];
            if (!IsPostBack)
            {
               
                if (!String.IsNullOrEmpty(kitapID))    //Anasayfada bir kitap seçilmişse kitaba ait bilgilerin bulunduğu Kiralama sayfasına yönlendirilir.
                {
                    Session["kitapID"] = kitapID;
                    Response.Redirect("Kiralama.aspx");
                }

            }
            divTur.Visible = true;
            DataTable dt = veriIslem.dataTable(sqlSorgu.KitapListele()); //Anasayfada kitaplar listelenir
            if (Session["kitapTur"] != null)
            {
                dt = veriIslem.dataTable(sqlSorgu.listAsType(Session["kitapTur"].ToString()));  //Herhangi bir tür seçilmişse o türe ait kitaplar listelenir
            }
            gridKitaplar.DataSource = dt;
            gridKitaplar.Width = 800;
            gridKitaplar.DataBind();
        }

        protected void Yazar_Click(object sender, EventArgs e) //Yazara tıklandığında yazara ait kitaplar listelenir
        {
            divTur.Visible = false;
            LinkButton button = sender as LinkButton;
            if (button != null)
            {

                string words = button.Text;
                mainPage.Visible = false;
                DataTable dtL = veriIslem.dataTable(sqlSorgu.KitapDirektSorguYazar(words));
                gridList.DataSource = dtL;
                gridList.Width = 400;
                gridList.DataBind();
                liste.Visible = true;
            }
        }
        protected void Yayinci_Click(object sender, EventArgs e) //Yayıncıya tıklandığında o yayıncıya ait kitaplar listelenir
        {
            divTur.Visible = false;
            LinkButton button = sender as LinkButton;
            if (button != null)
            {
                string words = button.Text;
                mainPage.Visible = false;
                DataTable dtL = veriIslem.dataTable(sqlSorgu.KitapDirektSorguYayinci(words));
                gridList.DataSource = dtL;
                gridList.Width = 400;
                gridList.DataBind();
                liste.Visible = true;
            }
        }
        protected void Tur_Click(object sender, EventArgs e)  //Tür seçimi buradan yapılır. Seçilen tür session'da tutularak page load kısmındaki sorguda kullanılır.
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
                Response.Redirect("Anasayfa.aspx");
            }
        }
    }
}