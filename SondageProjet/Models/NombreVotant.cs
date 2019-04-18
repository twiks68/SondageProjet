using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SondageProjet.Models
{
    public class NombreVotant
    {
        public int NombreVotants { get; private set; }
        

        public NombreVotant(int nombreVotants)
        {
            NombreVotants = nombreVotants;
            
        }
    }
}