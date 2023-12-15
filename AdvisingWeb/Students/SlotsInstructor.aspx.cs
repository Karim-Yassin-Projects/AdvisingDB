using AdvisingWeb.DatabaseAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingWeb.Students
{
    public partial class SlotsInstructor : StudentPage
    {
        private DataTable currentCourses;
        protected void Page_Load(object sender, EventArgs e)
        {
            currentCourses = Queries.GetCurrentCourses(StudentID);
            if (!IsPostBack)
            {
                CourseID.DataSource = currentCourses;
                CourseID.DataValueField = "course_id";
                CourseID.DataTextField = "course_name";
                CourseID.DataBind();

                CourseID.Items.Insert(0, new ListItem("--please select a course--", ""));
            }
        }

        protected void courseID_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (CourseID.SelectedValue == "")
            {
                InstructorChoicePanel.Visible = false;
                gridSlotsInstructor.Visible = false;
                return;
            }
            
            var courseId = int.Parse(CourseID.SelectedValue);
            InstructorChoicePanel.Visible = true;

            var instructors = Queries.GetCourseInstructors(courseId);
            InstructorId.DataValueField = "Value";
            InstructorId.DataTextField = "Text";
            InstructorId.DataSource = instructors;
            InstructorId.DataBind();
            InstructorId.SelectedIndex = 0;
        }

        protected void InstructorId_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (CourseID.SelectedValue == "" || InstructorId.SelectedValue == "")
            {
                gridSlotsInstructor.Visible = false;
                return;
            }
            var courseId = int.Parse(CourseID.SelectedValue);
            var instructorId = int.Parse(InstructorId.SelectedValue);
            gridSlotsInstructor.Visible = true;
            gridSlotsInstructor.DataSource = Functions.ViewSlotsandInstructor(courseId, instructorId);
            gridSlotsInstructor.DataBind();
        }
    }
}
