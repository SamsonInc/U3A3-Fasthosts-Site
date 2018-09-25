using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class register : System.Web.UI.Page
{

    protected void registerButton_Click(object sender, EventArgs e)
    {
        string firstName = firstNameBox.Value;
        string lastName = lastNameBox.Value;
        string username = usernameBox.Value;
        string email = emailBox.Value;
        string password = passwordBox.Value;

        //Try to do the following but don't crash spectacularly if it goes wrong
        try
        {
            //Create the connection and open it, Using means that when code execution is complete the connection will close itself
            using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["FasthostsConnectionString"].ConnectionString))
            {
                cn.Open();
                //Command to check if user already exists via username
                SqlCommand check = new SqlCommand("SELECT * FROM [User] WHERE Username = @username", cn);
                check.Parameters.AddWithValue("@username", username);

                //Checking if searching for that user returns anything, if it does then you know that the user exists
                if (check.ExecuteScalar() != null)
                {
                    Response.Write("<script>alert('Sorry, but that user already exists. Try another Username')</script>");
                }
                //If it returns nothing then you know you are good to go
                else
                {
                    //Inserting the following values into the following rows as a new record
                    SqlCommand add = new SqlCommand("INSERT INTO [User] (Username, FirstName, LastName, Email, Password, Theme) VALUES(@Username, @Firstname, @Lastname, @Email, @Password, 0)", cn);
                    add.Parameters.AddWithValue("@Username", username);
                    add.Parameters.AddWithValue("@Firstname", firstName);
                    add.Parameters.AddWithValue("@Lastname", lastName);
                    add.Parameters.AddWithValue("@Email", email);
                    add.Parameters.AddWithValue("@Password", password);

                    //If anything is affected then redirect to login (Registering was a success)
                    if (add.ExecuteNonQuery() != 0)
                    {
                        Response.Redirect("/Pages/logIn.aspx");
                    }
                    //If nothing was affected then you know something went wrong
                    else
                    {
                        Response.Write("<script>alert('Sorry, Unable to create User')</script>");
                    }
                }
            }
        }
        //Generic catch all for if anything goes wrong
        catch (Exception a)
        {
            Response.Write("Sorry, Couldn't connect to the database: " + a.Message);
        }
    }
}