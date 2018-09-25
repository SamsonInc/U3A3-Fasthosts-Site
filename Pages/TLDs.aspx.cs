using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class pageModel : System.Web.UI.Page
{
    public void Page_Load(object sender, EventArgs e)
    {
        if (Session["loggedIn"] == null)
        {
            tldContinue.Visible = false;
            
        }
        else
        {
            tldInfo.InnerHtml = "Select the TLDs you are interested in, We'll be in touch when they become available.";
        }
        tldSearchBox.Focus();
    }

    protected void tldSearch_textChanged(object sender, EventArgs e)
    {
        TestingTldDBTable.SelectCommand = "SELECT * FROM TLD WHERE TldName LIKE N'" + tldSearchBox.Text + "%'";
        TestingTldDBTable.DataBind();
    }

    //This script will give me the ID of the selected Tlds in the list, for now as a placeholder measure it adds the data into a list
    //but when properly implemented it will be able to add that TldID to the interests table along with the logged in userID
    protected void tldContinue_Click(object sender, EventArgs e)
    {
        List<string> selectedTlds = new List<string>();

        //Run for each gridview item shown
        foreach (GridViewRow row in GridView1.Rows)
        {
            //Find if the checkbox on the current row is selected
            CheckBox selRow = (row.Cells[0].FindControl("interestCtrl") as CheckBox);
            if (selRow.Checked)
            {
                //TLD Name = the row which has the name on it (can be chanegd)
                string tldName = row.Cells[1].Text;

                using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["FasthostsConnectionString"].ConnectionString))
                {
                    cn.Open();

                    using (SqlCommand cmd = new SqlCommand("SELECT TldID FROM TLD WHERE TldName LIKE '%' + @TldName + '%'", cn))
                    {
                        //Add selected TLDs to a list
                        cmd.Parameters.AddWithValue("@TldName", tldName);
                        cmd.Connection = cn;

                        selectedTlds.Add(cmd.ExecuteScalar().ToString());
                    }
                }
            }
        }

        using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["FasthostsConnectionString"].ConnectionString))
        {
            cn.Open();


            foreach (var item in selectedTlds)
            {
                //Check if the interest is already present
                SqlCommand chk = new SqlCommand("SELECT * FROM Interests WHERE UserID = @userID AND TldID = @selTld",cn);
                chk.Parameters.AddWithValue("@userID", int.Parse(Session["loggedInUserID"].ToString()));
                chk.Parameters.AddWithValue("@selTld", item);

                //If nothing comes back then run this
                if (chk.ExecuteScalar() == null)
                {
                    //Add new record, Selected ID with logged in user ID
                    SqlCommand add = new SqlCommand("INSERT INTO Interests (UserID, TldID) VALUES (@ID, @TLD)", cn);
                    add.Parameters.AddWithValue("@ID", Session["loggedInUserID"]);
                    add.Parameters.AddWithValue("@TLD", item);

                    //Run command
                    add.ExecuteScalar();
                }

                //Dispose of check command before looping around again
                chk.Dispose();
            }
        }
    }

    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (Session["loggedIn"] == null)
        {
            e.Row.Cells[0].Visible = false;
        }
    }
}