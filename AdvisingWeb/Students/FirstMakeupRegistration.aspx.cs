﻿using AdvisingWeb.DatabaseAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingWeb.Students
{
    public partial class FirstMakeupRegistration : StudentPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var semesterCodes = Queries.GetSemesterCodes();
                SemesterCodes.DataSource = semesterCodes;
                SemesterCodes.DataBind();

                SemesterCodes.Items.Insert(0, new ListItem("--Please select semester code--", ""));
            }
        }

        protected void SemesterCodes_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (SemesterCodes.SelectedValue == "")
            {
                CourseSelectionPanel.Visible = false;
            }
            else
            {
                CourseSelectionPanel.Visible = true;
                var courses = Queries.GetCurrentCoursesBySemesterCode(StudentID, SemesterCodes.SelectedValue);
                CourseID.DataTextField = "course_name";
                CourseID.DataValueField = "course_id";
                CourseID.DataSource = courses;
                CourseID.DataBind();
                CourseID.Items.Insert(0, new ListItem("--Please select a course--", ""));

            }
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }
            var courseId = int.Parse(CourseID.SelectedValue);
            var semesterCode = SemesterCodes.SelectedValue;

            var result = Procedures.RegisterForFirstMakeup(StudentID, courseId, semesterCode);
            CourseSelectionPanel.Visible = false;
            SemesterCodesPanel.Visible = false;
            Success.Visible = result;
            Failure.Visible = !result;
        }
    }
}