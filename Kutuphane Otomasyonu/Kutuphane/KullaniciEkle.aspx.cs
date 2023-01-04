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
    public partial class KullaniciEkle : System.Web.UI.Page
    {
        SQLSorgu sqlSorgu = new SQLSorgu();
        VeriIslem veriIslem = new VeriIslem();
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            if (txtAd.Text.Equals("") || txtAdres.Text.Equals("") || txtNo.Text.Equals("") || txtParola.Text.Equals("") || txtSoyad.Text.Equals("") || txtuserName.Text.Equals(""))
            {
                lblAciklamaBos.Visible = true;
                lblAciklamaOlan.Visible = false;
                lblAciklamaSayi.Visible = false;
                lblAciklamaParola.Visible = false;

            }
            else if ((!System.Text.RegularExpressions.Regex.IsMatch(txtNo.Text, "[0-9]")) || txtNo.Text.Length != 11)
            {
                lblAciklamaSayi.Visible = true;
                lblAciklamaBos.Visible = false;
                lblAciklamaOlan.Visible = false;
                lblAciklamaParola.Visible = false;

            }
            else if (!GoodPassword(txtParola.Text))
            {
                lblAciklamaBos.Visible = false;
                lblAciklamaOlan.Visible = false;
                lblAciklamaSayi.Visible = false;
                lblAciklamaParola.Visible = true;

            }
            else
            {
                if (veriIslem.dataTable(sqlSorgu.getAyniKullaniciAdi(txtuserName.Text)).Rows.Count != 0)
                {
                    lblAciklamaOlan.Visible = true;
                    lblAciklamaBos.Visible = false;
                    lblAciklamaSayi.Visible = false;
                    lblAciklamaParola.Visible = false;

                }
                else
                {
                    lblAciklamaBos.Visible = false;
                    lblAciklamaOlan.Visible = false;
                    lblAciklamaSayi.Visible = false;
                    lblAciklamaParola.Visible = false;


                    veriIslem.dataTable(sqlSorgu.UyeEkle(txtuserName.Text, txtParola.Text, txtAd.Text, txtSoyad.Text, txtNo.Text, txtAdres.Text));
                    add.Visible = false;
                    confirm.Visible = true;
                    confirm2.Visible = true;
                    Session["duzenlenenKullanici"] = Convert.ToInt32(veriIslem.dataTable(sqlSorgu.getID(txtuserName.Text, txtParola.Text)).Rows[0][0].ToString());
                }
            }
        }
        protected void btnYenidenKaydet_Click(object sender, EventArgs e)
        {
            Response.Redirect("KullaniciEkle.aspx");
        }
        protected void btnDuzenle_Click(object sender, EventArgs e)
        {
            Response.Redirect("KullaniciDuzenle.aspx");
        }
        protected bool GoodPassword(string password)
        {
            var hasNumber = new Regex(@"[0-9]+");  //Şifre en az 1 rakam içersin
            var hasUpperChar = new Regex(@"[A-Z]+"); //En az 1 büyük harf içersin
            var hasMinimum5Chars = new Regex(@".{8,15}"); //Şifrenin uzunluğu 8-15 aralığında
            var hasLowerChar = new Regex(@"[a-z]+");
            var hasSymbols = new Regex(@"[!@#$%^&*()_+=\[{\]};:<>|./?,-]");
            char[] ch = { 'ö', 'ç', 'ğ', 'ü', 'ş', ' ', '<', '*' };
            for (int i = 0; i < ch.Length; i++)
            {
                if (password.Contains(ch[i]))
                {
                    return false;

                }
            }
            var isValidated = hasNumber.IsMatch(password) && hasUpperChar.IsMatch(password) && hasMinimum5Chars.IsMatch(password)&&hasLowerChar.IsMatch(password)&&(!hasSymbols.IsMatch(password));
            return isValidated;
        }

    }
}