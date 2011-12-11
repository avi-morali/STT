using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace STT.Models
{
    public class Schedule
    {

        private int[][] table;
        private long Student_ID;

        public Schedule()
        {
            this.table = new int[14][];
            for (int i = 0; i < 14; i++)
            {
                table[i] = new int[6];
            }
            Student_ID = -1;
        }
        public Schedule(long id, int rows)
        {
            this.table = new int[rows][];
            for (int i = 0; i < rows; i++)
            {
                table[i] = new int[6];
            }
            Student_ID = id;
        }

    }
}