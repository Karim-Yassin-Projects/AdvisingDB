﻿using AdvisingWeb.DatabaseAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingWeb.Students
{
    public partial class SlotCourseInstructor : StudentPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            gridSlotCourses.DataSource = Views.ViewSlotsCoursesInstructor();
            gridSlotCourses.DataBind();
        }
    }
}