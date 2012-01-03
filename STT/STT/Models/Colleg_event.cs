using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace STT.Models
{
    public class Colleg_event : Message 
    {
        private long id;
        private DateTime event_date;
        private int lenth;

        public Colleg_event()
        {
            id = 0;
            event_date = DateTime.Today;
            lenth = 0;
        }
        public Colleg_event(long id, DateTime date)
        {
            this.id = id;
            this.event_date = date;
        }
        public Colleg_event(long id, DateTime date, int lenth)
        {
            this.id = id;
            this.event_date = date;
            this.lenth = lenth;
        }
    }
}