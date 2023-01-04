using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kutuphane
{
    public partial class Yetkili : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
        protected void Anasayfa(object sender, EventArgs e)
        {
            Session["kitapTur"] = null;
            Response.Redirect("Anasayfa.aspx");
        }
        protected void MyFunction(object sender, EventArgs e)
        {
            Session["kitapTur"] = null;
            Session["kitapID"] = null;
            Session["yorumKitapID"] = null;
            Session["duzenlenenKullanici"] = null;
            Response.Redirect("KullaniciDuzenle.aspx");
        }
        protected void KitapGuncelle(object sender, EventArgs e)
        {
            Session["kitapTur"] = null;
            Session["duzenlenenKitap"] = null;
            Session["kitapID"] = null;
            Session["yorumKitapID"] = null;
            Session["duzenlenenKitapID"] = null;
            Response.Redirect("KitapDuzenle.aspx");
        }
        protected void KitapKirala(object sender, EventArgs e)
        {
            Session["kitapTur"] = null;
            Session["yorumKitapID"] = null;
            Session["kitapID"] = null;
            Response.Redirect("Kiralama.aspx");
        }
        protected void Cikis(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

    }
}