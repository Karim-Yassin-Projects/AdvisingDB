using AdvisingWeb.DatabaseAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingWeb.Students
{
    public partial class SendingCourseRequestPage : StudentPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                var advisorId = Queries.GetAdvisorId(StudentID);
                if (advisorId == null)
                {
                    FormPanel.Visible = false;
                    ErrorPanel.Visible = true;
                }
                else
                {
                    var courses = Queries.GetCourses();
                    courseID.DataSource = courses;
                    courseID.DataBind();
                }
            }
        }
        protected void SendCourseRequest(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }
            Procedures.SendingCourseRequest(StudentID, int.Parse(courseID.SelectedItem.Value), "course", comment.Text);
            FormPanel.Visible = false;
            ResultPanel.Visible = true;
        }
    }
}
