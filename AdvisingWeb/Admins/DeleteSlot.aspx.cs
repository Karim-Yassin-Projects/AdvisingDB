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
    public partial class DeleteSlot : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void DeleteButtonClick(object sender, EventArgs e)
        {
            string s = WebConfigurationManager.ConnectionStrings["AdvisingDB"].ConnectionString.ToString();

            SqlConnection conn = new SqlConnection(s);

            SqlCommand deleteproc = new SqlCommand("Procedures_AdminDeleteSlots", conn);

            deleteproc.CommandType = CommandType.StoredProcedure;

            string semestercode = SemesterCode.Text;

            deleteproc.Parameters.Add(new SqlParameter("@current_semester", semestercode));



            conn.Open();
            
            deleteproc.ExecuteNonQuery();
            FormPanel.Visible = false;
            ResultPanel.Visible = true;
            conn.Close();
        }
    }
}