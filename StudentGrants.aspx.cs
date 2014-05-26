using System;
using System.Configuration;
using System.Data.SqlClient;
/// <summary>
/// This page is using voucher ID values e.g. '5' instead of voucher names e.g. 
/// 'Hardship' as these names can now be changed by the user from the CMS page.
/// </summary>
public partial class StudentGrants : System.Web.UI.Page
{
    decimal Check_Integer;
    decimal Check_Integer1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginAccepted"] != null)
        {
            if (Session["studentID"] != null)
            {
                StudentID.Text = Session["studentID"].ToString();
            }

            if (!IsPostBack)
            {
                CommonFunctionality.PopulateDropdownList("GrantsCMS", "GrantName", null, VoucherType);
            }
        }
        else
        {
            Response.Redirect("Login_Page.aspx");
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (VoucherType.SelectedValue)
        {
            case "5":/*Hardship*/
                GrantDescriptionLbl.Text = "Grant Description: ";
                lblValue.Text = " Funds:";
                lblValue.Font.Bold = true;
                GrantDescriptionLbl.Font.Bold = true;
                GrantDescriptiontxt.Enabled = true;
                lblKoha.Font.Bold = true;
                txbKuha.Enabled = true;
                VoucherValue.Enabled = true;
                GrantDescriptiontxt.Text = "";
                lblKoha.ForeColor = System.Drawing.Color.Red;
                lblValue.ForeColor = System.Drawing.Color.Red;
                GrantDescriptionLbl.ForeColor = System.Drawing.Color.Red;
                break;
            case "":
                GrantDescriptiontxt.Enabled = false;
                VoucherValue.Enabled = false;
                txbKuha.Enabled = false;
                lblKoha.ForeColor = System.Drawing.Color.Black;
                lblValue.ForeColor = System.Drawing.Color.Black;
                GrantDescriptionLbl.ForeColor = System.Drawing.Color.Black;
                break;
            case "1":/*Advice*/
                GrantDescriptionLbl.Text = "Advice Description:";
                lblValue.Font.Bold = false;
                GrantDescriptionLbl.Font.Bold = true;
                GrantDescriptiontxt.Enabled = true;
                lblKoha.Font.Bold = false;
                txbKuha.Enabled = false;
                VoucherValue.Enabled = false;
                GrantDescriptiontxt.Text = "";
                lblKoha.ForeColor = System.Drawing.Color.Black;
                lblValue.ForeColor = System.Drawing.Color.Black;
                GrantDescriptionLbl.ForeColor = System.Drawing.Color.Red;
                break;
            default:
                lblValue.Text = "Voucher Value:";
                lblValue.Font.Bold = true;
                GrantDescriptionLbl.Font.Bold = false;
                GrantDescriptiontxt.Enabled = false;
                lblKoha.Font.Bold = false;
                txbKuha.Enabled = false;
                VoucherValue.Enabled = true;
                lblKoha.ForeColor = System.Drawing.Color.Black;
                lblValue.ForeColor = System.Drawing.Color.Red;
                GrantDescriptionLbl.ForeColor = System.Drawing.Color.Black;
                break;
        }
    }

    protected void SubmitVoucher_Click(object sender, EventArgs e)
    {
        switch (VoucherType.SelectedValue.ToString())
        {
            case "5":/*Hardship*/
                if (GrantDescriptiontxt.Text != "")
                {
                    if (VoucherValue.Text != "" || txbKuha.Text != "")
                    {
                        if ((decimal.TryParse(VoucherValue.Text, out Check_Integer)) && (decimal.TryParse(txbKuha.Text, out Check_Integer1)))
                        {
                            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FinanceDBConnectionString1"].ConnectionString);

                            SqlCommand cmd = new SqlCommand("INSERT INTO Student_vouchers(Student_ID,GrantType,GrantDescription,GrantValue,KuhaFunds) VALUES (@Student_ID,@GrantType,@GrantDescription,@GrantValue,@KuhaFunds)", con);


                            cmd.Parameters.AddWithValue("@Student_ID", StudentID.Text);
                            cmd.Parameters.AddWithValue("@GrantType", VoucherType.Text);//TODO check if these are still working
                            cmd.Parameters.AddWithValue("@GrantDescription", GrantDescriptiontxt.Text);
                            cmd.Parameters.AddWithValue("@GrantValue", VoucherValue.Text);
                            cmd.Parameters.AddWithValue("@KuhaFunds", txbKuha.Text);
                            con.Open();
                            cmd.ExecuteNonQuery();
                            Response.Write("<script>alert('Grant Added Successfully..!!')</script>");
                            con.Close();
                            VoucherType.SelectedValue = "";
                            GrantDescriptiontxt.Text = "";
                            VoucherValue.Text = "";
                            txbKuha.Text = "";

                            lblKoha.ForeColor = System.Drawing.Color.Black;
                            lblValue.ForeColor = System.Drawing.Color.Black;
                            GrantDescriptionLbl.ForeColor = System.Drawing.Color.Black;
                        }
                        else
                        {
                            Response.Write("<script>alert('Please input Integer or zero if its nothing..!!')</script>");
                        }

                    }
                    else
                    {
                        Response.Write("<script>alert('Please Input Value or zero if its nothing..!!')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Please Input Hardship Description ..!!')</script>");
                }
                break;
            case "4":/*Train Tickets*/
            case "3":/*Food Vouchers*/
            case "2":/*Petrol Vouchers*/
                if (VoucherValue.Text != "")
                {
                    if (decimal.TryParse(VoucherValue.Text, out Check_Integer))
                    {

                        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FinanceDBConnectionString1"].ConnectionString);

                        SqlCommand cmd = new SqlCommand("INSERT INTO Student_vouchers(Student_ID,GrantType,GrantDescription,GrantValue) VALUES (@Student_ID,@GrantType,@GrantDescription,@GrantValue)", con);


                        cmd.Parameters.AddWithValue("@Student_ID", StudentID.Text);
                        cmd.Parameters.AddWithValue("@GrantType", VoucherType.Text);
                        cmd.Parameters.AddWithValue("@GrantDescription", VoucherType.Text);
                        cmd.Parameters.AddWithValue("@GrantValue", VoucherValue.Text);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        Response.Write("<script>alert('Grant Added Successfully..!!')</script>");
                        con.Close();

                        VoucherType.SelectedValue = "";
                        GrantDescriptiontxt.Text = "";
                        VoucherValue.Text = "";

                        lblKoha.ForeColor = System.Drawing.Color.Black;
                        lblValue.ForeColor = System.Drawing.Color.Black;
                        GrantDescriptionLbl.ForeColor = System.Drawing.Color.Black;
                    }
                    else
                    {
                        Response.Write("<script>alert('Please input Integer or zero if its nothing..!!')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Please Input Value or zero if its nothing..!!')</script>");
                }
                break;
            case "1":/*Advice*/
                if (GrantDescriptiontxt.Text != "")
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FinanceDBConnectionString1"].ConnectionString);

                    SqlCommand cmd = new SqlCommand("INSERT INTO Student_vouchers(Student_ID,GrantType,GrantDescription,GrantValue) VALUES (@Student_ID,@GrantType,@GrantDescription,@GrantValue)", con);


                    cmd.Parameters.AddWithValue("@Student_ID", StudentID.Text);
                    cmd.Parameters.AddWithValue("@GrantType", VoucherType.Text);
                    cmd.Parameters.AddWithValue("@GrantDescription", GrantDescriptiontxt.Text);
                    cmd.Parameters.AddWithValue("@GrantValue", 0);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Grant Added Successfully..!!')</script>");
                    con.Close();

                    VoucherType.SelectedValue = "";
                    GrantDescriptiontxt.Text = "";
                    VoucherValue.Text = "";

                    lblKoha.ForeColor = System.Drawing.Color.Black;
                    lblValue.ForeColor = System.Drawing.Color.Black;
                    GrantDescriptionLbl.ForeColor = System.Drawing.Color.Black;
                }
                else
                {
                    Response.Write("<script>alert('Please Enter Advice Description ..!!')</script>");
                }
                break;
            default:
                if (VoucherType.SelectedValue == "" || VoucherValue.Text == "")
                {
                    Response.Write("<script>alert('Please select Voucher Type')</script>");
                }
                else if (VoucherValue.Text == "")
                {
                    Response.Write("<script>alert('Please input Value')</script>");
                }
                break;
        }
    }
}
