using AdvisingWeb.DatabaseAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingWeb.Students
{
    public partial class RequiredCoursesPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["StudentID"] == null)
            {
                Response.Redirect("~/Students/LoginPage");
            }
            var studentID = int.Parse("StudentID");
            gridRequiredCourses.DataSource = Procedures.ViewRequiredCourses(studentID, "S23");
            gridRequiredCourses.DataBind();
        }
    }
}