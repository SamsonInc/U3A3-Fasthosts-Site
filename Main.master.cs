using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Main : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loggedInUser"] == null)
        {
            LoggedInAsText.InnerHtml = "";
        }
        else
        {
            LoggedInAsText.InnerHtml = "Logged in As: " + Session["loggedInUser"].ToString();

            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["FasthostsConnectionString"].ConnectionString);
            cn.Open();

            SqlCommand thmCmd = new SqlCommand("SELECT Theme FROM [User] WHERE UserID = @userID", cn);
            thmCmd.Parameters.AddWithValue("userID", Session["loggedInUserID"]);

            SqlDataReader read = thmCmd.ExecuteReader();
            while (read.Read())
            {
                if (read.GetBoolean(0) != true)
                {
                    theme.Attributes.Remove("href");
                    theme.Attributes.Add("href", "CSS/StandardColoursLight.css");
                    setLight();
                }
                if (read.GetBoolean(0) == false)
                {
                    theme.Attributes.Remove("href");
                    theme.Attributes.Add("href", "CSS/StandardColoursLight.css");
                }
                if (read.GetBoolean(0) == true)
                {
                    theme.Attributes.Remove("href");
                    theme.Attributes.Add("href", "CSS/StandardColoursDark.css");
                }
                else
                {
                    theme.Attributes.Remove("href");
                    theme.Attributes.Add("href", "CSS/StandardColoursLight.css");
                }
            }
        }

        try
        {
            if (Session["loggedIn"].ToString() == "true")
            {
                loginButton.Visible = false;
                registerButton.Visible = false;
                accountButton.Visible = true;
                logOutButton.Visible = true;
            }
            else
            {
                loginButton.Visible = true;
                registerButton.Visible = true;
                accountButton.Visible = false;
                logOutButton.Visible = false;
            }
        }
        catch
        {

        }

    }

    private void setLight()
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["FasthostsConnectionString"].ConnectionString);
        cn.Open();

        SqlCommand set = new SqlCommand("UPDATE [User] SET Theme = 0 WHERE UserID = @userID", cn);
        set.Parameters.AddWithValue("userID", Session["loggedInUserID"]);
        set.ExecuteNonQuery();

        cn.Close();
    }

    protected void logOut(object sender, EventArgs a)
    {
        Session.Abandon();
        Response.Redirect(HttpContext.Current.Request.Url.AbsoluteUri);
    }

    protected void loginbuttonLink_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("~/Pages/logIn.aspx?page=" + HttpContext.Current.Request.Url.AbsoluteUri.ToString());
    }
}
