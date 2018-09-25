using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pageModel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void loggedOutContinue_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Pages/Home.aspx");
    }
}