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


        public ActionResult Resultat(int idSondage)
        {
        
            Reponse sondage = DataAccess.AfficherQuestionReponse(idSondage);
            sondage.PourcentageDesVotes();

            return View(sondage);
        }


        // VUE CREATION SONDAGE  OK 
        public ActionResult CreationSondage(string question, string choix1, string choix2, string choix3, string choix4, string isChoixMultiple)
        {

            bool coche1;
            if (isChoixMultiple == "true")
            {
                coche1 = true;
            }
            else
            {
                coche1 = false;
            }
                


            Sondage sondage = new Sondage(0, question, choix1, choix2, choix3, choix4, coche1);
            sondage.GetChiffre();
            CreationSondage Sondage = new CreationSondage(sondage);

            int nouveauIdSondage = DataAccess.CreationSondage(sondage);
            DataAccess.CreationReponse(nouveauIdSondage);

            return RedirectToAction("Vote", new { idSondage = nouveauIdSondage, numProtection = sondage.NumProtection });

        }


        // View récuperation de mon sondage Creer  
        public ActionResult Vote(int idSondage, int numProtection)
        {
            Sondage model = new Sondage(idSondage, numProtection);

       
          return View(model);
        }


        public ActionResult PageVote(int idSondage)
        {



            Reponse model =DataAccess.AfficherQuestionReponse(idSondage);
            if (model.ModelSondage.IsDisabled == true)
            {
                return RedirectToAction("ImpossibleDevoter", new { idSondage = idSondage });
            }
            else
            {
                return View(model);
            }
            
        }


      


            public ActionResult VoteMultiple(string choix1, string choix2, string choix3,string choix4, int idSondage)
        {
            //////////////////////////////////////////////////////////////////////////
            if (TestSondagevote(Request.Cookies, idSondage))
            {
                return RedirectToAction("DejaVoter", new { idSondage = idSondage });
            }
            ////////////////////////////////////////////////////////////////////
            DataAccess.InsertionVoteBDD(idSondage,Sondage.Coche(choix1),Sondage.Coche(choix2),Sondage.Coche( choix3) ,Sondage.Coche(choix4));
            SaveCookie(idSondage);
            return RedirectToAction("Resultat", new { IDSondage = idSondage });

        }

        // GESTION POUR LE CHOIX UNIQUE 
        public ActionResult VoteSimple(string onechoose, int idSondage)
        {
            //////////////////////////////////////////////////////////////////////////
            if (TestSondagevote(Request.Cookies, idSondage))
            {
                
                return RedirectToAction("DejaVoter", new { idSondage = idSondage });
            }
            ////////////////////////////////////////////////////////////////////
            Reponse model = new Reponse( idSondage);
            switch (onechoose)
            {
                case "Choix1":
                    model.NombreVoteC1 = 1;
                    break;

                case "Choix2":
                    model.NombreVoteC2 = 1;
                    break;
                case "Choix3":
                    model.NombreVoteC3 = 1;
                    break;
                case "Choix4":
                    model.NombreVoteC4 = 1;
                    break;

            }
            DataAccess.InsertionVoteBDD(idSondage, model.NombreVoteC1, model.NombreVoteC2, model.NombreVoteC3, model.NombreVoteC4);
            SaveCookie(idSondage);
            return RedirectToAction("Resultat", new { IDSondage = idSondage });
        }
        public ActionResult ImpossibleDevoter(int idSondage)
        {
            Sondage model = new Sondage(idSondage);
            return View(model);
        }
        public ActionResult DejaVoter(int idSondage)
        {
            Sondage model = new Sondage(idSondage);
            return View(model);
        }
        public ActionResult SondageDejaSupprimer(int idSondage)
        {
            Sondage model = new Sondage(idSondage);
            return View(model);
        }

        // GESTION POUR DESACTIVER SON SONDAGE 
       
        public ActionResult ConfirmationSuppression(int idSondage, int numProtection)
        {
            Sondage model = new Sondage(idSondage, numProtection);
            return View(model);
        }
        public ActionResult SupprimerSondage(int idSondage,int numProtection)
        {
            if (DataAccess.DesactiverSondage(idSondage, numProtection, out Sondage detailSondage))
            {
                if (detailSondage.IsDisabled == false)
                {
                    DataAccess.MiseAJour(detailSondage);
                    return View(detailSondage);
                }
                else
                {
                    return RedirectToAction("SondageDejaSupprimer", new { IdSondage = idSondage });
                }
                
            }
            else
            { 
                return RedirectToAction("SondageExistePas", new { IdSondage = idSondage });
            }
        }


        ///  GESTION DU REVOTE UTILISATION COOKIES ////

        public void SaveCookie(int idSondage)
        {
            string Votant = Request.UserHostAddress;
            HttpCookie gestionCookies = new HttpCookie("cook" + idSondage);
            gestionCookies.Value = "";
            gestionCookies.Expires = DateTime.MaxValue;
            this.Response.Cookies.Add(gestionCookies);
        }


        public static bool TestSondagevote(HttpCookieCollection cookies, int idSondage)
        {
            return cookies["cook" + idSondage] != null;
        }


    }
}
