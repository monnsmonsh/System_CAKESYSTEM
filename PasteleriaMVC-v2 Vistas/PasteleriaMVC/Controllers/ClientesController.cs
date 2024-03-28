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
    public class ClientesController : Controller
    {
        private DataBase db = new DataBase();

        // GET: Clientes
        public ActionResult Index()
        {
            var clientes = db.Clientes.Include(c => c.estados).Include(c => c.municipios);
            return View(clientes.ToList());
        }

        // GET: Clientes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Clientes clientes = db.Clientes.Find(id);
            if (clientes == null)
            {
                return HttpNotFound();
            }
            return View(clientes);
        }

        // GET: Clientes/Create
        public ActionResult Create()
        {
            ViewBag.idEstado = new SelectList(db.estados, "idEstado", "nombre");
            ViewBag.idMunicipios = new SelectList(db.municipios, "idMunicipios", "nombre");
            return View();
        }

        // POST: Clientes/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idCliente,nombres,apellidoP,apellidoM,idEstado,idMunicipios,calle,colonia,celular,telefono,correo")] Clientes clientes)
        {
            if (ModelState.IsValid)
            {
                db.Clientes.Add(clientes);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idEstado = new SelectList(db.estados, "idEstado", "nombre", clientes.idEstado);
            ViewBag.idMunicipios = new SelectList(db.municipios, "idMunicipios", "nombre", clientes.idMunicipios);
            return View(clientes);
        }

        // GET: Clientes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Clientes clientes = db.Clientes.Find(id);
            if (clientes == null)
            {
                return HttpNotFound();
            }
            ViewBag.idEstado = new SelectList(db.estados, "idEstado", "nombre", clientes.idEstado);
            ViewBag.idMunicipios = new SelectList(db.municipios, "idMunicipios", "nombre", clientes.idMunicipios);
            return View(clientes);
        }

        // POST: Clientes/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idCliente,nombres,apellidoP,apellidoM,idEstado,idMunicipios,calle,colonia,celular,telefono,correo")] Clientes clientes)
        {
            if (ModelState.IsValid)
            {
                db.Entry(clientes).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idEstado = new SelectList(db.estados, "idEstado", "nombre", clientes.idEstado);
            ViewBag.idMunicipios = new SelectList(db.municipios, "idMunicipios", "nombre", clientes.idMunicipios);
            return View(clientes);
        }

        // GET: Clientes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Clientes clientes = db.Clientes.Find(id);
            if (clientes == null)
            {
                return HttpNotFound();
            }
            return View(clientes);
        }

        // POST: Clientes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Clientes clientes = db.Clientes.Find(id);
            db.Clientes.Remove(clientes);
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
