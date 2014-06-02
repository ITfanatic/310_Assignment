using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Runtime.InteropServices;

public partial class Forgotpasword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var masterPage = Master;
        if (masterPage != null) masterPage.FindControl("btnLogout").Visible = false;
    }

    protected void btnQuestion_Click(object sender, EventArgs e)
    {
        var users = CommonFunctionality.GetUserIDs();

        if (users.Contains(txtUserName.Text))
        {
            lblQuestion.Text = GetUsersQuestion(txtUserName.Text);
            lblAnswer.Visible = true;
            txtAnswer.Visible = true;
            txtAnswer.Text = string.Empty;
            btnAnswer.Visible = true;
        }
        else
        {
            txtUserName.Text = "That user doesn't exist!";
            lblQuestion.Text = string.Empty;
            lblAnswer.Visible = false;
            txtAnswer.Visible = false;
            btnAnswer.Visible = false;
        }
    }

    protected void btnAnswer_Click(object sender, EventArgs e)
    {
        var userName = txtUserName.Text;
        var attemptedAnswer = txtAnswer.Text;

        if (AnswerIsCorrect(userName, attemptedAnswer))
        {
            Response.Write(
                CommonFunctionality.FormatMessageJs(string.Format("The answer was correct! Your password is {0}.",
                    GetUserPassword(userName))));
        }
        else
        {
            Response.Write(CommonFunctionality.FormatMessageJs("Sorry, that answer was incorrect."));
            txtAnswer.Text = string.Empty;
        }
    }

    private bool AnswerIsCorrect(string userName,string attemptedAnswer)
    {
        var answer = string.Empty;

        var con =
            new SqlConnection(ConfigurationManager.ConnectionStrings["FinanceDBConnectionString1"].ConnectionString);

        var query = @"
                    SELECT 
                        SecretAnswer 
                    FROM
                        LoginDetails
                    WHERE
                        LoginID='" + userName + "'";

        var cmd = new SqlCommand(query, con);

        try
        {
            con.Open();
            var dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                answer = dr["SecretAnswer"].ToString();
            }
        }
        catch (Exception)
        {
            Response.Write(CommonFunctionality.FormatMessageJs("Something went wrong connecting to the database!"));
        }
        finally
        {
            con.Close();
        }

        return answer.Equals(attemptedAnswer, StringComparison.InvariantCultureIgnoreCase);
    }

    private string GetUsersQuestion(string userName)
    {
        var question = string.Empty;

        var con =
            new SqlConnection(ConfigurationManager.ConnectionStrings["FinanceDBConnectionString1"].ConnectionString);

        var query = @"
                    SELECT 
                        SecretQuestion 
                    FROM
                        LoginDetails
                    WHERE
                        LoginID='" + userName + "'";

        var cmd = new SqlCommand(query, con);

        try
        {
            con.Open();
            var dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                question = dr["SecretQuestion"].ToString();
            }
        }
        catch (Exception)
        {
            Response.Write(CommonFunctionality.FormatMessageJs("Something went wrong connecting to the database!"));
        }
        finally
        {
            con.Close();
        }

        return question;
    }

    private string GetUserPassword(string userName)
    {
        var password = string.Empty;

        var con =
            new SqlConnection(ConfigurationManager.ConnectionStrings["FinanceDBConnectionString1"].ConnectionString);

        var query = @"
                    SELECT 
                        Loginpassword 
                    FROM
                        LoginDetails
                    WHERE
                        LoginID='" + userName + "'";

        var cmd = new SqlCommand(query, con);

        try
        {
            con.Open();
            var dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                password = dr["Loginpassword"].ToString();
            }
        }
        catch (Exception)
        {
            Response.Write(CommonFunctionality.FormatMessageJs("Something went wrong connecting to the database!"));
        }
        finally
        {
            con.Close();
        }

        return password;
    }
}
