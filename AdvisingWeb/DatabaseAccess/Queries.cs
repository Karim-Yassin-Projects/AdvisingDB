using AdvisingWeb.Students;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

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

        public static List<ListItem> GetCourses()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SELECT course_id, course_name FROM Course";
                    command.CommandType = CommandType.Text;


                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        var result = new List<ListItem>
                        {
                            new ListItem("--Please select a course--", "")
                            {
                                Value = "",
                            }
                        };

                        while (reader.Read())
                        {
                            result.Add(new ListItem(reader.GetString(1), reader.GetInt32(0).ToString()));
                        }
                        return result;
                    }
                }
            }
        }

        public static int? GetAdvisorId(int studentID)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SELECT advisor_id FROM Student WHERE student_id=@studentID";
                    command.CommandType = CommandType.Text;

                    command.Parameters.AddWithValue("@studentID", studentID);

                    var value = command.ExecuteScalar();
                    return value is int ? (int?)value : null;
                }
            }
        }

        public static DataTable GetCurrentCourses(int studentID)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText =
                        @"SELECT sict.course_id, sict.semester_code, c.course_name, sict.instructor_id, i.instructor_name
                          FROM Student_Instructor_Course_Take sict
                          INNER JOIN Course c ON c.course_id = sict.course_id
                          INNER JOIN Instructor i ON sict.instructor_id = i.instructor_id
                          WHERE sict.student_id=@studentID
                          AND sict.grade IS NULL";
                    command.CommandType = CommandType.Text;

                    command.Parameters.AddWithValue("@studentID", studentID);

                    using (var reader = command.ExecuteReader())
                    {
                        var dataTable = new DataTable();
                        dataTable.Load(reader);
                        return dataTable;
                    }
                }
            }
        }

        public static List<ListItem> GetCourseInstructors(int courseID, int instructorId)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText =
                        @"SELECT ic.instructor_id, i.instructor_name
                        FROM Instructor_Course ic 
                        INNER JOIN Instructor i ON ic.instructor_id = i.instructor_id
                        WHERE ic.course_id = @courseId AND ic.instructor_id <> @instructorId
                        ";
                    command.CommandType = CommandType.Text;

                    command.Parameters.AddWithValue("@courseId", courseID);
                    command.Parameters.AddWithValue("@instructorId", instructorId);

                    using (var reader = command.ExecuteReader())
                    {
                        var list = new List<ListItem>
                        {
                            new ListItem("--Please select new instructor--", "")
                        };
                        while (reader.Read())
                        {
                            list.Add(new ListItem(reader.GetString(1), reader.GetInt32(0).ToString()));
                        }
                        return list;
                    }
                }
            }
        }
    }
}