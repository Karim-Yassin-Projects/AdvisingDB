using AdvisingWeb.DatabaseAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingWeb.Students
{
    public partial class OptionalCoursesPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["StudentID"] == null)
            {
                Response.Redirect("~/Students/LoginPage");
            }
            var studentID = int.Parse("StudentID");
            if (!Page.IsCallback)
            {
                gridOptionalCourses.DataSource = Procedures.ViewOptionalCourses(studentID, "S23");
                gridOptionalCourses.DataBind();
            }
        }
    }
}