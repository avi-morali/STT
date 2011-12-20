using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace STT.Models
{
    public class Message
    {
        private int Id;
        private string Content;
        private DateTime Date;

        public Message()
        {
            Id = 0;
            Content = "";
            Date = DateTime.Today;
        }

        public Message(int id, string content, string date)
        {

            Id = id;
            Content = content;
            Date = Convert.ToDateTime(date);

        }

        public void printMessage()
        {
        }

        public int getId() { return Id; }
        public String getContent() { return Content; }
        public DateTime getDate() { return Date; }
    }
}