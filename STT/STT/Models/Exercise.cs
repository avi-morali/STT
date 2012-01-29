using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace STT.Models
{
    public class Exercise : Message
    {
        private DateTime deadline;
        public Exercise(string due_date, int c_id)
        {
            SqlDataReader reader;
            DBConnection connection = new DBConnection();
            string sql_command = "SELECT * FROM Exercises WHERE '" + due_date + "' = dueDate AND courseID = " + c_id + ";";
            reader = connection.queryExecute(sql_command);
            if (reader.Read())
            {
                deadline = Convert.ToDateTime(reader["dueDate"]);
                ID = (int)reader["id"];
                Content = (string)reader["_content"];
                subject = (string)reader["subject"];
                Date = Convert.ToDateTime(reader["publishDate"]);
                reader.Close();
            }
            else
            {
                this.ID = -1;
            }


        }


    }
}