﻿using AdvisingWeb.DatabaseAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingWeb.Students
{
    public partial class OptionalCoursesPage : StudentPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                var semesterCodes = Queries.GetSemesterCodes();
                SemesterCodes.DataSource = semesterCodes;
                SemesterCodes.DataBind();

                SemesterCodes.Items.Insert(0, new ListItem("--Please Select Semester Code--", ""));
                SemesterCodes.SelectedIndex = 0;

                
            }
        }

        protected void SemesterCodes_SelectedIndexChanged(object sender, EventArgs e)
        {
            var semesterCode = SemesterCodes.SelectedItem.Value as string;
            if (!string.IsNullOrEmpty(semesterCode))
            {
                gridOptionalCourses.DataSource = Procedures.ViewOptionalCourses(StudentID, semesterCode);
                gridOptionalCourses.DataBind();
                gridOptionalCourses.Visible = true;
            }
            else
            {
                gridOptionalCourses.Visible = false;
            }
            
        }
    }
}