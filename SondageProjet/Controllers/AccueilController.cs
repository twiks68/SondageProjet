using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SondageProjet.Models;

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

        public ActionResult CreationSondage(string question, string choix1, string choix2, string choix3, string choix4, bool isChoixMultiple, bool isDisabled, string numProtection)
        {






            bool coche = isChoixMultiple.GetValueOrDefault(false);
            Sondage sondage = new Sondage(0, question, nombreVoteC1, nombreVoteC2, nombreVoteC3, nombreVoteC4, coche);

            

            creationsondage Sondage = new creationsondage(sondage);

            int idSondageCree = DataAccess.CreerNouveauSondage(sondage);
            DataAccess.CreerNouveauResultat(idSondageCree);

            return RedirectToAction("ChoixVotant", new { idSondage = idSondageCree });
        }




    }
}