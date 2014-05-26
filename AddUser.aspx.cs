using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class AddUser : System.Web.UI.Page
{
    private readonly string _connectionString =
        ConfigurationManager.ConnectionStrings["FinanceDBConnectionString1"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginAccepted"] != null)
        {
            if (UserIsAdmin())
            {
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
            }
            else
            {
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                RestrictAddUserField();
            }
        }
        else
        {
            Response.Redirect("Login_Page.aspx");
        }
    }

    protected void btnCreateNewUser_Click(object sender, EventArgs e)
    {
        if (!txtPassword.Text.Equals(txtPasswordCheck.Text))
        {
            Response.Write("<script>alert('Passwords do not match, please re-enter')</script>");
            txtPassword.Text = CommonFunctionality.ClearText();
            txtPasswordCheck.Text = CommonFunctionality.ClearText();
        }
        else
        {
            if (UserIDExists())
            {
                Response.Write("<script>alert('Sorry, that user ID is already in use')</script>");
                txtNewUserName.Text = CommonFunctionality.ClearText();
                txtNewUserName.Focus();
            }
            else
            {
                AddNewUser();
                Response.Write("<script>alert('Successful')</script>");
                txtNewUserName.Text = string.Empty;
            }
        }
    }

    protected void btnChangePassword_Click(object sender, EventArgs e)
    {
        if (CurrentPasswordIsCorrect())
        {
            if (!txtNewPassword.Text.Equals(txtNewPasswordCheck.Text))
            {
                Response.Write("<script>alert('New passwords do not match, please re-enter')</script>");
                txtNewPassword.Text = CommonFunctionality.ClearText();
                txtNewPasswordCheck.Text = CommonFunctionality.ClearText();
            }
            else
            {
                ChangePassword();
                Response.Write(CommonFunctionality.FormatMessageJs("Password changed successfully"));
            }
        }
        else
        {
            Response.Write("<script>alert('The current password entered is incorrect, please re-enter.')</script>");
            txtCurrentPassword.Text = CommonFunctionality.ClearText();
            txtCurrentPassword.Focus();
        }
    }

    #region Helper Methods
    private bool UserIDExists()
    {
        var userIDs = CommonFunctionality.GetUserIDs();
        var requestedUserID = txtNewUserName.Text;

        //finds if there are any matches in the user ID list 
        return userIDs.Any(x => x.Equals(requestedUserID));
    }

    private void AddNewUser()
    {
        var con = new SqlConnection(_connectionString);
        var LoginID = txtNewUserName.Text.Trim();
        var LoginPassword = txtPassword.Text;
        var userIsAdministrator = radYes.Checked;

        var query =
            @"
            INSERT INTO 
                LoginDetails 
            VALUES 
                ('" + LoginID + "','" + LoginPassword + "','" + userIsAdministrator + "')";

        var cmd = new SqlCommand(query, con);

        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
        }
        catch (Exception)
        {
            Response.Write("<script>alert('Something went wrong')</script>");
        }
        finally
        {
            con.Close();
        }
    }

    private bool CurrentPasswordIsCorrect()
    {
        var enteredPassword = txtCurrentPassword.Text;
        var actualPassword = Session["LoginPassword"].ToString();

        return enteredPassword == actualPassword;
    }

    private void ChangePassword()
    {
        var newPassword = txtNewPassword.Text;
        var LoginID = Session["LoginAccepted"].ToString();

        var con = new SqlConnection(_connectionString);

        var query =
            @"
            UPDATE 
                LoginDetails 
            SET
                Loginpassword='" + newPassword + @"' 
            WHERE 
                LoginID='" + LoginID + "'";

        var cmd = new SqlCommand(query, con);

        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            Session["LoginPassword"] = newPassword;
        }
        catch (Exception)
        {
            Response.Write(CommonFunctionality.FormatMessageJs("Oops, something went wrong!"));
        }
        finally
        {
            con.Close();
        }
    }

    private void RestrictAddUserField()
    {
        lblAddUser.Text = "You must be an administrator to add a user";
        lblAddUser.ForeColor = Color.Red;
        txtNewUserName.ReadOnly = true;
        txtPassword.ReadOnly = true;
        txtPasswordCheck.ReadOnly = true;
        radNo.Visible = false;
        radYes.Visible = false;
        btnCreateNewUser.Visible = false;
    }

    private bool UserIsAdmin()
    {
        var con = new SqlConnection(_connectionString);
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
    #endregion
}