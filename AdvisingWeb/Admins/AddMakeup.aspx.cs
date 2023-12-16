using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

namespace AdvisingWeb.Admins
{
    public partial class AddMakeup : AdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void AddButtonClick(object sender, EventArgs e)
        {
            string s = WebConfigurationManager.ConnectionStrings["AdvisingDB"].ToString();

            SqlConnection conn = new SqlConnection(s);

            SqlCommand addproc = new SqlCommand("Procedures_AdminAddExam", conn);

            addproc.CommandType = CommandType.StoredProcedure;

            string type1 = ExamType.SelectedValue;
            DateTime exam_date = DateTime.Parse(Date.Text);
            int courseid = int.Parse(CourseId.Text);

            addproc.Parameters.Add(new SqlParameter("@Type ", type1));
            addproc.Parameters.Add(new SqlParameter("@date ", exam_date));
            addproc.Parameters.Add(new SqlParameter("@course_id ", courseid));

            conn.Open();
            addproc.ExecuteNonQuery();
            FormPanel.Visible = false;
            ResultPanel.Visible = true;
            conn.Close();
        }
    }
}