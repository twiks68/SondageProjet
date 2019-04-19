using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SondageProjet.Models
{
    public class Reponse
    {
        public int IdReponse { get; private set; }
        public int NombreVoteC1 { get; private set; }
        public int NombreVoteC2 { get; private set; }
        public int NombreVoteC3 { get; private set; }
        public int NombreVoteC4 { get; private set; }
        public int NombreTotalVote { get; private set; }

        public Reponse(int idReponse, int nombreVoteC1, int nombreVoteC2, int nombreVoteC3, int nombreVoteC4, int nombreTotalVote)
        {
            IdReponse = idReponse;
            NombreVoteC1 = nombreVoteC1;
            NombreVoteC2 = nombreVoteC2;
            NombreVoteC3 = nombreVoteC3;
            NombreVoteC4 = nombreVoteC4;
            NombreTotalVote = nombreTotalVote;
        }
    }
}