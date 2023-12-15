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
    public partial class ChooseInstructorPage : StudentPage
    {
        private DataTable currentCourses;

        protected override void OnInit(EventArgs e)
        {

            base.OnInit(e);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            currentCourses = Queries.GetCurrentCourses(StudentID);
            if (!IsPostBack)
            {
                courseID.DataSource = currentCourses;
                courseID.DataValueField = "course_id";
                courseID.DataTextField = "course_name";
                courseID.DataBind();

                courseID.Items.Insert(0, new ListItem("--please select a course--", ""));
            }
        }

        protected void courseID_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (courseID.SelectedIndex == 0)
            {
                NoAvailableInstructors.Visible = false;
                InstructorChoicePanel.Visible = false;
                return;
            }

            var courseId = int.Parse(courseID.SelectedValue);
            var row = currentCourses.Rows
                .Cast<DataRow>()
                .Where(r => (int)r["course_id"] == courseId)
                .FirstOrDefault();
            CurrentInstructorLabel.Text = row["instructor_name"].ToString();
            var instructorId = (int)row["instructor_id"];
            var otherInstructors = Queries.GetCourseInstructors(courseId, instructorId);
            if (otherInstructors.Count == 1)
            {
                NoAvailableInstructors.Visible = true;
                InstructorChoicePanel.Visible = false;
            }
            else
            {
                newInstructorId.DataSource = otherInstructors;
                newInstructorId.DataValueField = "Value";
                newInstructorId.DataTextField = "Text";
                newInstructorId.DataBind();
                NoAvailableInstructors.Visible = false;
                InstructorChoicePanel.Visible = true;
            }
        }

        protected void ChangeInstructorButton_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }
            var courseId = int.Parse(courseID.SelectedValue);
            var row = currentCourses.Rows
                .Cast<DataRow>()
                .Where(r => (int)r["course_id"] == courseId)
                .FirstOrDefault();
            var currentSemesterCode = (string)row["semester_code"];
            var instructorId = int.Parse(newInstructorId.SelectedValue);

            Procedures.ChooseInstructor(StudentID, courseId, instructorId, currentSemesterCode);
            ChooseCourse.Visible = false;
            InstructorChoicePanel.Visible = false;
            Success.Visible = true;
        }
    }
}