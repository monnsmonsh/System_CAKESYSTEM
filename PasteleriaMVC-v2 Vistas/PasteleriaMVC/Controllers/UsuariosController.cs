using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PasteleriaMVC.Models;

namespace PasteleriaMVC.Controllers
{
    [Authorize]
    public class UsuariosController : Controller
    {
        private DataBase db = new DataBase();

        //
        //Acction List
        //
        public ActionResult Index()
        {
            var usuario = db.Usuario.Include(u => u.TipoUsuario);
            return View(usuario.ToList());
        }


        //
        //Acction Details
        //
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Usuario usuario = db.Usuario.Find(id);
            if (usuario == null)
            {
                return HttpNotFound();
            }
            return View(usuario);
        }


        //
        //Acction Details
        //
        public ActionResult Create()
        {
            ViewBag.idTipo = new SelectList(db.TipoUsuario, "idTipo", "nombre");
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idUsuario,nombres,apellidoP,apellidoM,correo,pass,idTipo")] Usuario usuario)
        {
            if (ModelState.IsValid)
            {
                db.Usuario.Add(usuario);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idTipo = new SelectList(db.TipoUsuario, "idTipo", "nombre", usuario.idTipo);
            return View(usuario);
        }


        //
        //Acction Edit
        //
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Usuario usuario = db.Usuario.Find(id);
            if (usuario == null)
            {
                return HttpNotFound();
            }
            ViewBag.idTipo = new SelectList(db.TipoUsuario, "idTipo", "nombre", usuario.idTipo);
            return View(usuario);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idUsuario,nombres,apellidoP,apellidoM,correo,pass,idTipo")] Usuario usuario)
        {
            if (ModelState.IsValid)
            {
                db.Entry(usuario).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idTipo = new SelectList(db.TipoUsuario, "idTipo", "nombre", usuario.idTipo);
            return View(usuario);
        }


        //
        //Acction Delete
        //
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Usuario usuario = db.Usuario.Find(id);
            if (usuario == null)
            {
                return HttpNotFound();
            }
            return View(usuario);
        }
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Usuario usuario = db.Usuario.Find(id);
            db.Usuario.Remove(usuario);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
