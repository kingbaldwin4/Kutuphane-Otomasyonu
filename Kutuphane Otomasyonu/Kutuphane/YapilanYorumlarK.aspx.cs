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
    public partial class YapılanYorumlarK : System.Web.UI.Page
    {
        SQLSorgu sqlSorgu = new SQLSorgu();
        VeriIslem veriIslem = new VeriIslem();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dtYorumlar = veriIslem.dataTable(sqlSorgu.getKullaniciYorumlari(Convert.ToInt32(Session["userID"].ToString()))); //Kullanıcının yaptığı yorumları görüntüleyebilmesi
            if (dtYorumlar.Rows.Count > 0)
            {
                gridYorumlar.DataSource = dtYorumlar;
                gridYorumlar.DataBind();
                gridYorumlar.Visible = true;
            }
            else
            {
                none.Visible = true;
                mainPage.Visible = false;
            }
        }

        protected void gridYorumlar_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}