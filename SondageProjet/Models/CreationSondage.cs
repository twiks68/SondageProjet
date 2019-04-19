using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SondageProjet.Models
{
    public class CreationSondage
    {
        public Sondage NouveauSondage { get; private set; }

        public CreationSondage(Sondage nouveauSondage)
        {
            NouveauSondage = nouveauSondage;
        }
    }
}