using AdvisingWeb.Students;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Xml.Linq;

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

        public static DataTable MissingCourses(int studentID)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "Procedures_ViewMS";
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@studentID", studentID);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {

                        DataTable dt = new DataTable();
                        dt.Load(reader);

                        return dt;
                    }
                }
            }

        }

        public static int RegisterStudent(StudentRegistration studentRegistration)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "Procedures_StudentRegistration";
                    command.CommandType = CommandType.StoredProcedure;

                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter("@first_name", studentRegistration.FirstName));
                    command.Parameters.Add(new SqlParameter("@last_name", studentRegistration.LastName));
                    command.Parameters.Add(new SqlParameter("@password", studentRegistration.Password));
                    command.Parameters.Add(new SqlParameter("@faculty", studentRegistration.Faculty));
                    command.Parameters.Add(new SqlParameter("@email", studentRegistration.Email));
                    command.Parameters.Add(new SqlParameter("@major", studentRegistration.Major));
                    command.Parameters.Add(new SqlParameter("@semester", studentRegistration.Semester));
                    SqlParameter Student_id = command.Parameters.Add("@Student_id", SqlDbType.Int);
                    Student_id.Direction = ParameterDirection.Output;
                    command.ExecuteNonQuery();

                    return (int)Student_id.Value;
                }
            }
        }

        public static void AddMobileNumber(int studentID, string mobileNumber)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "Procedures_StudentaddMobile";
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter("@studentID", studentID));
                    command.Parameters.Add(new SqlParameter("@mobile_number", mobileNumber));
                    command.ExecuteNonQuery();

                }
            }
        }

        public static void SendingCourseRequest(int studentID, int courseID, string type, string comment)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "Procedures_StudentSendingCourseRequest";
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter("@studentID", studentID));
                    command.Parameters.Add(new SqlParameter("@courseID", courseID));
                    command.Parameters.Add(new SqlParameter("@type", type));
                    command.Parameters.Add(new SqlParameter("@comment", comment));

                    command.ExecuteNonQuery();

                }
            }
        }

        public static void SendingCHRequest(int studentID, int creditHours, string type, string comment)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "Procedures_StudentSendingCHRequest";
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter("@student_id", studentID));
                    command.Parameters.Add(new SqlParameter("@credit_hours", creditHours));
                    command.Parameters.Add(new SqlParameter("@type", type));
                    command.Parameters.Add(new SqlParameter("@comment", comment));

                    command.ExecuteNonQuery();

                }
            }
        }

        public static void ChooseInstructor(int studentID, int courseId, int instructorId, string semesterCode)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "Procedures_ChooseInstructor";
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter("@student_id", studentID));
                    command.Parameters.Add(new SqlParameter("@instructor_id", instructorId));
                    command.Parameters.Add(new SqlParameter("@course_id", courseId));
                    command.Parameters.Add(new SqlParameter("@curr_sem_code", semesterCode));
                    command.ExecuteNonQuery();
                }
            }
        }

        public static DataTable ListAdvisors()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "Procedures_AdminListAdvisors";
                    command.CommandType = CommandType.StoredProcedure;

                    using (SqlDataReader reader = command.ExecuteReader())
                    {

                        DataTable dt = new DataTable();
                        dt.Load(reader);

                        return dt;
                    }
                }
            }
        }

        public static DataTable ListStudentsWithAdvisors()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "AdminListStudentsWithAdvisors";
                    command.CommandType = CommandType.StoredProcedure;

                    using (SqlDataReader reader = command.ExecuteReader())
                    {

                        DataTable dt = new DataTable();
                        dt.Load(reader);

                        return dt;
                    }
                }
            }
        }

        public static bool RegisterForFirstMakeup(int studentId, int courseId, string semesterCode)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "Procedures_StudentRegisterFirstMakeup";
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@StudentID", studentId);
                    command.Parameters.AddWithValue("@CourseID", courseId);
                    command.Parameters.AddWithValue("@studentCurrentSemester", semesterCode);

                    return (int)command.ExecuteScalar() != 0;
                }
            }
        }

        public static (string message, bool success) RegisterForSecondMakeup(int studentId, int courseId, string semesterCode)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "Procedures_StudentRegisterSecondMakeup";
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@StudentID", studentId);
                    command.Parameters.AddWithValue("@CourseID", courseId);
                    command.Parameters.AddWithValue("@studentCurrentSemester", semesterCode);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            return (reader.GetString(0), reader.GetBoolean(1));
                        }

                        return ("Failed to register for second makeup", false);
                    }

                }
            }
        }

    }
}