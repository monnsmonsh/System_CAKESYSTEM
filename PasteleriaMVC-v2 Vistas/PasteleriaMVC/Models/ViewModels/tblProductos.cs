using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PasteleriaMVC.Models.ViewModels
{
    public class tblProductos
    {
        public tblProductos()
        {
            this.Vender = new HashSet<Vender>();
        }

        public int idProducto { get; set; }
        public string nombre { get; set; }
        public double precio { get; set; }
        public virtual ICollection<Vender> Vender { get; set; }
    }
}