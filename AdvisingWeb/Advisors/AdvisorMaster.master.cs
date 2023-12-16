using AdvisingWeb.DatabaseAccess;
using System;
using System.Web.UI;

namespace AdvisingWeb.Advisors
{
    public partial class AdvisorMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsCallback)
            {
                if (Session["AdvisorID"] != null)
                {
                    var advisorId = (int)Session["AdvisorID"];
                    AdvisorIDLabel.Text = advisorId.ToString();
                    AdvisorNameLabel.Text = Queries.GetStudentFirstName(advisorId);

                }
            }
        }

        protected void LogOutClick(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/");
        }
    }
}