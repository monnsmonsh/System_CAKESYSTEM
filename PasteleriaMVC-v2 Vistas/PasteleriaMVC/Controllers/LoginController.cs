using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using PasteleriaMVC.Models;

namespace System.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Login()
        {
            return View();
        }


        public ActionResult Index(string message = "")
        {
            ViewBag.Message = message;
            return View();
        }

        [HttpPost]
        public ActionResult Login(string correo, string password)
        {
            if (!string.IsNullOrEmpty(correo) && !string.IsNullOrEmpty(password))
            {
                DataBase db = new DataBase();
                var user = db.Usuario.FirstOrDefault(e => e.correo == correo && e.pass == password);

                //si usuario es difetente de null
                if (user != null)
                {
                    //encontramos un usuario con los datos
                    FormsAuthentication.SetAuthCookie(user.correo, true);
                    return RedirectToAction("Index", "Productos");
                }
                else
                {
                    return RedirectToAction("Index", new { message = "No encontramos tus datos" });
                }
            }
            else
            {
                return RedirectToAction("Index", new { message = "Llena los campos para poder iniciar secion" });

            }


        }

        [Authorize]
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index");
        }
    }
}