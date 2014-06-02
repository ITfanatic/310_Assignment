using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sitemap : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginAccepted"] != null)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
        }
        else
        {
            Response.Redirect("Login_Page.aspx");
        }
    }
}