using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kutuphane
{
    public partial class KitapEkle : System.Web.UI.Page
    {
        SQLSorgu sqlSorgu = new SQLSorgu();
        VeriIslem veriIslem = new VeriIslem();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            if (txtKitapAd.Text == "" || txtSayfa.Text == "" || txtTarih.Text == "" || txtTur.Text == "" || txtYayinci.Text == "" || txtYazar.Text == "" )
            {
                lblKitapHata.Text = "Lüfen boş alan bırakmayınız.";
                lblKitapHata.Visible = true;
            }
            else if (!System.Text.RegularExpressions.Regex.IsMatch(txtSayfa.Text, "[0-9]"))
            {
                lblKitapHata.Text = "Lüfen sayfa sayısını doğru giriniz.";
                lblKitapHata.Visible = true;

            }
            else
            {
                veriIslem.dataTable(sqlSorgu.KitapEkle(txtKitapAd.Text.Replace("\'", "\'\'"), txtYazar.Text, txtYayinci.Text, Convert.ToInt32(txtSayfa.Text), imgKitap.ImageUrl, txtTur.Text, txtTarih.Text,Convert.ToInt32(txtAdet.Text)));
                Session["duzenlenenKitap"] = Convert.ToInt32(veriIslem.dataTable(sqlSorgu.getKitapID(txtKitapAd.Text.Replace("\'", "\'\'"), txtYazar.Text,txtYayinci.Text,Convert.ToInt32(txtSayfa.Text),imgKitap.ImageUrl,txtTur.Text,txtTarih.Text)).Rows[0][0].ToString());
                add.Visible = false;
                confirm.Visible = true;
                confirm2.Visible = true;
            }
        }
        protected void upload_Click(object sender, EventArgs e)
        {
            imgKitap.ImageUrl = "";
            if (fuYukle.FileName.Trim() == "")
            {
                labelImg.Text = "Fotoğraf Seçilmedi";
                return;
            }
            else if (fuYukle.FileName.Trim() != "")
            {
                if (fuYukle.FileName.Split('.')[1].ToUpper() != "PNG")
                    if (fuYukle.FileName.Split('.')[1].ToUpper() != "JPG")
                    {
                        labelImg.Text = "Seçilen nesne istenen Formatta değil!";
                        return;
                    }
            }

            string foto;
            if (imgKitap.ImageUrl != "")
            {
                // "~/ Foto / ";
                foto = imgKitap.ImageUrl;

            }
            else
            {
                var uid = Regex.Replace(Convert.ToBase64String(Guid.NewGuid().ToByteArray()), "[/+=]", "");
                foto = uid + ".jpg";
            }
            fuYukle.SaveAs(Server.MapPath(@"ImgKitap\") + foto);
            imgKitap.ImageUrl = "~/ImgKitap/" + foto;

        }
        protected void btnYenidenKaydet_Click(object sender, EventArgs e)
        {
            Response.Redirect("KitapEkle.aspx");
        }
        protected void btnDuzenle_Click(object sender, EventArgs e)
        {
            Response.Redirect("KitapDuzenle.aspx");
        }
    }
}