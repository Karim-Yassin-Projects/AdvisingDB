using AdvisingWeb.DatabaseAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingWeb.Students
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginClick(object sender, EventArgs e)
        {
            if (!int.TryParse(StudentID.Text, out int studentId))
            {
                InvalidLogin.Visible = true;
                return;
            }
            bool success = Functions.StudentLogin(studentId, Password.Text);

            if (success)
            {
                Session["StudentID"] = studentId;
                Response.Redirect("~/Students/StudentHomePage");
            }
            else
            {
                InvalidLogin.Visible = true;
            }
        }

        

    }
}