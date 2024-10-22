﻿using AdvisingWeb.DatabaseAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingWeb.Students
{
    public partial class Students : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsCallback)
            {
                if (Session["StudentID"] != null)
                {
                    var studentId = (int)Session["StudentID"];
                    StudentIDLabel.Text = studentId.ToString();
                    StudentNameLabel.Text = Queries.GetStudentFirstName(studentId);

                }
            }
        }

        protected void LogOutClick(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/");
        }
    }
}