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
    public partial class Member : System.Web.UI.Page
    {
        SQLSorgu sqlSorgu = new SQLSorgu();
        VeriIslem veriIslem = new VeriIslem();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
            {
                int kullaniciID = Convert.ToInt32(Session["userID"].ToString());
                DataTable dt = veriIslem.dataTable(sqlSorgu.Bilgilendirme(kullaniciID));
                txtname.Text = dt.Rows[0][0].ToString() + " " + dt.Rows[0][1].ToString();
                txtphoneNo.Text = dt.Rows[0][2].ToString();
                txtaddress.Text = dt.Rows[0][3].ToString();
                txtKullaniciId.Text = kullaniciID.ToString();

            }
        }
        protected void Comment_Click(object sender, EventArgs e)
        {
            Response.Redirect("YapilanYorumlarK.aspx");
        }
    }
}