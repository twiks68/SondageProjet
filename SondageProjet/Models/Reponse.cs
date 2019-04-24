using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SondageProjet.Models
{
    public class Reponse
    {
        public Sondage ModelSondage { get; private set; }
        public int NombreVoteC1 { get; set; }
        public int NombreVoteC2 { get; set; }
        public int NombreVoteC3 { get; set; }
        public int NombreVoteC4 { get; set; }
        public int NombreTotalVote { get; set; }
        public int FKIdSondage { get; private set; }

        public Reponse(int fkIdSondage)
        {
            FKIdSondage = fkIdSondage;
        }

        public Reponse(Sondage modelSondage, int nombreVoteC1, int nombreVoteC2, int nombreVoteC3, int nombreVoteC4, int nombreTotalVote, int fkIdSondage)
        {
            ModelSondage = modelSondage;
            NombreVoteC1 = nombreVoteC1;
            NombreVoteC2 = nombreVoteC2;
            NombreVoteC3 = nombreVoteC3;
            NombreVoteC4 = nombreVoteC4;
            NombreTotalVote = nombreTotalVote;
            FKIdSondage = fkIdSondage;
        }

        public int PourcentageReponse1 { get; set; }
        public int PourcentageReponse2 { get; set; }
        public int PourcentageReponse3 { get; set; }
        public int PourcentageReponse4 { get; set; }


        public Reponse(int pourcentageReponse1, int pourcentageReponse2, int pourcentageReponse3, int pourcentageReponse4)
        {
            PourcentageReponse1 = pourcentageReponse1;
            PourcentageReponse2 = pourcentageReponse2;
            PourcentageReponse3 = pourcentageReponse3;
            PourcentageReponse4 = pourcentageReponse4;
        }
        public Reponse(Sondage modelSondage, int nombreVoteC1, int nombreVoteC2, int nombreVoteC3, int nombreVoteC4, int nombreTotalVote, int fkIdSondage, int pourcentageReponse1, int pourcentageReponse2, int pourcentageReponse3, int pourcentageReponse4)
        {
            ModelSondage = modelSondage;
            NombreVoteC1 = nombreVoteC1;
            NombreVoteC2 = nombreVoteC2;
            NombreVoteC3 = nombreVoteC3;
            NombreVoteC4 = nombreVoteC4;
            NombreTotalVote = nombreTotalVote;
            FKIdSondage = fkIdSondage;
            PourcentageReponse1 = pourcentageReponse1;
            PourcentageReponse2 = pourcentageReponse2;
            PourcentageReponse3 = pourcentageReponse3;
            PourcentageReponse4 = pourcentageReponse4;
        }
        // FONCTION  POURCENTAGE DES VOTES, avec condition qui vérifie si pas de vote alors renvoit 0, sinon renvoie les pourcentages par reponse
        public void PourcentageDesVotes()
        {

            if (NombreTotalVote == 0)
            {
                PourcentageReponse1 = 0;
                PourcentageReponse2 = 0;
                PourcentageReponse3 = 0;
                PourcentageReponse4 = 0;
            }
            else
            {
                PourcentageReponse1 = NombreVoteC1 * 100 / (NombreTotalVote);
                PourcentageReponse2 = NombreVoteC2 * 100 / (NombreTotalVote);
                PourcentageReponse3 = NombreVoteC3 * 100 / (NombreTotalVote);
                PourcentageReponse4 = NombreVoteC4 * 100 / (NombreTotalVote);
            }

        }
    }
}