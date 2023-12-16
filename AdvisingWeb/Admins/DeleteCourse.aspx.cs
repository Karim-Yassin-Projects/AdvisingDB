using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingWeb.Admins
{
    public partial class DeleteCourse : AdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void DeleteButtonClick(object sender, EventArgs e)
        {
            string s = WebConfigurationManager.ConnectionStrings["AdvisingDB"].ConnectionString.ToString();

            SqlConnection conn = new SqlConnection(s);

            SqlCommand deleteproc = new SqlCommand("Procedures_AdminDeleteCourse", conn);

            deleteproc.CommandType = CommandType.StoredProcedure;

            int courseid = int.Parse(CourseId.Text);

            deleteproc.Parameters.Add(new SqlParameter("@courseID", courseid));



            conn.Open();
            try
            {
                deleteproc.ExecuteNonQuery();
                FormPanel.Visible = false;
                ResultPanel.Visible = true;
            }
            catch
            {
                FormPanel.Visible = false;
                ErrorPanel.Visible = true;
            }
            conn.Close();
        }

    }
}