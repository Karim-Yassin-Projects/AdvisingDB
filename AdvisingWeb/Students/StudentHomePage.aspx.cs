using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingWeb.Students
{
    public partial class StudentHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ViewOptional(object sender, EventArgs e)
        {
            Response.Redirect("OptionalCoursesPage.aspx");
        }
        protected void ViewRequired(object sender, EventArgs e)
        {
            Response.Redirect("RequiredCoursesPage.aspx");
        }
    }
}