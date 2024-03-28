using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using PasteleriaMVC.Models;

namespace PasteleriaMVC.Controllers
{
    [Authorize]
    public class ProductosController : Controller
    {
        private DataBase db = new DataBase();

        //
        //Acction List
        //
        public ActionResult Index()
        {
            var productos = db.Productos.Include(p => p.Tam);
            return View(productos.ToList());
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
            Productos productos = db.Productos.Find(id);
            if (productos == null)
            {
                return HttpNotFound();
            }
            return View(productos);
        }



        //
        //Acction Create
        //
        public ActionResult Create()
        {
            ViewBag.idTam = new SelectList(db.Tam, "idTam", "nombre");
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idProducto,foto,nombre,idTam,descripcion,precio")] Productos productos)
        {
            //
            HttpPostedFileBase FileBase = Request.Files[0];

            if(FileBase.ContentLength == 0)
            {
                ModelState.AddModelError("Imagen","El necesario seleccionar una imagen");
            }
            else
            {
                if(FileBase.FileName.EndsWith(".jpg")){
                    WebImage image = new WebImage(FileBase.InputStream);
                    productos.foto = image.GetBytes();  
                }
                else
                {
                    ModelState.AddModelError("Imagen", "El sistema solo admite formato jpg");
                }
                
            }



            if (ModelState.IsValid)
            {
                db.Productos.Add(productos);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idTam = new SelectList(db.Tam, "idTam", "nombre", productos.idTam);
            return View(productos);
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
            Productos productos = db.Productos.Find(id);
            if (productos == null)
            {
                return HttpNotFound();
            }
            ViewBag.idTam = new SelectList(db.Tam, "idTam", "nombre", productos.idTam);
            return View(productos);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idProducto,foto,nombre,idTam,descripcion,precio")] Productos productos)
        {
            //
            //byte[] imagenActual = null;
            Productos _productos = new Productos();

            HttpPostedFileBase FileBase = Request.Files[0];
            if (FileBase.ContentLength ==0)
            {
                _productos = db.Productos.Find(productos.idProducto);
                productos.foto = _productos.foto;
            }
            else
            {
                if (FileBase.FileName.EndsWith(".jpg"))
                {
                    WebImage image = new WebImage(FileBase.InputStream);
                    productos.foto = image.GetBytes();
                }
                else
                {
                    ModelState.AddModelError("Imagen", "El sistema solo admite formato jpg");
                }
            }


            if (ModelState.IsValid)
            {
                //
                db.Entry(_productos).State = EntityState.Detached;


                db.Entry(productos).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idTam = new SelectList(db.Tam, "idTam", "nombre", productos.idTam);
            return View(productos);
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
            Productos productos = db.Productos.Find(id);
            if (productos == null)
            {
                return HttpNotFound();
            }
            return View(productos);
        }
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Productos productos = db.Productos.Find(id);
            db.Productos.Remove(productos);
            db.SaveChanges();
            return RedirectToAction("Index");
        }




        public ActionResult getImage(int id)
        {
            Productos productos = db.Productos.Find(id);
            byte[] byteImage = productos.foto;

            MemoryStream memoryStrem = new MemoryStream(byteImage);
            Image image = Image.FromStream(memoryStrem);

            memoryStrem = new MemoryStream();
            image.Save(memoryStrem, ImageFormat.Jpeg);
            memoryStrem.Position = 0;

            return File(memoryStrem,"image/jpg");
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
