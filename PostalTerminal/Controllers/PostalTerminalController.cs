//using Newtonsoft.Json;
//using shanuMVCUserRoles.Models;
//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.Mvc;

//namespace PostalTerminal.Controllers
//{
//    public class PostalTerminalController : Controller
//    {
//        //
//        // GET: /PostalTerminal/
//        public ActionResult PostalTerminalView()
//        {
//            return View();
//        }

//        public ActionResult PostalTerminalAddView()
//        {
//            ViewBag.Submitted = false;
//            var created = false;
//            // Create the Client
//            if (HttpContext.Request.RequestType == "POST")
//            {
//                ViewBag.Submitted = true;
//                // If the request is POST, get the values from the form
//                var id = Request.Form["id"];
//                var name = Request.Form["name"];
//                var address = Request.Form["address"];
//                var working = false;
//                var handlerId = Request.Form["handlerId"];
//                var SpaceTaken = Request.Form["SpaceTaken"];
//                var Capaticity = Request.Form["Capaticity"];
//                var LaunchDate = Request.Form["LaunchDate"];
//                var Status = Request.Form["Status"];

//                if (Request.Form["working"] == "on")
//                {
//                    working = true;
//                }

//                // Create a new Client for these details.
//                PostalTerminal pt = new PostalTerminal()
//                {
//                    ID = Convert.ToInt16(id),
//                    Name = name,
//                    Address = address,
//                    Working = Convert.ToBoolean(working),
//                    HandlerID = handlerId,
//                    SpaceTaken = Int32.Parse(SpaceTaken),
//                    Capaticity = Int32.Parse(Capaticity),
//                    LaunchDate = LaunchDate,
//                    Status = Status
//                };

//                // Save the client in the ClientList
//                var PostalTerminalFile = PostalTerminal.PostalTerminalFile;
//                var PostalTerminalData = System.IO.File.ReadAllText(PostalTerminalFile);
//                List<PostalTerminal> PostalTerminalList = new List<PostalTerminal>();
//                PostalTerminalList = JsonConvert.DeserializeObject<List<PostalTerminal>>(PostalTerminalData);

//                if (PostalTerminalList == null)
//                {
//                    PostalTerminalList = new List<PostalTerminal>();
//                }
//                PostalTerminalList.Add(pt);

//                // Now save the list on the disk
//                System.IO.File.WriteAllText(PostalTerminalFile, JsonConvert.SerializeObject(PostalTerminalList));

//                // Denote that the client was created
//                created = true;
//            }

//            if (created)
//            {
//                ViewBag.Message = "terminal was created successfully.";
//            }
//            else
//            {
//                ViewBag.Message = "There was an error while creating the terminal.";
//            }
//            return View();
//        }

//        public ActionResult PostalTerminalEditView(int id)
//        {
//            if (HttpContext.Request.RequestType == "POST")
//            {
//                // Request is Post type; must be a submit

//                // If the request is POST, get the values from the form
//                var id_ = Int32.Parse(Request.Form["id"]);
//                var name = Request.Form["name"];
//                var address = Request.Form["address"];
//                var working = false;
//                var handlerId = Request.Form["handlerId"];
//                var SpaceTaken = Request.Form["SpaceTaken"];
//                var Capaticity = Request.Form["Capaticity"];
//                var LaunchDate = Request.Form["LaunchDate"];
//                var Status = Request.Form["Status"];
//                if (Request.Form["working"] == "on")
//                {
//                    working = true;
//                }
//                // Get all of the clients
//                var pts = PostalTerminal.GetPostalTerminals();

//                foreach (PostalTerminal pt in pts)
//                {
//                    // Find the client
//                    if (pt.ID == id)
//                    {
//                        // Client found, now update his properties and save it.


//                        pt.ID = id_;
//                        pt.Name = name;
//                        pt.Address = address;
//                        pt.Working = Convert.ToBoolean(working);
//                        pt.HandlerID = handlerId;
//                        pt.SpaceTaken = Int32.Parse(SpaceTaken);
//                        pt.Capaticity = Int32.Parse(Capaticity);
//                        pt.LaunchDate = LaunchDate;
//                        pt.Status = Status;

//                        // Break through the loop
//                        break;
//                    }
//                }

//                // Update the clients in the disk
//                System.IO.File.WriteAllText(PostalTerminal.PostalTerminalFile, JsonConvert.SerializeObject(pts));

//                // Add the details to the View
//                Response.Redirect("~/PostalTerminal/PostalTerminalListView?Message=PostalTerminal_Updated");
//            }

//            // Create a model object.
//            var postalTerminal = new PostalTerminal(); //clnt
//            // Get the list of clients
//            var pts_ = PostalTerminal.GetPostalTerminals(); //clients
//            // Search within the clients
//            foreach (PostalTerminal pt in pts_)
//            {
//                // If the client's ID matches
//                if (pt.ID == id)
//                {
//                    postalTerminal = pt;
//                }
//                // No need to further run the loop
//                break;
//            }
//            if (postalTerminal == null)
//            {
//                // No client was found
//                ViewBag.Message = "No terminal was found.";
//            }
//            return View(postalTerminal);

//        }

//        public ActionResult PostalTerminalListView()
//        {

//            // Load the data for the client
//            var terminals = PostalTerminal.GetPostalTerminals();

//            // Return the view.
//            return View(terminals);

//        }



//        public ActionResult Delete(int id)
//        {
//            // Get the clients
//            var PostalTerminals = PostalTerminal.GetPostalTerminals();
//            var deleted = false;
//            // Delete the specific one.
//            foreach (PostalTerminal pt in PostalTerminals)
//            {
//                // Found the client
//                if (pt.ID == id)
//                {
//                    // delete this client
//                    var index = PostalTerminals.IndexOf(pt);
//                    PostalTerminals.RemoveAt(index);

//                    // Removed now save the data back.
//                    System.IO.File.WriteAllText(PostalTerminal.PostalTerminalFile, JsonConvert.SerializeObject(PostalTerminals));
//                    deleted = true;
//                    break;
//                }
//            }

//            // Add the process details to the ViewBag
//            if (deleted)
//            {
//                ViewBag.Message = "Terminal was deleted successfully.";
//            }
//            else
//            {
//                ViewBag.Message = "There was an error while deleting the terminal.";
//            }
//            return View();
//        }

//    }
//}