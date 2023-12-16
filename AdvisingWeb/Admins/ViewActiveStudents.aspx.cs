using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvisingWeb.Admins;

namespace AdvisingWeb.Admins
{
    public partial class ViewActiveStudents : AdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["AdvisingDB"].ConnectionString;

           
            string query = "SELECT * FROM view_Students";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);

                        
                        ourgrid1.DataSource = dataTable;
                        ourgrid1.DataBind();
                    }
                }
            }

        }

    }
}