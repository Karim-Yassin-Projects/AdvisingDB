using AdvisingWeb.DatabaseAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingWeb.Students
{
    public partial class SendingCHRequestPage : StudentPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                var advisorId = Queries.GetAdvisorId(StudentID);
                if (advisorId == null)
                {
                    FormPanel.Visible = false;
                    ErrorPanel.Visible = true;
                }
            }
        }
        protected void SendCHRequest(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }
            Procedures.SendingCHRequest(StudentID, int.Parse(creditHours.Text), "credit_hours", comment.Text);
            FormPanel.Visible = false;
            ResultPanel.Visible = true;
        }
    }
}