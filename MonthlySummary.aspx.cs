using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MonthlySummary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginAccepted"] != null)
        {
            if (Session["MonthlySummary"] != null)
                txtMonth.Text = Session["MonthlySummary"].ToString();
            grdMonthlySummary.DataBind();
            var con = new SqlConnection(ConfigurationManager.ConnectionStrings["FinanceDBConnectionString1"].ConnectionString);

            var cmd = new SqlCommand();

            cmd.CommandText = @"
                                SELECT 
                                    COUNT(distinct student_ID) as TotalStudents,
                                    COUNT(student_ID) as TotalGrants,
                                    SUM(grantvalue) as GrantAmount,
                                    SUM(ISNULL(kuhafunds,0)) as KohaGrantAmount,
                                    DateName( month , DateAdd( month , @MonthNum , 0 ) - 1 ) AS MonthName
                                FROM 
                                    Student_vouchers 
                                WHERE 
                                    MONTH(DateOfIssue)=@Month";

            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@Month", txtMonth.Text);
            cmd.Parameters.AddWithValue("@MonthNum", Convert.ToInt32(txtMonth.Text));
            con.Open();
            cmd.ExecuteNonQuery();

            var dr = cmd.ExecuteReader();
          

            if (dr.Read())
            {
                var students = Convert.ToInt32(dr["TotalStudents"]) == 1 ? "student has" : "students have";

                TitleTXT.Text = "Overall Monthly Summary for all Vouchers, Hardships and Advices for " + dr["MonthName"];

                TotalSum.Text = string.Format("The Total Amount for every {0} on all grants is: ${1} (Koha Funds Contribution=${2})",
                    dr["MonthName"], dr["GrantAmount"], dr["KohaGrantAmount"]);
                TotalGrants.Text = string.Format("The Total Grants issued for {0} is {1}", dr["MonthName"], dr["TotalGrants"]);
                Totalstudents.Text = string.Format("{0} individual {1} recieved grants for every {2}", dr["TotalStudents"], students, dr["MonthName"]);
            }
            else
            {
                TitleTXT.Visible = false;
            }
        }
        else
        {
            Response.Redirect("Login_Page.aspx");
        }
    }
}