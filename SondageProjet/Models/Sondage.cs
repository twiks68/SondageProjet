﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SondageProjet.Models
{
    public class Sondage
    {
        public int Id { get; private set; }
        public string Question { get; private set; }
        public string Choix1 { get; private set; }
        public string Choix2 { get; private set; }
        public string Choix3 { get; private set; }
        public string Choix4 { get; private set; }
        public bool? ChoixMultiple { get; private set; }
        //

        public Sondage(int id, string question, string choix1, string choix2, string choix3, string choix4, bool? choixMultiple)
        {
            Id = id;
            Question = question;
            Choix1 = choix1;
            Choix2 = choix2;
            Choix3 = choix3;
            Choix4 = choix4;
            ChoixMultiple = choixMultiple;
        }

        
    }
}