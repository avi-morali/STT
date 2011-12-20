using STT.Models;
using System;
using NUnit.Framework;

namespace STT_UnitTest
{
    [TestFixture]
    public class ScheduleTest
    {

        [Test]
        public void ScheduleConstructorTest()
        {
            long id = -1;
            int rows = 14;
            Schedule tar1 = new Schedule(id, rows);
            Schedule tar2 = new Schedule();
            Assert.AreEqual(tar1.Student_ID,tar2.Student_ID,"fail id");
            Assert.AreEqual(tar1.table, tar2.table, "fail table");
        }

    }
}

