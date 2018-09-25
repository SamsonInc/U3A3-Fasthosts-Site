using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class logIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void loginbutton_Click(object sender, EventArgs e)
    {
        string username = loginUsernameBox.Value;
        string password = loginPasswordBox.Value;
        try
        {
            //Close the connection when the code below is complete
            using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["FasthostsConnectionString"].ConnectionString))
            {
                cn.Open();

                //Check if the account the user is trying to log into exists at all
                SqlCommand check = new SqlCommand("SELECT * FROM [User] WHERE Username = @username", cn);
                check.Parameters.AddWithValue("@username", username);

                if (check.ExecuteScalar() == null)
                {
                    Response.Write("<script>alert('Sorry, but that user doesn't exist. Try another Username')</script>");
                }
                //Select all from the database with that username (which should just be one)
                else
                {
                    SqlCommand passwordMatch = new SqlCommand("SELECT * FROM [User] WHERE Username=@username", cn);
                    passwordMatch.Parameters.AddWithValue("@username", username);

                    SqlDataReader reader = passwordMatch.ExecuteReader();
                    while (reader.Read())
                    {
                        //If the data in the password column is the same as the password supplied then log the user in via sessions
                        if (reader["Password"].ToString() == password)
                        {
                            Session["loggedInUserID"] = reader["UserID"].ToString();
                            Session["loggedInUser"] = reader["Username"].ToString();
                            Session["loggedInUserName"] = reader["FirstName"].ToString() + " " + reader["LastName"].ToString();
                            Session["loggedIn"] = "true";
                            if (Request.QueryString["page"] != null)
                            {
                                Response.Redirect(Request.QueryString["page"]);
                            }
                            else
                            {
                                Response.Redirect("~/Pages/Home.aspx");
                            }
                        }
                        //If that didn't work then you know that the password was incorrect
                        //User is alerted and allowed to try again
                        else
                        {
                            Response.Write("<script>alert('Incorrect Password, try again')</script>");
                        }
                    }
                }
            }
        }
        //Generic catch all for if anything goes wrong
        catch (Exception)
        {
            Response.Write("<script>alert('Logging in failed')</script>");
        }
    }
}