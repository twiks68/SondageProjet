using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SondageProjet.Models
{
    public class ConfirmationSondageModel
    {
        public Sondage SondageEnCours { get; private set; }

        public ConfirmationSondageModel(Sondage sondageConfirmation)
        {

        }
    }
}