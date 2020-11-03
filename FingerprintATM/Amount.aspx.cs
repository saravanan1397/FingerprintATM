using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FingerprintATM
{
  public partial class Amount : System.Web.UI.Page
  {
    public static string bank;
    protected void Page_Load(object sender, EventArgs e)
    {
      Bankname.InnerText = Session["bank"].ToString();
    }
    public Amount() { }
    public Amount(string bb)
    {
      bank = bb;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
      Secondverify sc=new Secondverify(amount.Value);
      Response.Redirect("Secondverify.aspx");
    }

  }
}