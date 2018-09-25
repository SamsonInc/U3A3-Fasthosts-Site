using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class pageModel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loggedIn"] == null)
        {
            Response.Redirect("/Pages/Home.aspx");
        }
        else
        {
            PageTitle.InnerText = "Account: " + Session["loggedInUser"];
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["FasthostsConnectionString"].ConnectionString);
            cn.Open();
            //Command to get Email for current user
            SqlCommand em = new SqlCommand("SELECT Email FROM [User] WHERE UserID = @userID", cn);
            em.Parameters.AddWithValue("userID", Session["loggedInUserID"]);

            //Show User information
            account_Username.InnerHtml = "Username: " + Session["loggedInUser"].ToString();
            account_RealName.InnerHtml = "Name: " + Session["loggedInUserName"].ToString();
            account_Email.InnerHtml = "Email: " + em.ExecuteScalar().ToString();
            Page.Title = "Fasthosts | " + Session["loggedInUser"].ToString();

            //Get the value in the theme column for the user
            SqlCommand thmCmd = new SqlCommand("SELECT Theme FROM [User] WHERE UserID = @userID", cn);
            thmCmd.Parameters.AddWithValue("userID", Session["loggedInUserID"]);

            //Show if value is true or false
            SqlDataReader read = thmCmd.ExecuteReader();
            while (read.Read())
            {
                if (read.GetBoolean(0) == false)
                {
                    account_darkThemeToggle.Checked = false;
                }
                if (read.GetBoolean(0) == true)
                {
                    account_darkThemeToggle.Checked = true;
                }
            }

            cn.Close();
        }
    }

    protected void account_darkThemeToggle_CheckedChanged(object sender, EventArgs e)
    {
        //Set Check to toggle Value
        int check;
        if (account_darkThemeToggle.Checked == false)
        {
            check = 1;
        }
        else
        {
            check = 0;
        }

        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["FasthostsConnectionString"].ConnectionString);
        cn.Open();

        //Update theme value for current user
        SqlCommand set = new SqlCommand("UPDATE [User] SET Theme = @theme WHERE UserID = @userID", cn);
        set.Parameters.AddWithValue("userID", Session["loggedInUserID"]);
        set.Parameters.AddWithValue("theme", check);
        set.ExecuteNonQuery();

        //Close connection for security
        cn.Close();

        //Redirect to the current page (Essentially just reload the current page)
        Response.Redirect(HttpContext.Current.Request.Url.AbsoluteUri.ToString());
    }

    protected void btn_deleteInterest_Click(object sender, EventArgs a)
    {
        Button btn = (Button)sender;
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;

        string tldName = gvr.Cells[0].Text;

        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["FasthostsConnectionString"].ConnectionString);
        cn.Open();

        SqlCommand getID = new SqlCommand("SELECT * FROM TLD WHERE TLDName = @tldName", cn);
        getID.Parameters.AddWithValue("tldName", tldName);

        SqlCommand del = new SqlCommand("DELETE FROM Interests WHERE UserID = @userID AND TldID = @tldID", cn);
        del.Parameters.AddWithValue("userID", Session["loggedInUserID"]);
        del.Parameters.AddWithValue("tldID", getID.ExecuteScalar());

        del.ExecuteNonQuery();

        Response.Redirect(HttpContext.Current.Request.Url.AbsoluteUri.ToString());
    }
}