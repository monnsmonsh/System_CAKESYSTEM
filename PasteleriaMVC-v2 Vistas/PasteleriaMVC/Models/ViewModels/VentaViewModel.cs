using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PasteleriaMVC.Models.ViewModels
{
    public class VentaViewModel
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public double Precio { get; set; }

        public int IdCliente { get; set; }
        public string Nombres { get; set; }
    }
}