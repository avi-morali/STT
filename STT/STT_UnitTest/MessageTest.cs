using STT.Models;
using System;
using NUnit.Framework;

namespace STT_UnitTest
{

    [TestFixture]
    public class MessageTest
    {

        [Test]
        public void MessageConstructorTest()
        {
            int id = 0;
            string content = "";
            string date = DateTime.Today.ToString();
           /*Message tar1 = new Message(id, content, date);
            Message tar2 = new Message();
            Assert.AreEqual(tar1.getId(), tar2.getId(),"fail id");
            Assert.AreEqual(tar1.getContent(), tar2.getContent(), "fail content");
            Assert.AreEqual(tar1.getDate(), tar2.getDate(), "fail date");*/
        }

    }
}
