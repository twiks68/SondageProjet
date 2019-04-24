using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SondageProjet.Models
{
    public class Sondage
    {   // Proprietes ( setter en private)
        public int IdSondage { get; private set; }
        public string Question { get; private set; }
        public string Choix1 { get; private set; }
        public string Choix2 { get; private set; }
        public string Choix3 { get; private set; }
        public string Choix4 { get; private set; }
        public bool IsChoixMultiple { get; private set; }
        public bool IsDisabled { get; private set; }
        public int NumProtection { get; private set; }

        // Constructeur général
        public Sondage(int idSondage, string question, string choix1, string choix2, string choix3, string choix4, bool isChoixMultiple, bool isDisabled, int numProtection)
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

        // Constructeur  pour numProtection
        public Sondage (int idSondage, int numProtection)
        {
            IdSondage = idSondage;
            NumProtection = numProtection;
        }

        // Constructeur pour id
        public Sondage(int idSondage)
        {
            IdSondage = idSondage;
           
        }
        
        // Constructeur 
        public Sondage(int idSondage, string question, string choix1, string choix2, string choix3, string choix4, bool isChoixMultiple)
        {
            IdSondage = idSondage;
            Question = question;
            Choix1 = choix1;
            Choix2 = choix2;
            Choix3 = choix3;
            Choix4 = choix4;
            IsChoixMultiple = isChoixMultiple;
            IsDisabled = false;
           
        }


        // Fonction GetChiffre pour numProtection qui genere un entier aleatoire entre 0 et 9999
        public void GetChiffre()
        {
            Random aleatoire = new Random();
            NumProtection = aleatoire.Next(1000, 1000000);    

        }

        // Pour vérifier si c'est coché ou non pour IsChoixMultiple ou non ( non coché = par défaut = question à choix unique)
        public static int Coche(string connecte) 
        {
        int premier = 0;
        if (connecte !=null)
            {
            premier = 1;
            }
            return premier;
        }
    }
}