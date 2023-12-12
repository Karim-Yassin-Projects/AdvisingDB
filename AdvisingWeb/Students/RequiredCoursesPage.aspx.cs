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
            gridRequiredCourses.DataSource = Procedures.ViewRequiredCourses(11, "S23");
            gridRequiredCourses.DataBind();
        }
    }
}