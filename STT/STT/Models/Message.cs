using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace STT.Models
{
    public class Message
    {
        protected int ID;
        protected string Content;
        protected DateTime Date;
        protected string subject;

        public Message()
        {
            ID = 0;
            Content = "";
            Date = DateTime.Today;
        }

        public Message(int id)
        {
            SqlDataReader reader;
            DBConnection connection = new DBConnection();
            
            ID = id;
            string sql_command = "SELECT *  FROM Messages WHERE "+ID+" = id";
            reader = connection.queryExecute(sql_command);
            reader.Read();
            subject = (string)reader["subject"];
            Content = (string)reader["_content"];
            Date = Convert.ToDateTime(reader["publishDate"]);
            reader.Close();
        }

        public int getId() { return ID; }
        public String getContent() { return Content; }
        public String getSubject() { return subject; }
        public DateTime getDate() { return Date; }
        
    }    
}