using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class PetrolMonthlySummary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginAccepted"] == null)
        {
            Response.Redirect("Login_Page.aspx");
        }
        else
        {

            if (Session["Vouchers"] != null && Session["Month"] != null && Session["weeklyYear"] != null)
            {
                txbReadVoucher.Text = Session["Vouchers"].ToString();
                txbReadWeeklyYear.Text = Session["weeklyYear"].ToString();
                txbReadMonth.Text = Session["Month"].ToString();
            }

            GridView1.DataBind();

            var con = new SqlConnection(ConfigurationManager.ConnectionStrings["FinanceDBConnectionString1"].ConnectionString);

            var cmd = new SqlCommand(@"
                SELECT 
                    count(distinct student_ID) AS NoofStudents,
                    count(student_ID) AS NoofGrants,
                    sum(GrantValue) AS MonthSum,
                    sum(ISNULL(kuhafunds,0)) AS KohaMonthSum,
                    (sum(GrantValue)+sum(ISNULL(kuhafunds,0))) AS TotalMonthSum,
                    datename(MONTH,DateOfIssue) AS Monthname 
                FROM 
                    Student_vouchers 
                WHERE 
                    Month(DateOfIssue)=@month AND granttype=@Vouchers AND Year(DateOfIssue)=@Year 
                GROUP BY 
                    datename(MONTH,DateOfIssue)",
                con);

            cmd.Parameters.AddWithValue("@month", txbReadMonth.Text);
            cmd.Parameters.AddWithValue("@Year", txbReadWeeklyYear.Text);
            cmd.Parameters.AddWithValue("@Vouchers", txbReadVoucher.Text);
            con.Open();
            cmd.ExecuteNonQuery();

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                switch (txbReadVoucher.Text)
                {
                    case "PetrolVouchers":
                        lblMsg.Text = "Total Amount Spent on Petrol Vouchers for " + dr["NoofGrants"] + " grants on " + dr["NoofStudents"] + " students for the month is $ " + dr["TotalMonthSum"];
                        lblMsgfunds.Text = "Amount spend from  Funds= $ " + dr["MonthSum"];
                        lblMsgKohafunds.Text = "Amount spend from Koha Funds= $ " + dr["KohaMonthSum"];
                        Titletext.Visible = true;
                        Titletext.Text = "Weekly Summary Report on Petrol Vouchers for the month of " + dr["Monthname"] + " in Year " + txbReadWeeklyYear.Text;
                        break;
                    case "Hardship":
                        lblMsg.Text = "Total Amount Spent on Hardships for " + dr["NoofGrants"] + " grants on " + dr["NoofStudents"] + " students for the month is $ " + dr["TotalMonthSum"];
                        lblMsgfunds.Text = "Amount spend from  Funds= $ " + dr["MonthSum"];
                        lblMsgKohafunds.Text = "Amount spend from Koha Funds= $ " + dr["KohaMonthSum"];
                        Titletext.Visible = true;
                        Titletext.Text = "Weekly Summary Report on Hardship for the month of " + dr["Monthname"] + " in Year " + txbReadWeeklyYear.Text;
                        break;
                    case "TrainTickets":
                        lblMsg.Text = "Total Amount Spent on Train Tickets for " + dr["NoofGrants"] + " grants on " + dr["NoofStudents"] + " students for the month is $ " + dr["TotalMonthSum"];
                        lblMsgfunds.Text = "Amount spend from  Funds= $ " + dr["MonthSum"];
                        lblMsgKohafunds.Text = "Amount spend from Koha Funds= $ " + dr["KohaMonthSum"];
                        Titletext.Visible = true;
                        Titletext.Text = "Weekly Summary Report on Train Tickets for the month of " + dr["Monthname"] + " in Year " + txbReadWeeklyYear.Text;
                        break;
                    case "FoodVouchers":
                        lblMsg.Text = "Total Amount Spent on Food Vouchers for " + dr["NoofGrants"] + " grants on " + dr["NoofStudents"] + " students for the month is $ " + dr["TotalMonthSum"];
                        lblMsgfunds.Text = "Amount spend from  Funds= $ " + dr["MonthSum"];
                        lblMsgKohafunds.Text = "Amount spend from Koha Funds= $ " + dr["KohaMonthSum"];
                        Titletext.Visible = true;
                        Titletext.Text = "Weekly Summary Report on Food Vouchers for the month of " + dr["Monthname"] + " in Year " + txbReadWeeklyYear.Text;
                        break;
                    case "Advice":
                        lblMsg.Text = "Total Amount Spent on Advice for " + dr["NoofGrants"] + " grants on " + dr["NoofStudents"] + " students for the month is $ " + dr["TotalMonthSum"];
                        lblMsgfunds.Text = "Amount spend from  Funds= $ " + dr["MonthSum"];
                        lblMsgKohafunds.Text = "Amount spend from Koha Funds= $ " + dr["KohaMonthSum"];
                        Titletext.Visible = true;
                        Titletext.Text = "Weekly Summary Report on Advice for the month of " + dr["Monthname"] + " in Year " + txbReadWeeklyYear.Text;
                        break;
                }
            }
            else
            {
                GridView1.EmptyDataText = "Sorry, No data to display..!!";
            }
        }
    }
}
