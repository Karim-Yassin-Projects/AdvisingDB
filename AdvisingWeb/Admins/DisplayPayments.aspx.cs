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
    public partial class DisplayPayments : AdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string s = WebConfigurationManager.ConnectionStrings["AdvisingDB"].ConnectionString.ToString();
            SqlConnection con = new SqlConnection(s);
            SqlCommand cmd = new SqlCommand("Select * from Advisors_Graduation_Plan", con);
            cmd.CommandType = CommandType.Text;


            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();


            if (dr.HasRows)
            {
                gridView.AutoGenerateColumns = true;
                gridView.DataSource = dr;
                gridView.DataBind();
            }
            else
            {
                ResultPanel.Visible = true;
            }

            dr.Close();
            con.Close();
        }
    }
}