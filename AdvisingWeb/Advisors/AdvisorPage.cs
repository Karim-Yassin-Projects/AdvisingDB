using System;
using System.Web.UI;

namespace AdvisingWeb.Advisors
{
    public class AdvisorPage : Page
    {
        protected override void OnLoad(EventArgs e)
        {
            if (Session["AdvisorID"] == null)
            {
                Response.Redirect("~/Advisors/LoginPage");
            }
            AdvisorID = (int)Session["AdvisorID"];
            base.OnLoad(e);
        }

        public int AdvisorID { get; private set; }
    }
}