using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EthnicityReport : System.Web.UI.Page
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

        if (Session["ethnicity"] != null)
            txtReadEthnicity.Text = Session["ethnicity"].ToString();

        try
        {
            grdEthnicityReport.DataBind();
            DispayExtraInfo();
        }
        catch (System.Data.SqlClient.SqlException)
        {
            Response.Write(
                @"<script language='javascript'>
                    alert('Sorry, something went wrong.');
                    window.location.href = 'GrantSummary.aspx';
                  </script>");//can't use Response.Redirect() because the JS alert won't display before being directed
        }
    }

    private void DispayExtraInfo()
    {
        var ethnicity = txtReadEthnicity.Text;

        lblExtraInfo.Visible = true;
        lblExtraInfo.Text = string.Format("This report is based on grants supplied to students in the {0} ethnic group.", ethnicity);
    }
}