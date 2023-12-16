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
    public partial class UpdateStudentStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void UpdateButtonClick(object sender, EventArgs e)
        {
            string s = WebConfigurationManager.ConnectionStrings["AdvisingDB"].ToString();

            SqlConnection conn = new SqlConnection(s);

            SqlCommand addproc = new SqlCommand("Procedures_AdminUpdateStudentStatus", conn);

            addproc.CommandType = CommandType.StoredProcedure;

            string studentid = StudentId.Text;

            int studid = int.Parse(studentid);

            addproc.Parameters.Add(new SqlParameter("@student_id ", studid));





            conn.Open();
            try
            {
                addproc.ExecuteNonQuery();
                FormPanel.Visible = false;
                ResultPanel.Visible = true;
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
                return;
            }
            conn.Close();
        }
    }
}