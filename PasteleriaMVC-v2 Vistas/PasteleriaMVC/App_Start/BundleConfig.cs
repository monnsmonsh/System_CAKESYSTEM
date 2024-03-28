using System.Web;
using System.Web.Optimization;

namespace System
{
    public class BundleConfig
    {
        // Para obtener más información sobre las uniones, visite https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Utilice la versión de desarrollo de Modernizr para desarrollar y obtener información. De este modo, estará
            // para la producción, use la herramienta de compilación disponible en https://modernizr.com para seleccionar solo las pruebas que necesite.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(

                                      "~/Content/vendor/jquery-3.2.1.min.js",
                                      "~/Content/vendor/bootstrap-4.1/popper.min.js",
                                      "~/Content/vendor/bootstrap-4.1/bootstrap.min.js",
                                      "~/Content/vendor/slick/slick.min.js",
                                      "~/Content/vendor/wow/wow.min.js",
                                      "~/Content/vendor/animsition/animsition.min.js",
                                      "~/Content/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js",
                                      "~/Content/vendor/counter-up/jquery.waypoints.min.js",
                                      "~/Content/vendor/counter-up/jquery.counterup.min.js",
                                      "~/Content/vendor/circle-progress/circle-progress.min.js",
                                      "~/Content/vendor/perfect-scrollbar/perfect-scrollbar.js",
                                      "~/Content/vendor/chartjs/Chart.bundle.min.js",
                                      "~/Content/vendor/select2/select2.min.js",
                                      "~/Content/js/main.js"
                                  ));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                        "~/Content/css/font-face.css",
                        "~/Content/vendor/font-awesome-4.7/css/font-awesome.min.css",
                        "~/Content/vendor/font-awesome-5/css/fontawesome-all.min.css",
                        "~/Content/vendor/mdi-font/css/material-design-iconic-font.min.css",
                        "~/Content/vendor/bootstrap-4.1/bootstrap.min.css",
                        "~/Content/vendor/animsition/animsition.min.css",
                        "~/Content/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css",
                        "~/Content/vendor/wow/animate.css",
                        "~/Content/vendor/css-hamburgers/hamburgers.min.css",
                        "~/Content/vendor/slick/slick.css",
                        "~/Content/vendor/select2/select2.min.css",
                        "~/Content/vendor/perfect-scrollbar/perfect-scrollbar.css",
                        "~/Content/css/theme.css"
                        /*"~/Content/css/style.css"*/
                    ));
        }
    }
}
