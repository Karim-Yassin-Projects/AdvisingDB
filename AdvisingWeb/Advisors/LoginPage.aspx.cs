using AdvisingWeb.DatabaseAccess;
using System;

namespace AdvisingWeb.Advisors
{
    public partial class LoginPage: System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginClick(object sender, EventArgs e)
        {
            if (!int.TryParse(AdvisorID.Text, out int advisorId))
            {
                InvalidLogin.Visible = true;
                return;
            }
            bool success = Functions.AdvisorLogin(advisorId, Password.Text);

            if (success)
            {
                Session["AdvisorID"] = advisorId;
                Response.Redirect("~/Advisors/AdvisorHomePage");
            }
            else
            {
                InvalidLogin.Visible = true;
            }
        }
    }
}