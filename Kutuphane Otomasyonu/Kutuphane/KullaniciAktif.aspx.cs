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
    public partial class KullaniciAktif : System.Web.UI.Page
    {
        SQLSorgu sqlSorgu = new SQLSorgu();
        VeriIslem veriIslem = new VeriIslem();
        protected void Page_Load(object sender, EventArgs e)
        {
            string pasifID = Request.QueryString["kullaniciID"];
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(pasifID))
                {
                    Session["duzenlenenKullanici"] = pasifID;
                }
                DataTable dt = veriIslem.dataTable(sqlSorgu.kullaniciListePasif());
                gridKullanici.DataSource = dt;
                gridKullanici.Width = 800;
                gridKullanici.DataBind();

            }
        }
        protected void btnAktif_Click(object sender, EventArgs e)
        {
            veriIslem.dataTable(sqlSorgu.KullaniciAktiflestir(Convert.ToInt32(Session["duzenlenenKullanici"])));
            add.Visible = false;
            confirm.Visible = true;
            confirm2.Visible = true;
        }
        protected void btnKullaniciBilgi_Click(object sender, EventArgs e)
        {
            Response.Redirect("KullaniciDuzenle.aspx");
        }

        protected void MultipleDel_Click(object sender, EventArgs e)
        {
            DataTable dt = veriIslem.dataTable(sqlSorgu.kullaniciListePasif());
            foreach (GridViewRow row in gridKullanici.Rows)
            {
                CheckBox cb = (CheckBox)row.FindControl("forActivate");
                if (cb != null && cb.Checked)
                {
                    int rowInfo = Convert.ToInt32(row.RowIndex);
                    int deleteID = Convert.ToInt32(dt.Rows[rowInfo][0].ToString());
                    veriIslem.dataTable(sqlSorgu.KullaniciAktiflestir(deleteID));
                }
            }
            Response.Redirect("KullaniciAktif.aspx");
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            if (txtsearchID.Text == "")
            {
            }
            else
            {
                Session["duzenlenenKullanici"] = txtsearchID.Text;
                info();
            }

        }
        protected void info()
        {

            if(int.TryParse(Session["duzenlenenKullanici"].ToString(), out int result) && veriIslem.dataTable(sqlSorgu.BilgilendirmePasif(Convert.ToInt32(Session["duzenlenenKullanici"].ToString()))).Rows.Count>0)
            {
                DataTable dt = veriIslem.dataTable(sqlSorgu.BilgilendirmePasif(Convert.ToInt32(Session["duzenlenenKullanici"].ToString())));
                txtAd.Text = dt.Rows[0][0].ToString();
                txtSoyad.Text = dt.Rows[0][1].ToString();
                txtNo.Text = dt.Rows[0][2].ToString();
                txtAdres.Text = dt.Rows[0][3].ToString();
                search.Visible = false;
                add.Visible = true;
                list.Visible = false;
                delButon.Visible = false;
            }
            else if (veriIslem.dataTable(sqlSorgu.BilgilendirmeUsernamePasif(Session["duzenlenenKullanici"].ToString())).Rows.Count > 0)
            {
                DataTable dt = veriIslem.dataTable(sqlSorgu.BilgilendirmeUsernamePasif(Session["duzenlenenKullanici"].ToString()));
                txtAd.Text = dt.Rows[0][0].ToString();
                txtSoyad.Text = dt.Rows[0][1].ToString();
                txtNo.Text = dt.Rows[0][2].ToString();
                txtAdres.Text = dt.Rows[0][3].ToString();
                search.Visible = false;
                add.Visible = true;
                list.Visible = false;
                delButon.Visible = false;
                Session["duzenlenenKullanici"] = dt.Rows[0][5].ToString();
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
}