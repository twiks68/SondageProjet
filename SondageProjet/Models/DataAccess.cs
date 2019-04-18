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
        {   // connection à la base de données
        
        const string ConnectionString = @"Server=.\SQLExpress;Database=StrawPoll;Integrated Security=true";

        public static ConfirmationSondageModel ChargerConfirmationLectureDepuisBDD(int idsondage)
         
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand(
                    "SELECT question, DateFinLecture FROM Livre WHERE ID = @IdSondage", connection);
                command.Parameters.AddWithValue("@IdSondage", idsondage);

                SqlDataReader reader = command.ExecuteReader();

                //On avance sur la première ligne

                reader.Read();

                string question = (string)reader["question"];
                string choix1 = (string)reader["choix1"];
                string choix2 = (string)reader["choix2"];
                string choix3 = (string)reader["choix3"];
                string choix4 = (string)reader["choix4"];
                bool choixMultiple = (bool)reader["choixMultiple"];

                Sondage modelSondage = new Sondage(question,choix1,choix2,choix3,choix4,null);
                ConfirmationLectureModel model = new ConfirmationLectureModel(modelSondage);

                return model;
            }
        }

    }
}