using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PasteleriaMVC.Models.ViewModels
{
    public class tblClientes
    {
        public tblClientes()
        {
            this.Vender = new HashSet<Vender>();
        }

        public int idCliente { get; set; }
        public string nombres { get; set; }
        public string apellidoP { get; set; }
        public string apellidoM { get; set; }
       
        public virtual ICollection<Vender> Vender { get; set; }
    }
}