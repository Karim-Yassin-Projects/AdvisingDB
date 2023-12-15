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

        public static DataTable ViewAvailableCourses(string currentSemesterCode)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SELECT * FROM dbo.FN_SemsterAvailableCourses(@semester_code)";
                    command.CommandType = CommandType.Text;
                    command.Parameters.AddWithValue("@semester_code", currentSemesterCode);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {

                        DataTable dt = new DataTable();
                        dt.Load(reader);

                        return dt;
                    }
                }
            }
        }

        public static DataTable ViewGradPlan(int studentId)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SELECT * FROM dbo.FN_StudentViewGP(@studentID)";
                    command.CommandType = CommandType.Text;
                    command.Parameters.AddWithValue("@studentID", studentId);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {

                        DataTable dt = new DataTable();
                        dt.Load(reader);

                        return dt;
                    }
                }
            }
        }

        public static DateTime? ViewUpcomingInstallment(int studentId)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SELECT dbo.FN_StudentUpcoming_Installment(@student_id)";
                    command.CommandType = CommandType.Text;
                    command.Parameters.AddWithValue("@student_id", studentId);
                    var result = command.ExecuteScalar();
                    return result is DateTime ? (DateTime?)result : null;
                }
            }
        }

        public static bool AdminLogin(int adminID, string password)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SELECT dbo.FN_AdminLogin(@adminId, @password)";
                    command.CommandType = CommandType.Text;

                    command.Parameters.AddWithValue("@adminId", adminID);
                    command.Parameters.AddWithValue("@password", password);

                    return (bool)command.ExecuteScalar();
                }
            }
        }

        public static bool CheckSecondMakeupEligibility(int studentId, int courseId)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SELECT dbo.FN_StudentCheckSMEligiability(@studentId, @courseId)";
                    command.CommandType = CommandType.Text;

                    command.Parameters.AddWithValue("@studentId", studentId);
                    command.Parameters.AddWithValue("@courseId", courseId);

                    return (bool)command.ExecuteScalar();
                }
            }
        }

        public static DataTable ViewSlotsandInstructor(int courseId, int instructorId)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SELECT * FROM dbo.FN_StudentViewSlot(@courseId, @instructorId)";
                    command.CommandType = CommandType.Text;
                    command.Parameters.AddWithValue("@courseId", courseId);
                    command.Parameters.AddWithValue("@instructorId", instructorId);

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