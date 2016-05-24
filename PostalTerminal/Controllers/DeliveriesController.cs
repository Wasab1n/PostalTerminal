//using System;
//using System.Collections.Generic;
//using System.Data;
//using System.Data.Entity;
//using System.Linq;
//using System.Net;
//using System.Web;
//using System.Web.Mvc;
//using PostalTerminal.Models;

//namespace PostalTerminal.Controllers
//{
//    public class DeliveriesController : Controller
//    {
//        private DeliveryDBContext db = new DeliveryDBContext();

//        // GET: Deliveries
//        public ActionResult Index()
//        {
//            return View(db.deliveries.ToList());
//        }

//        // GET: Deliveries/Details/5
//        public ActionResult Details(int? id)
//        {
//            if (id == null)
//            {
//                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
//            }
//            Delivery delivery = db.deliveries.Find(id);
//            if (delivery == null)
//            {
//                return HttpNotFound();
//            }
//            return View(delivery);
//        }

//        // GET: Deliveries/Create
//        public ActionResult Create()
//        {
//            return View();
//        }

//        // POST: Deliveries/Create
//        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
//        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
//        [HttpPost]
//        [ValidateAntiForgeryToken]
//        public ActionResult Create([Bind(Include = "ID,Status,Address,Payed")] Delivery delivery)
//        {
//            if (ModelState.IsValid)
//            {
//                db.deliveries.Add(delivery);
//                db.SaveChanges();
//                return RedirectToAction("Index");
//            }

//            return View(delivery);
//        }

//        // GET: Deliveries/Edit/5
//        public ActionResult Edit(int? id)
//        {
//            if (id == null)
//            {
//                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
//            }
//            Delivery delivery = db.deliveries.Find(id);
//            if (delivery == null)
//            {
//                return HttpNotFound();
//            }
//            return View(delivery);
//        }

//        // POST: Deliveries/Edit/5
//        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
//        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
//        [HttpPost]
//        [ValidateAntiForgeryToken]
//        public ActionResult Edit([Bind(Include = "ID,Status,Address,Payed")] Delivery delivery)
//        {
//            if (ModelState.IsValid)
//            {
//                db.Entry(delivery).State = EntityState.Modified;
//                db.SaveChanges();
//                return RedirectToAction("Index");
//            }
//            return View(delivery);
//        }

//        // GET: Deliveries/Delete/5
//        public ActionResult Delete(int? id)
//        {
//            if (id == null)
//            {
//                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
//            }
//            Delivery delivery = db.deliveries.Find(id);
//            if (delivery == null)
//            {
//                return HttpNotFound();
//            }
//            return View(delivery);
//        }

//        // POST: Deliveries/Delete/5
//        [HttpPost, ActionName("Delete")]
//        [ValidateAntiForgeryToken]
//        public ActionResult DeleteConfirmed(int id)
//        {
//            Delivery delivery = db.deliveries.Find(id);
//            db.deliveries.Remove(delivery);
//            db.SaveChanges();
//            return RedirectToAction("Index");
//        }

//        protected override void Dispose(bool disposing)
//        {
//            if (disposing)
//            {
//                db.Dispose();
//            }
//            base.Dispose(disposing);
//        }
//    }
//}
