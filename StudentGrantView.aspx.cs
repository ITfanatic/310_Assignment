using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentGrantView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginAccepted"] != null)
        {
            if (Session["studentID"] != null)
                txbResult.Text = Session["studentID"].ToString();
        }
        else
        {
            Response.Redirect("Login_Page.aspx");
        }
    }

    protected void btnGrant_Click(object sender, EventArgs e)
    {
        if (CommonFunctionality.StudentHasReachedMaxGrantAllowance(Session["studentID"].ToString()))
        {
            Response.Write(CommonFunctionality.FormatMessageJs("This student has reached or exceeded the maximum grant allowance of $100."));
        }
        else
        {
            Session["studentID"] = txbResult.Text;
            Response.Redirect("StudentGrants.aspx");
        }
    }
}
