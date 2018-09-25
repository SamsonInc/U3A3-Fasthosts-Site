using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class logOut : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //This small script clears all sessions and then redirects the user to the homepage, as of now this is pointless since the
        //User cant log on in the first place but once they can this should still work.
        Session.Abandon();
        Response.Redirect("~/Pages/Home.aspx");
    }
}