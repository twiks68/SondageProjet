using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using SondageProjet.Controllers;

namespace SondageProjet.Models
{
    public class DataAccess
    {
           // connection à la base de données
        
        const string ConnectionString = @"Server=.\SQLExpress;Database=SondageProjet;Integrated Security=true";

        public static int CreationSondage (Sondage creationSondage)
         
        {
           

            // using ouvre et ferme automatiquement la BDD
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                
                connection.Open();

                SqlCommand insererSondageBDD = new SqlCommand(
                    "INSERT INTO Sondage (Question, Choix1, Choix2, Choix3, Choix4, IsChoixMultiple, IsDisabled, NumProtection)" +
                    "OUTPUT INSERTED.IdSondage VALUES (@DescriptionSondage, @IsChoixMultiple, @IsDisabled, @NumProtection)", connection);
                // OUTPUT INSERTED sert à récuperer l'ID
                insererSondageBDD.Parameters.AddWithValue("@DescriptionSondage", creationSondage.Question);
                insererSondageBDD.Parameters.AddWithValue("@IsChoixMultiple", creationSondage.Choix1);
                insererSondageBDD.Parameters.AddWithValue("@IsChoixMultiple", creationSondage.Choix2);
                insererSondageBDD.Parameters.AddWithValue("@IsChoixMultiple", creationSondage.Choix3);
                insererSondageBDD.Parameters.AddWithValue("@IsChoixMultiple", creationSondage.Choix4);
                insererSondageBDD.Parameters.AddWithValue("@IsDisabled", creationSondage.@IsDisabled);
                insererSondageBDD.Parameters.AddWithValue("@NumProtection", creationSondage.NumProtection);
                SqlDataReader reader = insererSondageBDD.ExecuteReader();

                //On avance sur la première ligne

               int recupererIdSondage = (int)insererSondageBDD.ExecuteScalar();


                

                return recupererIdSondage;
            }
        }

    }
}