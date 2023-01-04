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
    public partial class BilgiGuncelle : System.Web.UI.Page
    {
        SQLSorgu sqlSorgu = new SQLSorgu();
        VeriIslem veriIslem = new VeriIslem();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userID"] != null) //Güncellenecek olan kişinin bilgileri textbox'a aktarılır. İstenilen veri daha sonra değiştirilir
                {
                    DataTable dt = veriIslem.dataTable(sqlSorgu.Bilgilendirme(Convert.ToInt32(Session["userID"].ToString())));
                    txtAd.Text = dt.Rows[0][0].ToString();
                    txtSoyad.Text = dt.Rows[0][1].ToString();
                    txtNo.Text = dt.Rows[0][2].ToString();
                    txtAdres.Text = dt.Rows[0][3].ToString();


                }

            }

        }
        protected void btnKaydet_Click(object sender, EventArgs e) //kaydet diyince güncellenir.
        {
            veriIslem.dataTable(sqlSorgu.UyeGuncelle(txtAd.Text, txtSoyad.Text, txtNo.Text, txtAdres.Text, Convert.ToInt32(Session["userID"].ToString())));
            add.Visible = false;
            confirm.Visible = true;

        }
        protected void btnPassword_Click(object sender, EventArgs e)//Şifre güncelleme sayfasını açar.
        {
            add.Visible = false;
            passwordArea.Visible = true;
        }
        protected void btnGuncelle_Click(object sender, EventArgs e) //Kontrollü şifre güncelleme
        {
            sonuc.Visible = false;
            if (!oldPassword.Text.Equals(veriIslem.dataTable(sqlSorgu.getPassword(Convert.ToInt32(Session["userID"].ToString()))).Rows[0][0].ToString()))
            {
                sonuc.Text = "Eski şifrenizi yanlış girdiniz";
                sonuc.Visible = true;
            }
            else if (newPassword.Text == oldPassword.Text)
            {
                sonuc.Text = "Yeni şifreniz, eskisiyle aynı olamaz.";
                sonuc.Visible = true;
            }
            else if (newPassword.Text != confirmPassword.Text)
            {
                sonuc.Text = "Yeni şifre ile doğrulama şifresi aynı olmalıdır.";
                sonuc.Visible = true;
            }
            else if (!GoodPassword(newPassword.Text))
            {
                sonuc.Text = "Güçlü bir şifre belirleyiniz.";
                sonuc.Visible = true;
            }
            else
            {
                veriIslem.dataTable(sqlSorgu.parolaGuncelle(Convert.ToInt32(Session["userID"].ToString()), newPassword.Text));
                add.Visible = true;
                passwordArea.Visible = false;
                success.Visible = true;

            }
        }
        protected bool GoodPassword(string password)
        {
            var hasNumber = new Regex(@"[0-9]+");  //Şifre en az 1 rakam içersin
            var hasUpperChar = new Regex(@"[A-Z]+"); //En az 1 büyük harf içersin
            var hasMinimum5Chars = new Regex(@".{8,15}"); //Şifrenin uzunluğu 8-15 aralığında
            var hasLowerChar = new Regex(@"[a-z]+"); //En az 1 küçük harf içermeli
            var hasSymbols = new Regex(@"[!@#$%^&*()_+=\[{\]};:<>|./?,-]"); //Özel karakter içeriyor mu kontrol edilir. Aşağıda içermemesi istendi.
            char[] ch = { 'ö', 'ç', 'ğ', 'ü', 'ş', ' ', '<', '*' };
            for (int i = 0; i < ch.Length; i++)
            {
                if (password.Contains(ch[i]))
                {
                    return false;

                }
            }
            var isValidated = hasNumber.IsMatch(password) && hasUpperChar.IsMatch(password) && hasMinimum5Chars.IsMatch(password) && hasLowerChar.IsMatch(password) && (!hasSymbols.IsMatch(password));
            return isValidated;
        }
    }
}