using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace AdvisingWeb.Students
{
    public class StudentPage : Page
    {
        protected override void OnLoad(EventArgs e)
        {
            if (Session["StudentID"] == null)
            {
                Response.Redirect("~/Students/LoginPage");
            }
            StudentID = (int)Session["StudentID"];
            base.OnLoad(e);
        }

        public int StudentID { get; private set; }
    }
}