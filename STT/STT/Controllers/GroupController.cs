using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using STT.Models;

namespace STT.Controllers
{
    public class GroupController : Controller
    {
        //
        // GET: /Group/

        public ActionResult Index()
        {
            Schedule sc = new Schedule(1210,14);
            return View(sc);
        }

    }
}
