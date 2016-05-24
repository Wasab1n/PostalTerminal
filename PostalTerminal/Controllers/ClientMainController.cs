using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PostalTerminal.Controllers
{
    public class ClientMainController : Controller
    {
        // GET: ClientMain
        public ActionResult MainClientView()
        {
            return View("MainClientView");
        }




    }
}