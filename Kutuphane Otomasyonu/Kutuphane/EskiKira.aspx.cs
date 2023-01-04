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
    public partial class EskiKira : System.Web.UI.Page
    {
        SQLSorgu sqlSorgu = new SQLSorgu();
        VeriIslem veriIslem = new VeriIslem();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = veriIslem.dataTable(sqlSorgu.AllKira()); //Teslimat tarihi null olmayan yani teslim edilmiş kitapları listeler
            gridKitaplar.DataSource = dt;
            gridKitaplar.Width = 800;
            gridKitaplar.DataBind();
        }
        protected void Yazar_Click(object sender, EventArgs e)
        {
            LinkButton button = sender as LinkButton;
            if (button != null)
            {
                string[] words = button.Text.Split(' ');
                mainPage.Visible = false;
                DataTable dtL = veriIslem.dataTable(sqlSorgu.KitapSorguYazar(words));
                gridList.DataSource = dtL;
                gridList.Width = 400;
                gridList.DataBind();
                liste.Visible = true;
            }
        }
        protected void Yayinci_Click(object sender, EventArgs e) //Yayıncıya tıklandığında o yayıncıya ait kitaplar listelenir
        {
            LinkButton button = sender as LinkButton;
            if (button != null)
            {
                string words = button.Text;
                mainPage.Visible = false;
                DataTable dtL = veriIslem.dataTable(sqlSorgu.KitapDirektSorguYayinci(words));
                gridList.DataSource = dtL;
                gridList.Width = 400;
                gridList.DataBind();
                liste.Visible = true;
            }
        }
    }

}