using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace STT.Models
{
    public class Exercise
    {
        private long id;
        private DateTime deadline;
        public Exercise()
        {
            id = 0;
            deadline = DateTime.Today;
        }
        public Exercise(long id, DateTime deadline)
        {
            this.id = id;
            this.deadline = deadline;
        }


    }
}