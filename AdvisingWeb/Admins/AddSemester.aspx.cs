using AdvisingWeb.DatabaseAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingWeb.Admins
{
    public partial class AddSemester : AdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            if(!Page.IsValid)
            {
                return;
            }

            try
            {
                Procedures.AdminAddSemester(SemesterCode.Text, DateTime.Parse(StartDate.Text), DateTime.Parse(EndDate.Text));
                FormPanel.Visible = false;
                ResultPanel.Visible = true;
            }
            catch
            {
                FormPanel.Visible = false;
                ErrorPanel.Visible = true;
            }
        }
    }
}