using AdvisingWeb.DatabaseAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingWeb.Admins
{
    public partial class AddCourse : AdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            try
            {
                Procedures.AddCourse(Major.Text, int.Parse(Semester.Text), int.Parse(CreditHours.Text), CourseName.Text, IsOffered.Checked);
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