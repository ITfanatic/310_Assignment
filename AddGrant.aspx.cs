using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class AddGrant : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginAccepted"] != null)
        {
            Page.Form.DefaultButton = btnGo.UniqueID;
            txtSearchID.Focus();
        }
        else
        {
            Response.Redirect("Login_Page.aspx");
        }
    }
    protected void btnGo_Click(object sender, EventArgs e)
    {
        if (StudentExists())
        {
            if (CommonFunctionality.StudentHasReachedMaxGrantAllowance(txtSearchID.Text ))
            {
                Response.Write(CommonFunctionality.FormatMessageJs("Student " + txtSearchID.Text + " has reached or exceeded the maximum grant allowance of $100."));
            }
            else
            {
                Session["studentID"] = txtSearchID.Text;
                Response.Redirect("StudentGrants.aspx");
            }
        }
        else
        {
            Response.Write("<script language='javascript'> alert('That student ID was not found. You can use the Search Students option to find a student ID.');</script>");
            txtSearchID.Text = string.Empty;
            txtSearchID.Focus();
        }
    }

    private bool StudentExists()
    {
        var exists = false;

        var con =
            new SqlConnection(ConfigurationManager.ConnectionStrings["FinanceDBConnectionString1"].ConnectionString);

        var cmd = new SqlCommand();

        cmd.CommandText = "select Student_ID,Fname from Student_Registration_Form";


        cmd.Connection = con;

        if (con.State == ConnectionState.Closed) con.Open();

        var dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            exists = dr["Student_ID"].ToString() == txtSearchID.Text.Trim();
            if (exists)
                break;
        }

        return exists;
    }
}