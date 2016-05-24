//using PostalTerminal.Models;
//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.Mvc;

//namespace PostalTerminal.Controllers
//{
//    public class MainController : Controller
//    {
//        //
//        // GET: /Main/
//        public ActionResult postalTerminalView()
//        {
//            // Load the data for the client
//            var terminals = PostalTerminal.GetPostalTerminals();

//            // Return the view.
//            return View(terminals);
//        }


//        public ActionResult getDeliveries(int id)
//        {

//            var delivery = Delivery.GetDelivery(id);

//            return View(delivery);
//        }

//        public ActionResult handlerView()
//        {
//            return View("HandlerView");
//        }

//        public ActionResult AllDeliveriesView()
//        {
//            var delivery = Delivery.getDeliveryList();

//            return View(delivery);
//        }

//        public ActionResult ChangeDeliveryState(int id)
//        {

//            return View();
//        }



//        public void viewDeliveryListByCategory()
//        {
//            // ???
//        }
//        public void sendStatusUpdate()
//        {
//            //  SEND STATUS 
//        }

//        public void selectPostalTerminal()
//        {

//        }
//    }
//}