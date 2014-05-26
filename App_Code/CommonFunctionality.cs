using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Caching;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using TextBox = System.Windows.Forms.TextBox;

/// <summary>
/// Summary description for CommonFunctionality
/// </summary>
public class CommonFunctionality
{
    public static string ClearText()
    {
        return "";
    }

    public static List<string> GetUserIDs()
    {
        var con =
            new SqlConnection(ConfigurationManager.ConnectionStrings["FinanceDBConnectionString1"].ConnectionString);

        var cmd = new SqlCommand { CommandText = "SELECT * FROM LoginDetails", Connection = con };

        var users = new List<string>();
        try
        {
            con.Open();

            var dr = cmd.ExecuteReader();

            //get all the user IDs from the DB and put them in a list
            while (dr.Read())
            {
                var currentLoginID = dr["LoginID"].ToString();
                users.Add(currentLoginID);
            }
        }
        catch (Exception)
        {
            MessageBox.Show("Error connecting to database");
        }
        finally
        {
            con.Close();
        }

        return users;
    }

    public static string FormatMessageJs(string message)
    {
        return string.Format("<script>alert('{0}')</script>", message);
    }

    public static void PopulateDropdownList(string dbTable, string dbColumn, string whereClause, DropDownList dropDownList)
    {
        var con =
              new SqlConnection(ConfigurationManager.ConnectionStrings["FinanceDBConnectionString1"].ConnectionString);

        var cmd = !string.IsNullOrEmpty(whereClause)
            ? new SqlCommand("SELECT * FROM " + dbTable + " WHERE " + whereClause + " ORDER BY " + dbColumn, con)
            : new SqlCommand("SELECT * FROM " + dbTable + " ORDER BY " + dbColumn, con);

        try
        {
            con.Open();

            var dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                var newitem = new ListItem
                {
                    Text = dr[dbColumn].ToString(),
                    Value = dr["Id"].ToString()// need to get the Id so when deciding which courses dropdown to display we can check with the Id instead of the Name of the faculty
                };

                dropDownList.Items.Add(newitem);
            }
        }
        catch (Exception)
        {
            MessageBox.Show("Error connecting to database");
        }
        finally
        {
            con.Close();
        }
    }

    public static bool StudentHasReachedMaxGrantAllowance(string sid)
    {
        var totalGrantSumForStudent = 0;
        var hasReachedMaxAllowance = false;

        var con =
            new SqlConnection(ConfigurationManager.ConnectionStrings["FinanceDBConnectionString1"].ConnectionString);

        var query = @"SELECT 
	                    SUM(GrantValue) as TotalGrants
                    FROM 
	                    Student_vouchers 
                    WHERE
	                    student_ID=" + sid;

        var cmd = new SqlCommand(query, con);
        try
        {
            con.Open();
            var sqlReader = cmd.ExecuteReader();

            while (sqlReader.Read())
            {
                if (sqlReader["TotalGrants"] != DBNull.Value)
                {
                    totalGrantSumForStudent = Convert.ToInt32(sqlReader["TotalGrants"]);
                }
            }

            if (totalGrantSumForStudent > 100)
            {
                hasReachedMaxAllowance = true;
            }
        }
        catch (SqlException) { }
        finally
        {
            con.Close();
        }

        return hasReachedMaxAllowance;
    }
}