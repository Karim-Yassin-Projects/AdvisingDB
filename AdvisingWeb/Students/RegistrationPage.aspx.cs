using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using AdvisingWeb.DatabaseAccess;

namespace AdvisingWeb.Students
{
    public partial class RegistrationPage : System.Web.UI.Page
    {
        private static readonly string connectionString = ConfigurationManager.ConnectionStrings["AdvisingDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Register(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            var studentRegistration = new StudentRegistration
            {
                FirstName = FirstName.Text,
                LastName = LastName.Text,
                Email = Email.Text,
                Password = Password.Text,
                Faculty = Faculty.Text,
                Major = Major.Text,
                Semester = int.Parse(Semester.Text),
            };

            int studentId = Procedures.RegisterStudent(studentRegistration);
            StudentIDLabel.Text = studentId.ToString();
            FormPanel.Visible = false;
            ResultPanel.Visible = true;
            Session["StudentID"] = studentId;
        }

    }
}