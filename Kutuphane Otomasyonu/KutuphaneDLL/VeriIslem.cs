using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KutuphaneDLL
{
    public class VeriIslem
    {
        VeriBaglan vb = new VeriBaglan();
        public DataTable dt(string sorgu)
        {
            SqlDataAdapter da = new SqlDataAdapter(sorgu, vb.con());
            DataTable dt = new DataTable();

            da.Fill(dt);
            return dt;
        }
    }
}
