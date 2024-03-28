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
    public class EncargosController : Controller
    {
        private DataBase db = new DataBase();

        // GET: Encargos
        public ActionResult Index()
        {
            var encargos = db.Encargos.Include(e => e.Clientes).Include(e => e.DetalleEncargos);
            return View(encargos.ToList());
        }

        // GET: Encargos/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Encargos encargos = db.Encargos.Find(id);
            if (encargos == null)
            {
                return HttpNotFound();
            }
            return View(encargos);
        }

        // GET: Encargos/Create
        public ActionResult Create()
        {
            ViewBag.idCliente = new SelectList(db.Clientes, "idCliente", "nombres");
            ViewBag.idEncargo = new SelectList(db.DetalleEncargos, "idEncargo", "idEncargo");
            return View();
        }

        // POST: Encargos/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idEncargo,idCliente,anticipo,fechaEncargo,fechaEntrega")] Encargos encargos)
        {
            if (ModelState.IsValid)
            {
                db.Encargos.Add(encargos);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idCliente = new SelectList(db.Clientes, "idCliente", "nombres", encargos.idCliente);
            ViewBag.idEncargo = new SelectList(db.DetalleEncargos, "idEncargo", "idEncargo", encargos.idEncargo);
            return View(encargos);
        }

        // GET: Encargos/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Encargos encargos = db.Encargos.Find(id);
            if (encargos == null)
            {
                return HttpNotFound();
            }
            ViewBag.idCliente = new SelectList(db.Clientes, "idCliente", "nombres", encargos.idCliente);
            ViewBag.idEncargo = new SelectList(db.DetalleEncargos, "idEncargo", "idEncargo", encargos.idEncargo);
            return View(encargos);
        }

        // POST: Encargos/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idEncargo,idCliente,anticipo,fechaEncargo,fechaEntrega")] Encargos encargos)
        {
            if (ModelState.IsValid)
            {
                db.Entry(encargos).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idCliente = new SelectList(db.Clientes, "idCliente", "nombres", encargos.idCliente);
            ViewBag.idEncargo = new SelectList(db.DetalleEncargos, "idEncargo", "idEncargo", encargos.idEncargo);
            return View(encargos);
        }

        // GET: Encargos/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Encargos encargos = db.Encargos.Find(id);
            if (encargos == null)
            {
                return HttpNotFound();
            }
            return View(encargos);
        }

        // POST: Encargos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Encargos encargos = db.Encargos.Find(id);
            db.Encargos.Remove(encargos);
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
