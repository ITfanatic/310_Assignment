using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;


public partial class AddStudent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginAccepted"] == null)
        {
            Response.Redirect("Login_Page.aspx");
        }

        if (!IsPostBack)
        {
            CommonFunctionality.PopulateDropdownList("FacultiesCMS", "FacultyName", null, ddlFaculty);

            CommonFunctionality.PopulateDropdownList("CoursesCMS","CourseName","FacultyId='1'",ddlArts);
            CommonFunctionality.PopulateDropdownList("CoursesCMS", "CourseName", "FacultyId='2'", ddlBusiness);
            CommonFunctionality.PopulateDropdownList("CoursesCMS", "CourseName", "FacultyId='3'", ddlHealth);
            CommonFunctionality.PopulateDropdownList("CoursesCMS", "CourseName", "FacultyId='5'", ddlIndustries);
            CommonFunctionality.PopulateDropdownList("CoursesCMS", "CourseName", "FacultyId='6'", ddlTrades);
            CommonFunctionality.PopulateDropdownList("CoursesCMS", "CourseName", "FacultyId='7'", ddlMaori);

            txbEthnicity.Visible = false;
        }
    }

    protected void ButtonAddStudent_Click(object sender, EventArgs e)
    {
        SqlConnection con1 =
            new SqlConnection(ConfigurationManager.ConnectionStrings["FinanceDBConnectionString1"].ConnectionString);

        SqlCommand cmd1 = new SqlCommand();

        cmd1.CommandText = "Select student_ID from Student_Registration_Form";
        cmd1.Connection = con1;
        con1.Open();
        cmd1.ExecuteNonQuery();
        SqlDataReader dr = cmd1.ExecuteReader();
        DateTime DOB;

        if (txbID.Text == "")
        {
            Response.Write("<script>alert('Please input Student ID')</script>");
            txbID.Focus();
        }

        else if (txbFname.Text == "")
        {
            Response.Write("<script>alert('Please enter the first name of the student')</script>");
            txbFname.Focus();
        }
        else if (ddlFaculty.SelectedValue == "")
        {
            Response.Write("<script>alert('Please select the Faculty of the student')</script>");
            ddlFaculty.Focus();
        }
        else if (ddlGender.SelectedValue == "")
        {
            Response.Write("<script>alert('Please select the gender of the student')</script>");
            ddlGender.Focus();
        }
        else if (txbDOB.Text == "")
        {

            Response.Write("<script>alert('Please input the Date of Birth')</script>");
            txbDOB.Focus();
        }


        else if (ddlCampus.SelectedValue == "")
        {
            Response.Write("<script>alert('Please select a campus')</script>");
            ddlCampus.Focus();

        }


        else
        {

            while (dr.Read())
            {

                if (dr["student_ID"].ToString() == txbID.Text.Trim())
                {
                    Response.Write("<script>alert('Student already exists')</script>");
                    return;
                }

            }

            try
            {

                DOB = Convert.ToDateTime(txbDOB.Text);
                SqlConnection con =
                    new SqlConnection(
                        ConfigurationManager.ConnectionStrings["FinanceDBConnectionString1"].ConnectionString);

                SqlCommand cmd =
                    new SqlCommand(
                        @"INSERT INTO 
                            Student_Registration_Form (Student_ID,FName,LName,Gender,DOB,Address1,Accomodition_Type,Phone,Mobile,Email,Marital_Status,Contact,Main_Ethnicity,Faculty,Courses,Detailed_Ethnicity,campus) 
                          VALUES 
                            (@Student_ID,@FName,@LName,@Gender,@DOB,@Address,@Accomodition_Type,@Phone,@Mobile,@Email,@Marital_Status,@Contact,@Main_Ethnicity,@Faculty,@Courses,@Detailed_Ethnicity,@campus)",
                        con);

                cmd.Parameters.AddWithValue("@Student_ID", txbID.Text);
                cmd.Parameters.AddWithValue("@FName", txbFname.Text);
                cmd.Parameters.AddWithValue("@LName", txbLname.Text);
                cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
                cmd.Parameters.AddWithValue("@DOB", txbDOB.Text);
                cmd.Parameters.AddWithValue("@Address", txbAddress.Text);
                cmd.Parameters.AddWithValue("@Accomodition_Type", ddlAccomodition.SelectedValue);
                cmd.Parameters.AddWithValue("@Phone", txbPhone.Text);
                cmd.Parameters.AddWithValue("@Mobile", txbMobile.Text);
                cmd.Parameters.AddWithValue("@Email", txbEmail.Text);
                cmd.Parameters.AddWithValue("@Marital_Status", ddlStatus.SelectedValue);
                cmd.Parameters.AddWithValue("@Contact", ddlContact.SelectedValue);
                cmd.Parameters.AddWithValue("@Main_Ethnicity", ddlEthnicity.SelectedValue);
                cmd.Parameters.AddWithValue("@Faculty", ddlFaculty.SelectedItem.Text);//can't use SelectedValue for ddl's populated by database as the value is the ID, text is the name
                cmd.Parameters.AddWithValue("@Detailed_Ethnicity", txbEthnicity.Text);
                cmd.Parameters.AddWithValue("@campus", ddlCampus.SelectedValue);
                if (ddlArts.Visible == true)
                {
                    cmd.Parameters.AddWithValue("@Courses", ddlArts.SelectedItem.Text);
                }
                else if (ddlBusiness.Visible == true)
                {
                    cmd.Parameters.AddWithValue("@Courses", ddlBusiness.SelectedItem.Text);
                }
                else if (ddlIndustries.Visible == true)
                {
                    cmd.Parameters.AddWithValue("@Courses", ddlIndustries.SelectedItem.Text);
                }
                else if (ddlTrades.Visible == true)
                {
                    cmd.Parameters.AddWithValue("@Courses", ddlTrades.SelectedItem.Text);
                }
                else if (ddlMaori.Visible == true)
                {
                    cmd.Parameters.AddWithValue("@Courses", ddlMaori.SelectedItem.Text);
                }
                else if (ddlHealth.Visible == true)
                {
                    cmd.Parameters.AddWithValue("@Courses", ddlHealth.SelectedItem.Text);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Courses", ddlFaculty.SelectedItem.Text);
                }

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Student Added Successfully..!!!')</script>");

                txbID.Text = "";
                txbFname.Text = "";
                txbLname.Text = "";
                txbDOB.Text = "";
                txbAddress.Text = "";
                txbMobile.Text = "";
                txbPhone.Text = "";
                txbEmail.Text = "";
                txbEthnicity.Text = "";

                ddlGender.SelectedIndex = 0;
                ddlAccomodition.SelectedIndex = 0;
                ddlContact.SelectedIndex = 0;
                ddlStatus.SelectedIndex = 0;
                ddlEthnicity.SelectedIndex = 0;
                ddlCampus.SelectedIndex = 0;
                ddlFaculty.SelectedIndex = 0;

                ddlMaori.Visible = false;
                ddlTrades.Visible = false;
                ddlIndustries.Visible = false;
                ddlBusiness.Visible = false;
                ddlArts.Visible = false;
                ddlHealth.Visible = false;
            }
            catch
            {
                Response.Write("<script>alert('Please input the right format for Date Of Birth')</script>");
                txbDOB.Focus();
            }

        }


    }

    protected void Addhardship_Click(object sender, EventArgs e)
    {
        Response.Redirect("StudentGrants.aspx");
    }


    protected void ddlArts_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void ddlFaculty_SelectedIndexChanged(object sender, EventArgs e)
    {
        // need to use the Id in these decisons instead of the Name because the Name of the faculty can now be changed through the CMS page
        switch (ddlFaculty.SelectedValue)
        {
            case "1":
                ShowCourseDropDown(true, false, false, false, false, false);
                ddlArts.Focus();
                break;
            case "2":
                ShowCourseDropDown(false, true, false, false, false, false);
                ddlBusiness.Focus();
                break;
            case "3":
                ShowCourseDropDown(false, false, true, false, false, false);
                ddlHealth.Focus();
                break;
            case "5":
                ShowCourseDropDown(false, false, false, true, false, false);
                ddlIndustries.Focus();
                break;
            case "6":
                ShowCourseDropDown(false, false, false, false, true, false);
                ddlTrades.Focus();
                break;
            case "7":
                ShowCourseDropDown(false, false, false, false, false, true);
                ddlMaori.Focus();
                break;
            default:
                ShowCourseDropDown(false, false, false, false, false, false);
                ddlFaculty.Focus();
                break;
        }
    }

    protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlEthnicity.SelectedValue == "Pacific" || ddlEthnicity.SelectedValue == "Asian" ||
            ddlEthnicity.SelectedValue == "Other")
        {
            txbEthnicity.Visible = true;
            txbEthnicity.Focus();
        }
        else
        {
            txbEthnicity.Visible = false;
            ddlCampus.Focus();
        }
    }

    protected void ddlIndustries_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void MainMenu_Click(object sender, EventArgs e)
    {
        Response.Redirect("GrantSummary.aspx");
    }

    private void ShowCourseDropDown(bool showArts, bool showBusiness, bool showHealth, bool showIndustries, bool showTrades, bool showMaori)
    {
        ddlArts.Visible = showArts;
        ddlBusiness.Visible = showBusiness;
        ddlHealth.Visible = showHealth;
        ddlIndustries.Visible = showIndustries;
        ddlTrades.Visible = showTrades;
        ddlMaori.Visible = showMaori;
    }
}

