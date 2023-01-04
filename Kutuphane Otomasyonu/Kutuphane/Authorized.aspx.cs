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
    public partial class Authorized : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) //Yetkiliye ait bilgilerin listelendiği sayfa
        {
            SQLSorgu sqlSorgu = new SQLSorgu();
            VeriIslem veriIslem = new VeriIslem();
            if (Session["userID"] != null)
            {
                int kullaniciID = Convert.ToInt32(Session["userID"].ToString());
                DataTable dt = veriIslem.dataTable(sqlSorgu.Bilgilendirme(kullaniciID));
                txtname.Text = dt.Rows[0][0].ToString() + " " + dt.Rows[0][1].ToString();
                txtphoneNo.Text = dt.Rows[0][2].ToString();
                txtaddress.Text = dt.Rows[0][3].ToString();
                
            }
        }
    }
}