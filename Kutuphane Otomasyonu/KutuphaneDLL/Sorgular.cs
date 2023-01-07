using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary
{
    public class SQLSorgu
    {
        /* public string Giris(string kullaniciAd,string parola)
        {
            string sorgu = "SELECT KullaniciAd,Parola FROM tblKullanicilar WHERE AktifPasif<>0 AND KullaniciAd='" + kullaniciAd + "' AND parola='" +parola+ "'";

            return sorgu;
        } */
        public string yetkiliGiris(string kullaniciAd, string parola)
        {
            string sorgu = "SELECT KullaniciAd,Parola FROM tblKullanici WHERE AktifPasif<>0 AND KullaniciAd='" + kullaniciAd + "' AND Parola='" + parola + "' AND Yetki<>0";

            return sorgu;
        }
        public string getID(string kullaniciAd, string parola)
        {
            string sorgu = "SELECT ID FROM tblKullanici WHERE KullaniciAd='" + kullaniciAd + "' AND Parola='" + parola + "'";

            return sorgu;
        }
        public string uyeGiris(string kullaniciAd, string parola)
        {
            string sorgu = "SELECT KullaniciAd,Parola FROM tblKullanici WHERE AktifPasif<>0 AND KullaniciAd='" + kullaniciAd + "' AND Parola='" + parola + "' AND Yetki=0";

            return sorgu;
        }
        public string Bilgilendirme(int kullaniciID)
        {
            string sorgu = "SELECT Ad,Soyad,Telefon,Adres,KullaniciAd FROM tblKullanici WHERE ID='" + kullaniciID + "' AND AktifPasif<>0";
            return sorgu;
        }
        public string BilgilendirmeUsername(string username)
        {
            string sorgu = "SELECT Ad,Soyad,Telefon,Adres,KullaniciAd,ID FROM tblKullanici WHERE KullaniciAd='" + username + "' AND AktifPasif<>0";
            return sorgu;
        }
        public string BilgilendirmeAdSoyad(string[] words)
        {
            string sorgu = "SELECT * FROM tblKullanici WHERE ";
            for (int i = 0; i < words.Length; i++)
            {
                sorgu = sorgu + "Ad = '" + words[i] + "' OR Soyad='" + words[i] + "'";
                if (i + 1 < words.Length)
                {
                    sorgu += "OR ";
                }
            }
          
            sorgu=sorgu+ " AND AktifPasif<>0";
            return sorgu;
        }
        //public string BilgilendirmeAdSoyad(string ad)
        //{
        //    string sorgu = "SELECT Ad,Soyad,Telefon,Adres,KullaniciAd,ID FROM tblKullanici WHERE KullaniciAd='" + username + "' AND AktifPasif<>0";
        //    return sorgu;
        //}
        public string BilgilendirmePasif(int kullaniciID)
        {
            string sorgu = "SELECT Ad,Soyad,Telefon,Adres FROM tblKullanici WHERE ID='" + kullaniciID + "' AND AktifPasif=0";
            return sorgu;
        }
        public string BilgilendirmeUsernamePasif(string username)
        {
            string sorgu = "SELECT Ad,Soyad,Telefon,Adres,KullaniciAd,ID FROM tblKullanici WHERE KullaniciAd='" + username + "' AND AktifPasif=0";
            return sorgu;
        } public string BilgilendirmeAdSoyadPasif(string[] words)
        {
            string sorgu = "SELECT * FROM tblKullanici WHERE ";
            for (int i = 0; i < words.Length; i++)
            {
                sorgu = sorgu + "Ad = '" + words[i] + "' OR Soyad='" + words[i] + "'";
                if (i + 1 < words.Length)
                {
                    sorgu += "OR ";
                }
            }
          
            sorgu=sorgu+ " AND AktifPasif=0";
            return sorgu;
        }
        public string getPassword(int kullaniciID)
        {
            string sorgu = "SELECT Parola FROM tblKullanici WHERE ID='" + kullaniciID + "'";
            return sorgu;
        }
        public string parolaGuncelle(int kullaniciID, string parola)
        {
            string sorgu = "UPDATE tblKullanici SET Parola='" + parola + "' WHERE ID='" + kullaniciID + "'";
            return sorgu;
        }
        public string UyeEkle(string kullaniciAd, string parola, string ad, string soyad, string telefon, string adres)
        {
            string format = "dd.MM.yyyy";
            string date = DateTime.Now.ToString(format);
            string sorgu = "INSERT INTO tblKullanici (KullaniciAd,Parola,Yetki,AktifPasif,Tarih,Ad,Soyad,Telefon,Adres) VALUES ('" + kullaniciAd + "','" + parola + "',0,1,'" + date + "','" + ad + "','" + soyad + "','" + telefon + "','" + adres + "')";
            return sorgu;
        }
        public string UyeGuncelle(string ad, string soyad, string telefon, string adres, int ID)
        {
            string sorgu = "UPDATE tblKullanici SET Ad='" + ad + "',Soyad='" + soyad + "',Telefon='" + telefon + "',Adres='" + adres + "' WHERE ID='" + ID + "'";
            return sorgu;
        }
        public string getKullaniciAdi(int ID)
        {
            string sorgu = "SELECT KullaniciAd FROM tblKullanici WHERE ID='" + ID + "'";
            return sorgu;
        }
        public string getAyniKullaniciAdi(string kullaniciAd)
        {
            string sorgu = "SELECT KullaniciAd FROM tblKullanici WHERE KullaniciAd='" + kullaniciAd + "'";
            return sorgu;
        }
        /*public string KullaniciSil(int kullaniciID)
         {
             string sorgu = "DELETE FROM tblKullanici WHERE ID='" + kullaniciID + "'";
             return sorgu;
         }*/
        public string KullaniciSil(int kullaniciID)
        {
            string sorgu = "UPDATE tblKullanici SET AktifPasif=0 WHERE ID='" + kullaniciID + "'";
            return sorgu;
        }

        public string KullaniciAktiflestir(int kullaniciID)
        {
            string sorgu = "UPDATE tblKullanici SET AktifPasif=1 WHERE ID='" + kullaniciID + "'";
            return sorgu;
        }
        public string YetkiliMi(int kullaniciID)
        {
            string sorgu = "SELECT * FROM tblKullanici WHERE ID='" + kullaniciID + "' AND Yetki<>0";
            return sorgu;
        }
        public string KitapEkle(string ad, string yazar, string yayinci, int sayfaSayisi, string fotograf, string tur, string basimTarihi,int kitapSayisi)
        {
            string sorgu = "INSERT INTO tblKitaplar (KitapAd,Yazar,Yayinci,SayfaSayisi,Tarih,AktifPasif,Fotograf,Tur,BasimTarih,Puan,Puanlayan,KitapSayisi) VALUES ('" + ad + "','" + yazar + "','" + yayinci + "','" + sayfaSayisi + "','" + System.DateTime.Now.ToShortDateString() + "',1,'" + fotograf + "','" + tur + "','" + basimTarihi + "',0,0,'"+kitapSayisi+"')";
            return sorgu;
        }
        public string KitapSorguAd(string[] words)
        {
            string sorgu = "SELECT * FROM tblKitaplar WHERE ";
            for (int i = 0; i < words.Length; i++)
            {
                sorgu = sorgu + "KitapAd LIKE '%" + words[i] + "%'";
                if (i + 1 < words.Length)
                {
                    sorgu += "OR ";
                }
            }
            sorgu = sorgu + " AND AktifPasif<>0";
            return sorgu;
        }
        public string KitapSorguID(int ID)
        {
            string sorgu = "SELECT * FROM tblKitaplar WHERE KitapID='" + ID + "' AND AktifPasif<>0 ";
            return sorgu;
        }
        public string KitapSorguYazar(string[] words)
        {
            string sorgu = "SELECT * FROM tblKitaplar WHERE ";
            for (int i = 0; i < words.Length; i++)
            {
                sorgu = sorgu + "Yazar LIKE '%" + words[i] + "%'";
                if (i + 1 < words.Length)
                {
                    sorgu += "OR ";
                }
            }
            sorgu = sorgu + " AND AktifPasif<>0";
            return sorgu;
        }
        public string KitapDirektSorguYayinci(string words)
        {
            string sorgu = "SELECT * FROM tblKitaplar WHERE Yayinci='"+words+"' AND AktifPasif<>0";
            return sorgu;
        }
        public string KitapDirektSorguYazar(string words)
        {
            string sorgu = "SELECT * FROM tblKitaplar WHERE Yazar='"+words+"' AND AktifPasif<>0";
            return sorgu;
        }
        public string getKitapID(string ad, string yazar, string yayinci, int sayfaSayisi, string fotograf, string tur, string basimTarihi)
        {
            string sorgu = "SELECT KitapID FROM tblKitaplar WHERE KitapAd='" + ad + "' AND Yazar='" + yazar + "' AND Yayinci='" + yayinci + "' AND SayfaSayisi='" + sayfaSayisi + "' AND Fotograf='" + fotograf + "' AND Tur='" + tur + "' AND BasimTarih='" + basimTarihi + "'";
            return sorgu;
        }
        public string KitapGuncelle(string ad, string yazar, string yayinci, int sayfaSayisi, string fotograf, string tur, string basimTarihi,int kitapSayi, int ID)
        {
            string sorgu = "UPDATE tblKitaplar SET KitapAd='" + ad + "',Yazar='" + yazar + "',Yayinci='" + yayinci + "',SayfaSayisi='" + sayfaSayisi + "',KitapSayisi='"+kitapSayi+"',Fotograf='" + fotograf + "',Tur='" + tur + "',BasimTarih='" + basimTarihi + "',Tarih='" + System.DateTime.Now.ToShortTimeString() + "' WHERE KitapID='" + ID + "'";
            return sorgu;
        }
        public string KitapListele()
        {
            string sorgu = "SELECT KitapID,KitapAd,Yazar,Yayinci,SayfaSayisi,Tur,BasimTarih,AktifPasif,Fotograf,KitapSayisi FROM tblKitaplar WHERE AktifPasif<>0 ";
            return sorgu;
        }
        /*public string KitapSil(int ID)
        {
            string sorgu = "DELETE FROM tblKitaplar WHERE ID='" + ID + "'";
            return sorgu;
        }*/
        public string KitapGercektenSil(int ID)
        {
            string sorgu = "UPDATE tblKitaplar SET AktifPasif=0 WHERE KitapID='" + ID + "'";
            return sorgu;
        }
       
        public string KiraOlustur(int kullaniciID, int kitapID, string baslangic, string bitis)
        {
            string sorgu = "INSERT INTO tblKira (KitapID,KullaniciID,Baslangic,Bitis) VALUES ('" + kitapID + "','" + kullaniciID + "','" + baslangic + "','" + bitis + "')";
            return sorgu;
        }
        public string getKitapSayisi(int kitapID)
        {
            string sorgu = "SELECT KitapSayisi FROM tblKitaplar WHERE KitapID='"+kitapID+"'";
            return sorgu;
        }
        public string KitapSayiGuncelle(int sayi,int kitapID)
        {
            string sorgu = "UPDATE tblKitaplar SET KitapSayisi='" + sayi + "' WHERE KitapID='" + kitapID + "'";
            return sorgu;
        }
        public string AktifKitap(int ID)
        {
            string sorgu = "SELECT * FROM tblKitaplar WHERE AktifPasif<>0 AND KitapID='" + ID + "' AND KitapSayisi<>0";
            return sorgu;
        }

        public string Kiralama()
        {
            string sorgu = "SELECT * FROM tblKira kira INNER JOIN tblKitaplar kitap ON kira.KitapID = kitap.KitapID INNER JOIN tblKullanici kullanici ON kira.KullaniciID=kullanici.ID WHERE kitap.KitapID=kira.KitapID AND Teslimat IS NULL";
            return sorgu;
        }
        public string AllKira()
        {
            string sorgu = "SELECT * FROM tblKira kira INNER JOIN tblKitaplar kitap ON kira.KitapID = kitap.KitapID INNER JOIN tblKullanici kullanici ON kira.KullaniciID=kullanici.ID WHERE Teslimat IS NOT NULL";
            return sorgu;

        }
        public string KiralamaforK(int ID)
        {
            string sorgu = "SELECT * FROM tblKira kira INNER JOIN tblKitaplar kitap ON kira.KitapID = kitap.KitapID INNER JOIN tblKullanici kullanici ON kira.KullaniciID=kullanici.ID WHERE KullaniciID='" + ID + "'";
            return sorgu;
        }
        public string KitapIadeKira(int kitapID,int kullaniciID)
        {
            string format = "dd.MM.yyyy";
            string date = DateTime.Now.ToString(format);
            string sorgu = "UPDATE tblKira SET Teslimat='" + date + "' WHERE KitapID='" + kitapID + "' AND Teslimat IS NULL AND KullaniciID='"+kullaniciID+"'";
            return sorgu;
        }
        public string KitapIadeInfo(int kitapID,int kullaniciID)
        {
            string sorgu = "SELECT * FROM tblKira WHERE KitapID='" + kitapID + "' AND Teslimat IS NULL AND KullaniciID='"+kullaniciID+"'";
            return sorgu;
        }
        public string kullaniciKitap(int ID)
        {
            string sorgu = "SELECT * FROM tblKira kira INNER JOIN tblKitaplar kitap ON kira.KitapID = kitap.KitapID INNER JOIN tblKullanici kullanici ON kira.KullaniciID=kullanici.ID WHERE KullaniciID='" + ID + "' AND kitap.KitapID=kira.KitapID";
            return sorgu;
        }
        public string kullaniciAktif(int ID)
        {
            string sorgu = "SELECT * FROM tblKullanici WHERE ID='" + ID + "' AND AktifPasif<>0";
            return sorgu;
        }
        public string yorumEkle(string yorum, int kullaniciID, int kitapID,int puan,int guncelPuan)
        {
            string format = "dd.MM.yyyy";
            string date = DateTime.Now.ToString(format);
            string sorgu = "INSERT INTO tblYorum (Yorum,Begen,Dislike,KullaniciID,KitapID,YorumTarih,Puan,GuncelPuan) VALUES ('" + yorum + "',0,0,'" + kullaniciID + "','" + kitapID + "','" + date + "','"+puan+"','"+guncelPuan+"')";
            return sorgu;
        }
        public string getPuan(int kitapID)
        {
            string sorgu = "SELECT Puan FROM tblKitaplar WHERE KitapID='" + kitapID + "'";
            return sorgu;
        }
        public string getPuanlayan(int kitapID)
        {
            string sorgu = "SELECT Puanlayan FROM tblKitaplar WHERE KitapID='" + kitapID + "'";
            return sorgu;
        }
        public string PuanInfo(int kitapID,double puan,int puanlayan)
        {
            string sorgu = "UPDATE tblKitaplar SET Puan=" + puan + ",Puanlayan='" + puanlayan + "' WHERE KitapID='" + kitapID + "'";
            return sorgu;
        }
        //public string showYorum(int kitapID) {
        //    string sorgu = "SELECT * FROM tblYorum WHERE KitapID='" + kitapID + "'";
        //    return sorgu;
        //}
        public string getYorums(int kitapID)
        {
            string sorgu = "SELECT * FROM tblYorum yorum INNER JOIN tblKitaplar kitap ON yorum.KitapID = kitap.KitapID INNER JOIN tblKullanici kullanici ON yorum.KullaniciID=kullanici.ID WHERE yorum.KitapID='" + kitapID + "'";
            return sorgu;
        }
        public string getDoluYorums(int kitapID)
        {
            string condition = "";
            string sorgu = "SELECT * FROM tblYorum yorum INNER JOIN tblKitaplar kitap ON yorum.KitapID = kitap.KitapID INNER JOIN tblKullanici kullanici ON yorum.KullaniciID=kullanici.ID WHERE yorum.KitapID='" + kitapID + "' AND yorum.Yorum<>'"+condition+"'";
            return sorgu;
        }
        public string getKullaniciYorum(int kitapID,int kullaniciID)
        {
            string condition = "";
            string sorgu = "SELECT * FROM tblYorum yorum INNER JOIN tblKitaplar kitap ON yorum.KitapID = kitap.KitapID INNER JOIN tblKullanici kullanici ON yorum.KullaniciID=kullanici.ID WHERE yorum.KitapID='" + kitapID + "' AND yorum.KullaniciID='"+kullaniciID+"' AND yorum.Yorum<>'"+condition+"'";
            return sorgu;
        }
        public string getPuanliYorum(int kitapID,int kullaniciID)
        {
            string sorgu = "SELECT * FROM tblYorum yorum INNER JOIN tblKitaplar kitap ON yorum.KitapID = kitap.KitapID INNER JOIN tblKullanici kullanici ON yorum.KullaniciID=kullanici.ID WHERE yorum.KitapID='" + kitapID + "' AND yorum.KullaniciID='"+kullaniciID+"' AND yorum.Puan<>0";
            return sorgu;
        }
        public string getKullaniciYorumlari(int kullaniciID)
        {
            string condition = "";
            string sorgu = "SELECT * FROM tblYorum yorum INNER JOIN tblKitaplar kitap ON yorum.KitapID = kitap.KitapID INNER JOIN tblKullanici kullanici ON yorum.KullaniciID=kullanici.ID WHERE yorum.KullaniciID='"+kullaniciID+"' AND yorum.Yorum<>'"+condition+"'";
            return sorgu;
        }

        public string getYorumbyID(int yorumID)
        {
            string sorgu = "SELECT Yorum FROM tblYorum WHERE YorumID='" + yorumID + "'";
            return sorgu;
        }
        public string deleteYorumbyID(int yorumID)
        {
            string sorgu = "DELETE FROM tblYorum WHERE YorumID='" + yorumID + "'";
            return sorgu;
        }
        public string deleteYorumfromYetkili(int yorumID)
        {
            string yorum="";
            string sorgu = "UPDATE tblYorum SET Yorum='"+yorum+"' WHERE YorumID='" + yorumID + "'";
            return sorgu;
        }
        public string updateYorumbyID(string yorum,int yorumID)
        {
            string sorgu = "UPDATE tblYorum SET Yorum='" + yorum + "' WHERE YorumID='" + yorumID + "'";
            return sorgu;
        }

        public string LikeDislike(int ld,int kullaniciID,int yorumID)
        {
            string sorgu = "INSERT INTO tblLikeDislike (LikeDislike,KullaniciID,YorumID) VALUES ('" + ld + "','" + kullaniciID + "','" + yorumID + "')";
            return sorgu;
        }
        public string getBegen(int yorumID)
        {
            string sorgu = "SELECT Begen FROM tblYorum WHERE YorumID='" + yorumID + "'";
            return sorgu;
        }
        public string getDislike(int yorumID)
        {
            string sorgu = "SELECT Dislike FROM tblYorum WHERE YorumID='" + yorumID + "'";
            return sorgu;
        }
        public string Begen(int begeni,int yorumID)
        {
            string sorgu = "UPDATE tblYorum SET Begen='" + begeni + "' WHERE YorumID='" + yorumID + "'";
            return sorgu;
        }
        public string Dislike(int dislike,int yorumID)
        {
            string sorgu = "UPDATE tblYorum SET Dislike='" + dislike + "' WHERE YorumID='" + yorumID + "'";
            return sorgu;
        }
        public string LDSorgu(int kullaniciID,int yorumID)
        {
            string sorgu = "SELECT LikeDislike FROM tblLikeDislike WHERE YorumID='" + yorumID + "' AND KullaniciID='"+kullaniciID+"'";
            return sorgu;
        }
        public string DelLD(int kullaniciID,int yorumID)
        {
            string sorgu = "DELETE FROM tblLikeDislike WHERE kullaniciID='" + kullaniciID + "' AND yorumID='" + yorumID + "'";
            return sorgu;
        }
        public string UpdateLD(int ld,int kullaniciID,int yorumID)
        {
            string sorgu = "UPDATE tblLikeDislike SET LikeDislike='" + ld + "' WHERE KullaniciID='" + kullaniciID + "' AND YorumID='" + yorumID + "'";
            return sorgu;
        }
        public string getLikers(int ld,int yorumID)
        {
            string sorgu= "SELECT * FROM tblLikeDislike likeDislike INNER JOIN tblKullanici kullanici ON likeDislike.KullaniciID = kullanici.ID WHERE likeDislike.LikeDislike = '" + ld + "' AND likeDislike.YorumID='"+yorumID+"'";
            return sorgu;
        }
        public string kitapKiralayanlar(int id)
        {
            string sorgu = "SELECT KullaniciID FROM tblKira WHERE KitapID='" + id + "' AND Teslimat IS NULL";
            return sorgu;
        }
        public string kullaniciListe()
        {
            string sorgu = "SELECT * FROM tblKullanici WHERE AktifPasif<>0";
            return sorgu;
        }
        public string kullaniciListePasif()
        {
            string sorgu = "SELECT * FROM tblKullanici WHERE AktifPasif=0";
            return sorgu;
        }
        public string listAsType(string type)
        {
            string sorgu = "SELECT * FROM tblKitaplar WHERE Tur='" + type + "' AND AktifPasif<>0";
            return sorgu;
        }
    }
}
