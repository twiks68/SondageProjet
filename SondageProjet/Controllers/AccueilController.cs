using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SondageProjet.Controllers
{
    public class AccueilController : Controller
    {
        // GET: Accueil
        public ActionResult Accueil()
        {
            return View();
        }

        public ActionResult Formulaire()
        {
            return View();
        }

        public ActionResult LiensGeneres()
        {
            return View();

        }

        public ActionResult Vote()
        {
            return View();
        }

        public ActionResult Resultat()
        {
            return View();
        }

        public ActionResult SubmitLiensGeneres()
        {
            return View();
        }

        public ActionResult CreationSondage()
        {
            //ondage model = new Sondage(0, question, choix1, choix2, choix3, choix4, null);
            //CreationSondage nouveauSondage = new CreationSondage(model);
            //int iD = DataAccess.InsererSondage(model);

            return RedirectToAction("ConfirmationCreation");
        }




    }
}