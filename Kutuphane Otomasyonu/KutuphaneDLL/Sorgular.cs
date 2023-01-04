using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KutuphaneDLL
{
    public class Sorgular
    {
        public static string Giris(string kAd, string parola)
        {
            string sorgu = "select KullaniciAd, Parola from tblKullanicilar where KullaniciAd='"+kAd+ "' and Parola='"+parola+"' and AktifPasif<>0 ";
            return sorgu;
        }
        public static string KitapKaydet(string kitapAd, string yazar,string tarih,string resim)
        {
            string sorgu = "insert into tblKitaplar ( Yazar, Tarih, KitapAd, Resim) values ('"+yazar+ "','" + tarih + "','" + kitapAd + "','" + resim + "')";
            return sorgu;
        }
    }
}
