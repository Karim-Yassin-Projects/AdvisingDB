using AdvisingWeb.DatabaseAccess;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingWeb.Students
{
    public partial class RequiredCoursesPage : StudentPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var semesterCodes = Queries.GetSemesterCodes();
                SemesterCodes.DataSource = semesterCodes;
                SemesterCodes.DataBind();

                SemesterCodes.Items.Insert(0, new ListItem("--Please Select Semester Code--", ""));
                SemesterCodes.SelectedIndex = 0;

                //var studentID = (int)Session["StudentID"];

                //gridRequiredCourses.DataSource = Procedures.ViewRequiredCourses(studentID, semesterCodes[0]);
                //gridRequiredCourses.DataBind();
            }
            
        }

        protected void SemesterCodes_SelectedIndexChanged(object sender, EventArgs e)
        {
            var semesterCode = SemesterCodes.SelectedItem.Value as string;
            if (!string.IsNullOrEmpty(semesterCode))
            {
                gridRequiredCourses.DataSource = Procedures.ViewRequiredCourses(StudentID, semesterCode);
                gridRequiredCourses.DataBind();
                gridRequiredCourses.Visible = true;
            }
            else
            {
                gridRequiredCourses.Visible = false;
            }
        }
    }
}