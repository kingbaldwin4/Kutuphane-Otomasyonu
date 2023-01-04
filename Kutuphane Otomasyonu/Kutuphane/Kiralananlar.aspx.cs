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
    public partial class Kiralananlar : System.Web.UI.Page
    {
        SQLSorgu sqlSorgu = new SQLSorgu();
        VeriIslem veriIslem = new VeriIslem();
        protected void Page_Load(object sender, EventArgs e)
        {
            string kitapID = Request.QueryString["kitapID"];
            string kullaniciID = Request.QueryString["kullaniciID"];
            string kitapID2= Request.QueryString["kitapID2"];
            string kullaniciID2= Request.QueryString["kullaniciID2"];
            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(kitapID))
                {
                    Session["kitapID"] = kitapID;
                    Response.Redirect("Kiralama.aspx");
                }
                else if (!String.IsNullOrEmpty(kullaniciID))
                {
                    Session["duzenlenenKullanici"] = kullaniciID;
                    Response.Redirect("KullaniciDuzenle.aspx");
                }
                else if (!String.IsNullOrEmpty(kitapID2)&&!string.IsNullOrEmpty(kullaniciID2))
                {
                    int IDK = Convert.ToInt32(kullaniciID2);
                    int ID = Convert.ToInt32(kitapID2);
                    int kitapSayisi = Convert.ToInt32(veriIslem.dataTable(sqlSorgu.getKitapSayisi(ID)).Rows[0][0].ToString()) + 1;
                    DataTable dtKira = veriIslem.dataTable(sqlSorgu.KitapIadeInfo(ID,IDK));
                    veriIslem.dataTable(sqlSorgu.KitapSayiGuncelle(kitapSayisi,ID));
                    veriIslem.dataTable(sqlSorgu.KitapIadeKira(ID,IDK));
                    liste.Visible = false;
                    mainPage.Visible = false;
                    iade.Visible = true;
                    lblIade.Text = veriIslem.dataTable(sqlSorgu.Bilgilendirme(IDK)).Rows[0][0].ToString() + " " + veriIslem.dataTable(sqlSorgu.Bilgilendirme(IDK)).Rows[0][1].ToString() + " adlı kullanıcı "
                        + veriIslem.dataTable(sqlSorgu.KitapSorguID(ID)).Rows[0][1].ToString() + " kitabını iade etmiştir.";
                }
                
            }

            DataTable dt = veriIslem.dataTable(sqlSorgu.Kiralama());
            gridKitaplar.DataSource = dt;
            gridKitaplar.Width = 800;
            gridKitaplar.DataBind();
        }
        protected void Yazar_Click(object sender, EventArgs e)
        {
            LinkButton button = sender as LinkButton;
            if (button != null)
            {
                string[] words = button.Text.Split(' ');
                mainPage.Visible = false;
                DataTable dtL = veriIslem.dataTable(sqlSorgu.KitapSorguYazar(words));
                gridList.DataSource = dtL;
                gridList.Width = 400;
                gridList.DataBind();
                liste.Visible = true;
            }
        }
       
    }
}