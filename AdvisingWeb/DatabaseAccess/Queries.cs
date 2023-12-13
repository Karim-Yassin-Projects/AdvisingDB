using AdvisingWeb.Students;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace AdvisingWeb.DatabaseAccess
{

    public class Queries
    {
        private static readonly string connectionString = ConfigurationManager.ConnectionStrings["AdvisingDB"].ConnectionString;

        public static List<string> GetSemesterCodes()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SELECT semester_code FROM Semester";
                    command.CommandType = CommandType.Text;

                    var result = new List<string>();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while(reader.Read())
                        {
                            result.Add(reader.GetString(0));
                        }
                    }
                    return result;
                }
            }
        }

        public static string GetStudentFirstName(int studentID)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SELECT f_name FROM Student WHERE student_id=@studentID";
                    command.CommandType = CommandType.Text;

                    command.Parameters.AddWithValue("@studentID", studentID);

                    return (string)command.ExecuteScalar();
                }
            }
        }
    }
}