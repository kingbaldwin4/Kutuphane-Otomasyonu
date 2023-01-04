using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kutuphane
{
    public partial class Uye : System.Web.UI.MasterPage
    {
        SQLSorgu sqlSorgu = new SQLSorgu();
        VeriIslem veriIslem = new VeriIslem();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
        protected void UAnasayfa(object sender, EventArgs e)
        {
            Session["kitapTur"] = null;
            Response.Redirect("UAnasayfa.aspx");
        }
        protected void KitapKirala(object sender, EventArgs e)
        {
            Session["kitapTur"] = null;
            Session["yorumKitapID"] = null;
            Session["kitapID"] = null;
            Response.Redirect("KiralamaforM.aspx");
        }
        protected void Cikis(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
        protected void ListKitap(object sender, EventArgs e)
        {
            Session["kitapTur"] = null;
            Session["kitapID"] = null;
            Session["yorumKitapID"] = null;
            string[] words = kitap.Text.Split(' ');

            if (string.IsNullOrEmpty(kitap.Text))
            {
                kitap.Text = "Bulunamadı..";
            }
            else if ((veriIslem.dataTable(sqlSorgu.KitapSorguAd(words))).Rows.Count > 1)
            {
                Session["arananKitaplar"] = kitap.Text;
                Response.Redirect("KitapInfo.aspx");
            }
            else if ((veriIslem.dataTable(sqlSorgu.KitapSorguAd(words))).Rows.Count == 1)
            {
                int ID = Convert.ToInt32(veriIslem.dataTable(sqlSorgu.KitapSorguAd(words)).Rows[0][0].ToString());
                Session["kitapID"] = ID;
                Response.Redirect("KitapInfo.aspx");
            }
            if ((veriIslem.dataTable(sqlSorgu.KitapSorguYazar(words))).Rows.Count > 1)
            {
                Session["arananKitaplar"] = kitap.Text;
                Response.Redirect("KitapInfo.aspx");
            }
            else if ((veriIslem.dataTable(sqlSorgu.KitapSorguYazar(words))).Rows.Count == 1)
            {
                int ID = Convert.ToInt32(veriIslem.dataTable(sqlSorgu.KitapSorguYazar(words)).Rows[0][0].ToString());
                Session["kitapID"] = ID;
                Response.Redirect("KitapInfo.aspx");
            }
            else
            {
                kitap.Text = "Bulunamadı..";
            }
        }
    }
}
