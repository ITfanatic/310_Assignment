using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AgeReport : System.Web.UI.Page
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

        if (Session["age"] != null)
            txtReadAge.Text = Session["age"].ToString();

        try
        {
            grdAgeReport.DataBind();
            DispayExtraInfo();
        }
        catch (System.Data.SqlClient.SqlException)
        {
            Response.Write(
                @"<script language='javascript'>
                    alert('Sorry, the age entered was invalid.\nPlease re-enter an age e.g. 46.');
                    window.location.href = 'GrantSummary.aspx';
                  </script>");//can't use Response.Redirect() because the JS alert won't display before being directed
        }
    }

    private void DispayExtraInfo()
    {
        var age = txtReadAge.Text;

        lblExtraInfo.Visible = true;
        lblExtraInfo.Text = string.Format("This report is based on grants supplied to students {0} years of age.", age);
    }
}