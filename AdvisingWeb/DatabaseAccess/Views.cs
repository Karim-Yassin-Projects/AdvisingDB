using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;

namespace AdvisingWeb.DatabaseAccess
{
    public class Views
    {
        private static readonly string connectionString = ConfigurationManager.ConnectionStrings["AdvisingDB"].ConnectionString;
        public static DataTable ViewCoursesandExams()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SELECT * FROM Courses_MakeupExams";
                    command.CommandType = CommandType.Text;
                    using (SqlDataReader reader = command.ExecuteReader())
                    {

                        DataTable dt = new DataTable();
                        dt.Load(reader);

                        return dt;
                    }

                }
            }
        }

        public static DataTable ViewPendingRequests()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SELECT * FROM all_Pending_Requests";
                    command.CommandType = CommandType.Text;
                    using (SqlDataReader reader = command.ExecuteReader())
                    {

                        DataTable dt = new DataTable();
                        dt.Load(reader);

                        return dt;
                    }

                }
            }
        }

        public static DataTable ViewPrerequisites()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SELECT * FROM view_Course_prerequisites";
                    command.CommandType = CommandType.Text;
                    using (SqlDataReader reader = command.ExecuteReader())
                    {

                        DataTable dt = new DataTable();
                        dt.Load(reader);

                        return dt;
                    }

                }
            }
        }

        public static DataTable ViewSlotsCoursesInstructor()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SELECT * FROM Courses_Slots_Instructor";
                    command.CommandType = CommandType.Text;
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