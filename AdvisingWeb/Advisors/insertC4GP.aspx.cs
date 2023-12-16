using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shalProj
{
    public partial class insertC4GP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void insert(object sender, EventArgs e)
        {

            string ConnectionString = WebConfigurationManager.ConnectionStrings["shalProj"].ToString();
            SqlConnection conn = new SqlConnection(ConnectionString);

            SqlCommand cmd = new SqlCommand("[Procedures_AdvisorAddCourseGP]", conn);
           
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add("@student_id", Int32.Parse(TextBox1.Text));
            cmd.Parameters.Add("@Semester_code", TextBox2.Text);
            cmd.Parameters.Add("@course_name", TextBox3.Text);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

        }
    }
}