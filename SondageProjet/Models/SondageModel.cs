using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SondageProjet.Models
{
    public class SondageModel
    {
        public List<Sondage> SondageEnCours { get; private set; }
        public List<Sondage> SondageFini { get; private set; }
        public int NombreTotalSondageFini { get; private set; }
        

        public SondageModel(List<Sondage> sondageEnCours, List<Sondage> sondageFini, int nombreTotalSondageFini)
        {
            SondageEnCours = sondageEnCours;
            SondageFini = sondageFini;
            NombreTotalSondageFini = nombreTotalSondageFini;
        }
    }
}