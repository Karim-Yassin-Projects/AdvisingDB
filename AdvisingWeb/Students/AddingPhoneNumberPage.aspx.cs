using AdvisingWeb.DatabaseAccess;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvisingWeb.Students
{
    public partial class AddingPhoneNumberPage : StudentPage
    {
        private static readonly string connectionString = ConfigurationManager.ConnectionStrings["AdvisingDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void AddPhone(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }
            try
            {
                Procedures.AddMobileNumber(StudentID, PhoneNumber.Text);
                FormPanel.Visible = false;
                ResultPanel.Visible = true;
            }
            catch(SqlException sqlEx) 
            { 
                if (sqlEx.Message.Contains("PRIMARY KEY"))
                {
                    FormPanel.Visible = false;
                    ResultPanel.Visible = false;
                    ErrorPanel.Visible = true;
                }
                else
                {
                    throw;
                }
            }
            
        }
    }
}