using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Newtonsoft.Json;

namespace PostalTerminal.Models
{
    public class PostalTerminalModel
    {
        public static string PostalTerminalFile = HttpContext.Current.Server.MapPath("~/App_Data/PostalTerminals.json");

        public int ID { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public bool Working { get; set; }

        public string HandlerID { get; set; }
        public int SpaceTaken { get; set; }
        public int Capaticity { get; set; }
        public string LaunchDate { get; set; }
        public string Status { get; set; }

        public static List<PostalTerminalModel> GetPostalTerminals()
        {
            List<PostalTerminalModel> terminals = new List<PostalTerminalModel>();
            if (File.Exists(PostalTerminalFile))
            {
                // File exists..
                string content = File.ReadAllText(PostalTerminalFile);
                // Deserialize the objects 
                terminals = JsonConvert.DeserializeObject<List<PostalTerminalModel>>(content);


                //  CHECK IF THERE IS ASSIGNED POSTAL TERMINALS TO HANDLER AND PASS LIST

                // Returns the clients, either empty list or containing the Client(s).
                return terminals;
            }
            else
            {
                // Create the file 
                File.Create(PostalTerminalFile).Close();
                // Write data to it; [] means an array, 
                // List<Client> would throw error if [] is not wrapping text
                File.WriteAllText(PostalTerminalFile, "[]");

                // Re run the function
                GetPostalTerminals();
            }

            return terminals;
        }




    }
}