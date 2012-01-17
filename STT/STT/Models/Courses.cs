using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace STT.Models
{
    public class Courses
    {
        public int ID;
        public string Name;
        public int Lecturer;
        public int Day; // Default = 0, Sun = 1, Mon = 2, Tue = 3, Wed = 4, Thu = 5, Fri = 6
        public int Start_time, duration;
        public int message_id;
        public bool is_lecture;
        public Message _message;
        public Exercise _exercise;
        public string Class_Room;


        public Courses()
        {
            ID = -1;
            Name = "None";
            Lecturer = -1;
            Day = 0;
            Start_time = 0;
            duration = 0;
            _message = new Message();
            _exercise = new Exercise();
        }
        
        public Courses(int TimeId)
        {
            DateTime d_today = DateTime.Now;
            d_today = d_today.AddDays(-3);
            string myDate = d_today.ToString("MM/dd/yyyy");
            SqlDataReader reader;
            DBConnection connection = new DBConnection();
            string sql_command;
           
            // Load the course details.
            sql_command = "SELECT * FROM Courses A, CourseTimes B WHERE B.id = " + TimeId + " AND A.id = B.courseId;";
            reader = connection.queryExecute(sql_command);
            reader.Read();
            ID = Convert.ToInt32(reader[0].ToString());
            Name = (string)reader[1];
            Class_Room = (string)reader[12];
            Lecturer = Convert.ToInt32(reader[2]);
            DateTime first_hour = DateTime.Parse("08:00");
            DateTime course_hour = DateTime.Parse((string)reader[10]);
            Start_time = course_hour.Subtract(first_hour).Hours;// (string)reader[10];
            duration = Convert.ToInt32(reader[11]);
            Day = Convert.ToInt32(reader[9]);
            if (Convert.ToInt32(reader[4]) == -1)
                is_lecture = false;
            else
                is_lecture = true;
            reader.Close();
            
            // Load the message of this course.
            sql_command = "SELECT id FROM Messages WHERE " + ID + "= courseID and publishDate >= '" + myDate + "' ORDER BY id DESC;";
            reader = connection.queryExecute(sql_command);
            if (reader.Read())
            {
                message_id = Convert.ToInt32(reader["id"]);
                _message = new Message(message_id);
            }
            reader.Close();

            // Load the exercise of this course.
            _exercise = new Exercise();

        }

    }

}