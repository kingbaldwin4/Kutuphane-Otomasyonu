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
    public partial class UKiralama : System.Web.UI.Page
    {
        SQLSorgu sqlSorgu = new SQLSorgu();
        VeriIslem veriIslem = new VeriIslem();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = veriIslem.dataTable(sqlSorgu.KiralamaforK(Convert.ToInt32(Session["userID"].ToString())));
            if (dt.Rows.Count == 0)
            {
                confirm.Visible = true;
                kira.Visible = false;
            }
            else
            {
                gridKitaplar.DataSource = dt;
                gridKitaplar.Width = 800;
                gridKitaplar.DataBind();
            }
        }
        protected void Yazar_Click(object sender, EventArgs e)
        {
            LinkButton button = sender as LinkButton;
            if (button != null)
            {
                string yazar = button.Text;
                Session["arananKitaplar"] = yazar;
                Response.Redirect("KitapInfo.aspx");
            }
        }
    }

}