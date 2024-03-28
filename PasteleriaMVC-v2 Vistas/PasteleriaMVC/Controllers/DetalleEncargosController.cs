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
    public class DetalleEncargosController : Controller
    {
        private DataBase db = new DataBase();

        // GET: DetalleEncargos
        public ActionResult Index()
        {
            var detalleEncargos = db.DetalleEncargos.Include(d => d.Encargos).Include(d => d.Productos);
            return View(detalleEncargos.ToList());
        }

        // GET: DetalleEncargos/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DetalleEncargos detalleEncargos = db.DetalleEncargos.Find(id);
            if (detalleEncargos == null)
            {
                return HttpNotFound();
            }
            return View(detalleEncargos);
        }

        // GET: DetalleEncargos/Create
        public ActionResult Create()
        {
            ViewBag.idEncargo = new SelectList(db.Encargos, "idEncargo", "idEncargo");
            ViewBag.idProducto = new SelectList(db.Productos, "idProducto", "nombre");
            return View();
        }

        // POST: DetalleEncargos/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idEncargo,idProducto,cantidad")] DetalleEncargos detalleEncargos)
        {
            if (ModelState.IsValid)
            {
                db.DetalleEncargos.Add(detalleEncargos);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idEncargo = new SelectList(db.Encargos, "idEncargo", "idEncargo", detalleEncargos.idEncargo);
            ViewBag.idProducto = new SelectList(db.Productos, "idProducto", "nombre", detalleEncargos.idProducto);
            return View(detalleEncargos);
        }

        // GET: DetalleEncargos/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DetalleEncargos detalleEncargos = db.DetalleEncargos.Find(id);
            if (detalleEncargos == null)
            {
                return HttpNotFound();
            }
            ViewBag.idEncargo = new SelectList(db.Encargos, "idEncargo", "idEncargo", detalleEncargos.idEncargo);
            ViewBag.idProducto = new SelectList(db.Productos, "idProducto", "nombre", detalleEncargos.idProducto);
            return View(detalleEncargos);
        }

        // POST: DetalleEncargos/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idEncargo,idProducto,cantidad")] DetalleEncargos detalleEncargos)
        {
            if (ModelState.IsValid)
            {
                db.Entry(detalleEncargos).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idEncargo = new SelectList(db.Encargos, "idEncargo", "idEncargo", detalleEncargos.idEncargo);
            ViewBag.idProducto = new SelectList(db.Productos, "idProducto", "nombre", detalleEncargos.idProducto);
            return View(detalleEncargos);
        }

        // GET: DetalleEncargos/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DetalleEncargos detalleEncargos = db.DetalleEncargos.Find(id);
            if (detalleEncargos == null)
            {
                return HttpNotFound();
            }
            return View(detalleEncargos);
        }

        // POST: DetalleEncargos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            DetalleEncargos detalleEncargos = db.DetalleEncargos.Find(id);
            db.DetalleEncargos.Remove(detalleEncargos);
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
