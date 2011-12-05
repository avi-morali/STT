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
            Date = DateTime.Now;
        }

        public Message(int id, string content, string date)
        {
            IFormatProvider fp = new System.Globalization.CultureInfo("en-US");

            Id = id;
            Content = content;
            Date = DateTime.ParseExact(date, "MM/dd/yyyy", fp);

        }

        public void printMessage()
        {
        }
    }
}