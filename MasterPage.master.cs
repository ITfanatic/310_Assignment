using System;
using System.Collections.Generic;
//using System.Linq;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class MasterPage : System.Web.UI.MasterPage
{



    protected void Page_Load(object sender, EventArgs e)
    {
        //
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();

        if (!Request.Url.AbsoluteUri.Contains("Login_Page.aspx"))// need this check in order to stop the page from crashing as the Login session won't have been set yet
        {
            lblAdmin.Text = UserIsAdmin() ? "Current user is an administrator" : "Current user is not an administrator";
        }
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        //clearing the session
        Session.Abandon();
        Session.Clear();
        //redirecting it to login page
        Response.Redirect("Login_Page.aspx");

    }
    protected void btnMenu_Click(object sender, EventArgs e)
    {

        Response.Redirect("GrantSummary.aspx");
    }

    private bool UserIsAdmin()
    {

        if (Session["LoginAccepted"] == null)
        {
            Response.Redirect("Login_Page.aspx");
        }

        var con = new SqlConnection(ConfigurationManager.ConnectionStrings["FinanceDBConnectionString1"].ConnectionString);

        var query = "SELECT * FROM LoginDetails WHERE LoginId='" + Session["LoginAccepted"] + "'";

        var cmd = new SqlCommand(query, con);
        var adminValue = false;

        try
        {
            con.Open();

            var dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                adminValue = Convert.ToBoolean(dr["Admin"]);
            }
        }
        catch (Exception)
        {
            Response.Write(CommonFunctionality.FormatMessageJs("Error connecting to database."));
        }
        finally
        {
            con.Close();
        }

        return adminValue;

    }
}
