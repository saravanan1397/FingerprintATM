using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FingerprintATM
{
  public partial class Login : System.Web.UI.Page
  {
    SqlConnection con=new SqlConnection(ConfigurationManager.ConnectionStrings["FingerATM"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
      con.Open();
      string select="select Firstfinger,ID from Register";
      SqlCommand cmd=new SqlCommand(select, con);
      SqlDataAdapter ad=new SqlDataAdapter(cmd);
      DataTable dt=new DataTable();
      ad.Fill(dt);
      GridView1.DataSource = dt;
      GridView1.DataBind();
      con.Close();
    }
  }
}