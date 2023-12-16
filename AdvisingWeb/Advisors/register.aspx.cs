using System;
using System.Collections.Generic;
using System.ComponentModel.Design.Serialization;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shalProj
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void register_button(object sender, EventArgs e)
        {
            if (TextBox1.Text != "" && TextBox2.Text != "" && TextBox4.Text != "" && TextBox4.Text != "")
            {
                string ConnectionString = WebConfigurationManager.ConnectionStrings["shalProj"].ToString();
                SqlConnection connection = new SqlConnection(ConnectionString);

                String ad = TextBox1.Text;
                String pass = TextBox1.Text;
                String email = TextBox1.Text;
                String office = TextBox1.Text;

                SqlCommand cmd = new SqlCommand("[Procedures_AdvisorRegistration]", connection);

                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                
                cmd.Parameters.AddWithValue("@advisor_name", ad);
                cmd.Parameters.AddWithValue("@password", pass);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@office", office);

                SqlParameter advisorId = cmd.Parameters.Add("@Advisor_id", System.Data.SqlDbType.Int);
                advisorId.Direction = ParameterDirection.Output;
                try
                {
                    connection.Open();
                    cmd.ExecuteNonQuery();

                    if (advisorId.Value != null)
                    {
                        Response.Redirect("home.aspx");
                    }
                    else
                    {
                        Response.Write("Error");
                    }


                }

                catch (SqlException ex)
                {
                    Response.Write("error regestration:" + ex.Message);
                }
                finally
                {
                    connection.Close();
                }

            }

            else
            {
                Response.Write("FILL THE EMPTY FIELDS");
            }
            }
        

        protected void login_button(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

    }
}