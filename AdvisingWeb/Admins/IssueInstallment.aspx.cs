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
    public partial class IssueInstallment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void UpdateButtonClick(object sender, EventArgs e)
        {
            string s = WebConfigurationManager.ConnectionStrings["AdvisingDB"].ConnectionString.ToString();

            SqlConnection conn = new SqlConnection(s);

            SqlCommand addproc = new SqlCommand("Procedures_AdminIssueInstallment", conn);

            addproc.CommandType = CommandType.StoredProcedure;

            string paymentid = PaymentId.Text;
          
            int payid = int.Parse(paymentid);

            addproc.Parameters.Add(new SqlParameter("@payment_id ", payid));
            




            conn.Open();
            try
            {
                addproc.ExecuteNonQuery();
                FormPanel.Visible = false;
                ResultPanel.Visible = true;
            }
            catch(Exception )
            {
                return;
            }
            conn.Close();

        }
    }
}