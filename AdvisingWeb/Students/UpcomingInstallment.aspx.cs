using AdvisingWeb.DatabaseAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingWeb.Students
{
    public partial class UpcomingInstallment : StudentPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var deadline = Functions.ViewUpcomingInstallment(StudentID);
            if (deadline == null)
            {
                InstallmentStatusLabel.Text = "You have no upcoming installment.";
            }
            else
            {
                InstallmentStatusLabel.Text = $"Your upcoming installment is due on {deadline:D} at {deadline:t}.";
            }
        }
    }
}