using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PasteleriaMVC.Models.ViewModels
{
    public class Vender
    {
        public int idVenta { get; set; }
        public int idCliente { get; set; }
        public int idUsuario { get; set; }
        public Nullable<System.DateTime> fecha { get; set; }

        public virtual Clientes Clientes { get; set; }
        public virtual Usuario Usuario { get; set; }
        public virtual tblProductos Productos { get; set; }

    }
}