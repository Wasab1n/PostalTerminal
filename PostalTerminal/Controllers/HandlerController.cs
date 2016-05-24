using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PostalTerminal.Models;

namespace PostalTerminal.Controllers
{
    public class HandlerController : Controller
    {
        private OperationDataContext context;
        public HandlerController()
        {
            context = new OperationDataContext();
        }

        public ActionResult Index()
        {
            IList<HandlerModel> handlerList = new List<HandlerModel>();
            var query = from PostalTerminalHandlers in context.PostalTerminalHandlers
                        select PostalTerminalHandlers;           

            var handlers = query.ToList();
            foreach (var handlerData in handlers)
            {
                handlerList.Add(new HandlerModel()
                {
                   


                    PostalTerminals_Id = handlerData.PostalTerminals_Id,
                    Handlers_User_id = handlerData.Handlers_User_id
                });
            }
            return View(handlerList);
        }       

        public ActionResult Create()
        {
            HandlerModel model = new HandlerModel();
            return View(model);
        }

        [HttpPost]
        public ActionResult Create(HandlerModel model)
        {
            try
            {
                PostalTerminalHandler handler = new PostalTerminalHandler()
                {

                    PostalTerminals_Id = model.PostalTerminals_Id,
                    Handlers_User_id = model.Handlers_User_id

                };
                context.PostalTerminalHandlers.InsertOnSubmit(handler);
                context.SubmitChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View(model);
            }
        }
    }
}
