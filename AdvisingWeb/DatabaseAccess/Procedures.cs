using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AdvisingWeb.DatabaseAccess
{
    public class Procedures
    {
        private static readonly string connectionString = ConfigurationManager.ConnectionStrings["AdvisingDB"].ConnectionString;

       

        public static DataTable ViewOptionalCourses(int studentID, string currentSemesterCode)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "Procedures_ViewOptionalCourse";
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@studentID", studentID);
                    command.Parameters.AddWithValue("@currentSemesterCode", currentSemesterCode);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {

                        DataTable dt = new DataTable();
                        dt.Load(reader);

                        return dt;
                    }
                }
            }
        }

        public static DataTable ViewRequiredCourses(int studentID, string currentSemesterCode)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "Procedures_ViewRequiredCourses";
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@studentID", studentID);
                    command.Parameters.AddWithValue("@currentSemesterCode", currentSemesterCode);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {

                        DataTable dt = new DataTable();
                        dt.Load(reader);

                        return dt;
                    }
                }
            }
        }
    }
}