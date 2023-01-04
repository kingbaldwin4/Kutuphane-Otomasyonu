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
    public partial class UAnasayfa : System.Web.UI.Page
    {
        string alert = "";
        string alert2 = "";
        SQLSorgu sqlSorgu = new SQLSorgu();
        VeriIslem veriIslem = new VeriIslem();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["kitapID"] = null;
            Session["yorumKitapID"] = null;

            DataTable dtTarih = veriIslem.dataTable(sqlSorgu.KiralamaforK(Convert.ToInt32(Session["userID"].ToString())));
            if (dtTarih.Rows.Count > 0)
            {
                for (int i = 0; i < dtTarih.Rows.Count; i++)
                {
                    string format = "dd.MM.yyyy";
                    DateTime teslim = Convert.ToDateTime(dtTarih.Rows[i][5].ToString());
                    DateTime current = DateTime.Now;
                    if (current < teslim)
                    {
                        alert2 += dtTarih.Rows[i][7].ToString() + " adlı kitabın son teslim tarihi " + teslim.ToString(format) + " . Lütfen unutmayınız.   \r\n\r\n";
                    }
                    else
                    {
                        string formatDay = "dd";
                        alert += dtTarih.Rows[i][7].ToString() + " adlı kitabın son teslim tarihi " + Convert.ToInt32((current - teslim).ToString(formatDay)) + " gün gecikmiştir. Lütfen en kısa zamanda kitabı teslim ediniz.";
                    }
                }
            }

            string kitapID = Request.QueryString["kitapID"];
            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(kitapID))
                {
                    Session["kitapID"] = kitapID;
                    Response.Redirect("KitapInfo.aspx");
                }
                if (dtTarih.Rows.Count > 0)
                {
                    alertWelcome.Visible = true;
                    txtCountDown.Text = alert;
                    txtCountDown2.Text = alert2;
                }
            }
            DataTable dt = veriIslem.dataTable(sqlSorgu.KitapListele());
            if (Session["kitapTur"] != null)
            {
                dt = veriIslem.dataTable(sqlSorgu.listAsType(Session["kitapTur"].ToString()));
            }
            gridKitaplar.DataSource = dt;
            gridKitaplar.Width = 800;
            gridKitaplar.DataBind();

        }
        protected void Yazar_Click(object sender, EventArgs e)
        {
            LinkButton button = sender as LinkButton;
            if (button != null)
            {

                string words = button.Text;
                Session["istenen"] = words;
                Response.Redirect("KitapInfo.aspx");
            }
        }
        protected void Yayinci_Click(object sender, EventArgs e)
        {
            LinkButton button = sender as LinkButton;
            if (button != null)
            {
                string words = button.Text;
                Session["istenen"] = words;
                Response.Redirect("KitapInfo.aspx");
            }
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
                alertWelcome.Visible = false;
                Response.Redirect("UAnasayfa.aspx");
            }

        }
    }
}
