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
    public class DetalleVentasController : Controller
    {
        private DataBase db = new DataBase();

        // GET: DetalleVentas
        public ActionResult Index()
        {
            var detalleVentas = db.DetalleVentas.Include(d => d.Productos).Include(d => d.Ventas);
            return View(detalleVentas.ToList());
        }

        // GET: DetalleVentas/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DetalleVentas detalleVentas = db.DetalleVentas.Find(id);
            if (detalleVentas == null)
            {
                return HttpNotFound();
            }
            return View(detalleVentas);
        }

        // GET: DetalleVentas/Create
        public ActionResult Create()
        {
            ViewBag.idProducto = new SelectList(db.Productos, "idProducto", "nombre");
            ViewBag.idVenta = new SelectList(db.Ventas, "idVenta", "idVenta");
            return View();
        }

        // POST: DetalleVentas/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idVenta,idProducto,precio,cantidad")] DetalleVentas detalleVentas)
        {
            if (ModelState.IsValid)
            {
                db.DetalleVentas.Add(detalleVentas);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idProducto = new SelectList(db.Productos, "idProducto", "nombre", detalleVentas.idProducto);
            ViewBag.idVenta = new SelectList(db.Ventas, "idVenta", "idVenta", detalleVentas.idVenta);
            return View(detalleVentas);
        }

        // GET: DetalleVentas/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DetalleVentas detalleVentas = db.DetalleVentas.Find(id);
            if (detalleVentas == null)
            {
                return HttpNotFound();
            }
            ViewBag.idProducto = new SelectList(db.Productos, "idProducto", "nombre", detalleVentas.idProducto);
            ViewBag.idVenta = new SelectList(db.Ventas, "idVenta", "idVenta", detalleVentas.idVenta);
            return View(detalleVentas);
        }

        // POST: DetalleVentas/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idVenta,idProducto,precio,cantidad")] DetalleVentas detalleVentas)
        {
            if (ModelState.IsValid)
            {
                db.Entry(detalleVentas).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idProducto = new SelectList(db.Productos, "idProducto", "nombre", detalleVentas.idProducto);
            ViewBag.idVenta = new SelectList(db.Ventas, "idVenta", "idVenta", detalleVentas.idVenta);
            return View(detalleVentas);
        }

        // GET: DetalleVentas/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DetalleVentas detalleVentas = db.DetalleVentas.Find(id);
            if (detalleVentas == null)
            {
                return HttpNotFound();
            }
            return View(detalleVentas);
        }

        // POST: DetalleVentas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            DetalleVentas detalleVentas = db.DetalleVentas.Find(id);
            db.DetalleVentas.Remove(detalleVentas);
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
