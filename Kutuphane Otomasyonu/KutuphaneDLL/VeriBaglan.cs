using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KutuphaneDLL
{
    public class VeriBaglan
    {
        public SqlConnection con()
        {
            string conn = "Data source=toplanti9-14;initial catalog=Kutuphane;integrated security=true";
            SqlConnection con = new SqlConnection(conn);
            return con;
        }
    }
}
