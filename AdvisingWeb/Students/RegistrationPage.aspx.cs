using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

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

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string fname = FirstName.Text;
                string lname = LastName.Text;
                string pass = Password.Text;
                string faculty = Faculty.Text;
                string email = Email.Text;
                string major = Major.Text;
                int sem = Int16.Parse(Semester.Text);

                using (SqlCommand SRegistrationProc = new SqlCommand("Procedures_StudentRegistration", conn))
                {
                    SRegistrationProc.CommandType = CommandType.StoredProcedure;
                    SRegistrationProc.Parameters.Add(new SqlParameter("@first_name", fname));
                    SRegistrationProc.Parameters.Add(new SqlParameter("@last_name", lname));
                    SRegistrationProc.Parameters.Add(new SqlParameter("@password", pass));
                    SRegistrationProc.Parameters.Add(new SqlParameter("@faculty", faculty));
                    SRegistrationProc.Parameters.Add(new SqlParameter("@email", email));
                    SRegistrationProc.Parameters.Add(new SqlParameter("@major", major));
                    SRegistrationProc.Parameters.Add(new SqlParameter("@semester", sem));

                    SqlParameter Student_id = SRegistrationProc.Parameters.Add("@Student_id", SqlDbType.Int);
                    Student_id.Direction = ParameterDirection.Output;

                    SRegistrationProc.ExecuteNonQuery();
                    Response.Write("You have succesfully registered. Your Student ID is: " + Student_id.Value.ToString());
                    Response.Redirect("LoginPage.aspx");

                }
            }

        }

    }
}