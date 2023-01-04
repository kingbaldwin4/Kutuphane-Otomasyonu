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
    public partial class YapilanYorumlarY : System.Web.UI.Page
    {
        SQLSorgu sqlSorgu = new SQLSorgu();
        VeriIslem veriIslem = new VeriIslem();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dtYorumlar = veriIslem.dataTable(sqlSorgu.getKullaniciYorumlari(Convert.ToInt32(Session["duzenlenenKullanici"].ToString()))); //Yetkili tarafında istenilen kişinin yaptığı yorumların listelenmesi
            if (dtYorumlar.Rows.Count > 0)
            {
                gridYorumlar.DataSource = dtYorumlar;
                gridYorumlar.DataBind();
                gridYorumlar.Visible = true;
            }
            else
            {
                mainPage.Visible = false;
                none.Visible = true;
            }
        }
    }
}