using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using Newtonsoft.Json;
using System.Data.Entity;

namespace PostalTerminal.Models
{
    public class Delivery
    {
        public static string DeliveryFile = HttpContext.Current.Server.MapPath("~/App_Data/Deliveries.json");

        //<p>Gavėjo vardas</p>
        //<p>Gavėjo pavardė</p>
        //<p>Gavėjo telefonas</p>
        //<p>Siuntos svoris</p>
        //<p>Ar skubi</p>
        //<p>Adresas</p>

        public int ID { get; set; }
        public string Receiver_lname { get; set; }
        public string Receiver_flast { get; set; }
        public int Phone_num { get; set; }
        public double Delivery_weight { get; set; }
        public bool Priority { get; set; }
        public string Status { get; set; }
        public int Address { get; set; }
        public bool Payed { get; set; }



        public static List<Delivery> GetDelivery(int id)
        {
            List<Delivery> delivery = new List<Delivery>();

            List<Delivery> handlerDelivery = new List<Delivery>();
            if (File.Exists(DeliveryFile))
            {
                // File exists..
                string content = File.ReadAllText(DeliveryFile);
                // Deserialize the objects 
                delivery = JsonConvert.DeserializeObject<List<Delivery>>(content);

                for (int i = 0; i < delivery.Count; i++)
                {
                    if (delivery[i].Address == id)
                    {
                        handlerDelivery.Add(delivery[i]);
                    }
                }

                // Returns the clients, either empty list or containing the Client(s).
                //System.Diagnostics.Debug.WriteLine(delivery[1].ID);

                return handlerDelivery;
            }
            else
            {
                // Create the file 
                File.Create(DeliveryFile).Close();
                // Write data to it; [] means an array, 
                // List<Client> would throw error if [] is not wrapping text
                File.WriteAllText(DeliveryFile, "[]");

                // Re run the function
                GetDelivery(id);
            }

            return delivery;
        }


        public void updateDeliveryStatus()
        {

        }
        public static List<Delivery> getDeliveryList()
        {
            List<Delivery> delivery = new List<Delivery>();

            if (File.Exists(DeliveryFile))
            {
                // File exists..
                string content = File.ReadAllText(DeliveryFile);
                // Deserialize the objects 
                delivery = JsonConvert.DeserializeObject<List<Delivery>>(content);


                // Returns the clients, either empty list or containing the Client(s).
                //System.Diagnostics.Debug.WriteLine(delivery[1].ID);

                return delivery;
            }
            else
            {
                // Create the file 
                File.Create(DeliveryFile).Close();
                // Write data to it; [] means an array, 
                // List<Client> would throw error if [] is not wrapping text
                File.WriteAllText(DeliveryFile, "[]");

                // Re run the function
                getDeliveryList();
            }

            return delivery;
        }

        public void getPostalTerminalDeliveries()
        {

        }
        public void getOwnDeliveryList()
        {

        }
        public void getDeliveryById()
        {

        }
        public void addDelivery()
        {

        }
        public void isPayed()
        {

        }
        public void getPrice()
        {

        }

    }




    //public class DeliveryDBContext : DbContext
    //{
    //    public DbSet<Delivery> deliveries { get; set; }

    //    public System.Data.Entity.DbSet<PostalTerminal.Models.PostalTerminalHandlersModel> Handlers { get; set; }
    //}

}
