using AdvisingWeb.DatabaseAccess;
using AdvisingWeb.Students;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingWeb.Scripts.Admins
{
    public partial class AdminLogin : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void LoginClick(object sender, EventArgs e)
        {
            if (!int.TryParse(AdminID.Text, out int adminId))
            {
                InvalidLogin.Visible = true;
                return;
            }
            if (AdminID.Text == "1" && Password.Text == "password123")
            {
                Session["AdminID"] = adminId;
                Response.Redirect("~/Admins/AdminHomePage");
            }
            else
            {
                InvalidLogin.Visible = true;
            }
        }
    }
}