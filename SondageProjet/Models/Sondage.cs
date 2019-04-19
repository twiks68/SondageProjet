using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SondageProjet.Models
{
    public class Sondage
    {
        public int IdSondage { get; private set; }
        public string Question { get; private set; }
        public int Choix1 { get; private set; }
        public int Choix2 { get; private set; }
        public int Choix3 { get; private set; }
        public int Choix4 { get; private set; }
        public bool IsChoixMultiple { get; private set; }
        public bool IsDisabled { get; private set; }
        public string NumProtection { get; private set; }

        public Sondage(int idSondage, string question, int choix1, int choix2, int choix3, int choix4, bool isChoixMultiple, bool isDisabled, string numProtection)
        {
            IdSondage = idSondage;
            Question = question;
            Choix1 = choix1;
            Choix2 = choix2;
            Choix3 = choix3;
            Choix4 = choix4;
            IsChoixMultiple = isChoixMultiple;
            IsDisabled = isDisabled;
            NumProtection = numProtection;
        }

        public static int Coche(string connecte) 
        {
        int premier = 0;
        if (connecte !=null)
            {
            
            premier = 1;
            }
            return premier;

        }

        




        //

    }
}