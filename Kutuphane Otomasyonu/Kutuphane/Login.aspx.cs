using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassLibrary;
namespace Kutuphane
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void btnGiris_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtKullaniciAd.Text != "" && txtParola.Text != "")
                {
                    VeriIslem veriIslem = new VeriIslem();
                    SQLSorgu sqlSorgu = new SQLSorgu();
                    if (veriIslem.dataTable(sqlSorgu.yetkiliGiris(txtKullaniciAd.Text, txtParola.Text)).Rows.Count != 0)

                    {
                        lblAciklama.Text = "Hoşgeldiniz Yetkili " + txtKullaniciAd.Text + " !";
                        //  Thread.Sleep(3000);
                        Session["userID"] = veriIslem.dataTable(sqlSorgu.getID(txtKullaniciAd.Text, txtParola.Text)).Rows[0][0].ToString();
                        Response.Redirect("Anasayfa.aspx");

                    }
                    else if (veriIslem.dataTable(sqlSorgu.uyeGiris(txtKullaniciAd.Text, txtParola.Text)).Rows.Count != 0)
                    {
                        lblAciklama.Text = "Hoşgeldiniz Uye " + txtKullaniciAd.Text + " !";
                        Session["userID"] = veriIslem.dataTable(sqlSorgu.getID(txtKullaniciAd.Text, txtParola.Text)).Rows[0][0].ToString();
                        Response.Redirect("UAnasayfa.aspx");

                    }
                    else
                    {
                        lblAciklama.Text = "Kullanıcı adı veya şifre hatalı.";

                    }
                }
                else
                {
                    lblAciklama.Text = "Kullanıcı adı veya şifre boş bırakılamaz.";
                }
            }
            catch (Exception ex)
            {

                lblHata.Text=ex.Message;
            }
            
        }
    }
}