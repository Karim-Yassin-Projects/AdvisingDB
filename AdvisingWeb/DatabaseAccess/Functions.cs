using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace AdvisingWeb.DatabaseAccess
{
    public class Functions
    {
        private static readonly string connectionString = ConfigurationManager.ConnectionStrings["AdvisingDB"].ConnectionString;

        public static bool StudentLogin(int studentID, string password)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SELECT dbo.FN_StudentLogin(@studentID, @password)";
                    command.CommandType = CommandType.Text;

                    command.Parameters.AddWithValue("@studentID", studentID);
                    command.Parameters.AddWithValue("@password", password);

                    return (bool) command.ExecuteScalar();
                }
            }
        }
    }
}