using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace STT.Models
{
    public class Schedule
    {

        public int[][] int_table;
        public Courses[][] c_table;
        public long Student_ID;
        public string Student_Name;
        public string info; 
        public long[] course_array;
        public int start_time;
        public int end_time;

        public Schedule()
        {
            this.int_table = new int[14][];
            this.c_table = new Courses[14][];
            for (int i = 0; i < 14; i++)
            {
                int_table[i] = new int[6];
                c_table[i] = new Courses[6];
           }
            Student_ID =  1210;
            Student_Name = "אבי מורלי";
        }
        public Schedule(long id,  int rows)
        {
            int i,j;
            Courses temp;
            Student_ID = id;
            Student_Name = "אבי מורלי";
            SqlDataReader reader;
            DBConnection connection = new DBConnection();
            string today = DateTime.Today.ToString("MM/dd/yyyy");
            string sql_command;
            this.int_table = new int[rows][];
            this.c_table = new Courses[rows][];
            for (i = 0; i < rows; i++)
            {
                int_table[i] = new int[6];
                c_table[i] = new Courses[6];
            }

            for (i = 0; i < rows; i++)
                for (j = 0; j < 6; j++)
                    int_table[i][j] = 0;

            sql_command = "SELECT B.*, C.* FROM Studies A, CourseTimes B, Courses C WHERE A.CourseTimesID = B.id"
                + " AND C.id = B.courseID AND " + Student_ID + " = A.studentID AND '" + today + "' >= C.startDate AND '"
                + today + "' <= C.endDate";
            reader = connection.queryExecute(sql_command);
            
            DateTime temp_min = DateTime.Parse("23:00");
            DateTime temp_max = DateTime.Parse("00:00");

            while (reader.Read())
            {
                DateTime course_hour = DateTime.Parse((string)reader[3]);
                temp = new Courses((int)reader[0]);
                if (temp_min.Subtract(course_hour).Hours > 0)
                    temp_min = course_hour;
                if (temp_max.Subtract(course_hour.AddHours(temp.duration)).Hours < 0)
                    temp_max = course_hour.AddHours(temp.duration);
                
                c_table[temp.Start_time][temp.Day - 1] = temp;
                int_table[temp.Start_time][temp.Day - 1] = temp.duration;
                for (i=1;i<temp.duration;i++)
                     int_table[temp.Start_time + i][temp.Day - 1] = -1;
            }
            start_time = temp_min.Subtract(DateTime.Parse("08:00")).Hours;
            end_time = temp_max.Subtract(DateTime.Parse("08:00")).Hours -1;
            reader.Close();
        }

    }
}