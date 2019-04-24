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


        // création de sondage ds la BDD en insérant les champs correspondant en récupérant l'id associé (avec output inserted)
        public static int CreationSondage(Sondage creationSondage)

        {
            // using ouvre et ferme automatiquement la BDD
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {

                connection.Open();

                int recupererIdSondage = 0;
                SqlCommand insererSondageBDD = new SqlCommand(
                    "INSERT INTO Sondage (Question, Choix1, Choix2, Choix3, Choix4, IsChoixMultiple, IsDisabled, NumProtection)" +
                    "OUTPUT INSERTED.IdSondage VALUES (@question, @choix1, @choix2, @choix3, @choix4,@isChoixMultiple, @isDisabled, @numProtection)", connection);
                // OUTPUT INSERTED sert à récuperer l'ID
                insererSondageBDD.Parameters.AddWithValue("@question", creationSondage.Question);
                insererSondageBDD.Parameters.AddWithValue("@choix1", creationSondage.Choix1);
                insererSondageBDD.Parameters.AddWithValue("@choix2", creationSondage.Choix2);
                insererSondageBDD.Parameters.AddWithValue("@choix3", creationSondage.Choix3);
                insererSondageBDD.Parameters.AddWithValue("@choix4", creationSondage.Choix4);
                insererSondageBDD.Parameters.AddWithValue("@isChoixMultiple", creationSondage.IsChoixMultiple);
                insererSondageBDD.Parameters.AddWithValue("@isDisabled", creationSondage.IsDisabled);
                insererSondageBDD.Parameters.AddWithValue("@numProtection", creationSondage.NumProtection);
                //SqlDataReader reader = insererSondageBDD.ExecuteReader();

                //On avance sur la première ligne

                recupererIdSondage = (int)insererSondageBDD.ExecuteScalar(); // ExecuteScalar(): 
                return recupererIdSondage;
            }
        }

        // Création dans la table réponse de la BDD les champs séléctionné par l'utilisateur dans la view Formulaire
        public static void CreationReponse(int idSondage)

        {
            Reponse model = new Reponse(idSondage);
            using (SqlConnection connection = new SqlConnection(ConnectionString))

            // NombreVoteC1 ... C : correspond à choix 1; dans la BDD dans table Reponse NombreVoteC1: cela signifie Nombre vite pour choix1

            {
                connection.Open();
                SqlCommand insererReponseBDD = new SqlCommand("INSERT INTO Reponse(NombreVoteC1, NombreVoteC2, NombreVoteC3, NombreVoteC4, NombreTotalVote, FKIdSondage) VALUES (@nombreVoteC1,@nombreVoteC2,@nombreVoteC3,@nombreVoteC4,@nombreTotalVote,@fKIdSondage)", connection);
                insererReponseBDD.Parameters.AddWithValue("@nombreVoteC1", model.NombreVoteC1);  // 0 : ???
                insererReponseBDD.Parameters.AddWithValue("@nombreVoteC2", model.NombreVoteC2);
                insererReponseBDD.Parameters.AddWithValue("@nombreVoteC3", model.NombreVoteC3);
                insererReponseBDD.Parameters.AddWithValue("@nombreVoteC4", model.NombreVoteC4);
                insererReponseBDD.Parameters.AddWithValue("@nombreTotalVote", model.NombreTotalVote);
                insererReponseBDD.Parameters.AddWithValue("@fKIdSondage", idSondage); // != avt 0:?

                insererReponseBDD.ExecuteNonQuery(); // ExecuteNonQuery():
                                                     // ExecuteReader():
                                                     // dataReader.Read():
            }

        }

        //Mise à jour des champs de la table réponse

        public static void InsertionVoteBDD(int idSondage, int nouveauChoix1, int nouveauChoix2, int nouveauChoix3, int nouveauChoix4)
        {
            int nouveauNombreTotal = nouveauChoix1 + nouveauChoix2 + nouveauChoix3 + +nouveauChoix4;
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                connection.Open();
                SqlCommand miseAjourTableReponse = new SqlCommand("UPDATE Reponse SET NombreVoteC1 = NombreVoteC1 + @nouveauChoix1, NombreVoteC2 = NombreVoteC2 + @nouveauChoix2, NombreVoteC3 = NombreVoteC3 + @nouveauChoix3, NombreVoteC4 = NombreVoteC4 + @nouveauChoix4,NombreTotalVote = NombreTotalVote + @nouveauNombreTotal WHERE FKIdSondage = @idSondage", connection);
                miseAjourTableReponse.Parameters.AddWithValue("@nouveauChoix1", nouveauChoix1);
                miseAjourTableReponse.Parameters.AddWithValue("@nouveauChoix2", nouveauChoix2);
                miseAjourTableReponse.Parameters.AddWithValue("@nouveauChoix3", nouveauChoix3);
                miseAjourTableReponse.Parameters.AddWithValue("@nouveauChoix4", nouveauChoix4);
                miseAjourTableReponse.Parameters.AddWithValue("@nouveauNombreTotal", nouveauNombreTotal);
                miseAjourTableReponse.Parameters.AddWithValue("@idSondage", idSondage);
                miseAjourTableReponse.ExecuteNonQuery();
            }
        }

        // Afficher tout le sondage dans la view Vote en récupérant les champs enrégistrés grâce à l'IdSondage 

        public static Sondage Vote(int idSondage)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                connection.Open();
                SqlCommand afficherSondageBDD = new SqlCommand("Select * FROM Sondage WHERE IdSondage=@idSondage", connection);
                afficherSondageBDD.Parameters.AddWithValue("@idSondage", idSondage);
                SqlDataReader dataReader = afficherSondageBDD.ExecuteReader();
                dataReader.Read();

                // on est obligé de caster les élémts de la bdd lors de la récupération
                int idReponse = (int)dataReader["IdSondage"];
                string question = (string)dataReader["Question"];
                string choix1 = (string)dataReader["Choix1"];
                string choix2 = (string)dataReader["Choix2"];
                string choix3 = (string)dataReader["Choix3"];
                string choix4 = (string)dataReader["Choix4"];
                bool isChoixMultiple = (bool)dataReader["IsChoixMultiple"]; 
                bool isDisabled = (bool)dataReader["IsDisabled"];
                int numProtection = (int)dataReader["NumProtection"];

                Sondage sondage = new Sondage(idReponse, question, choix1, choix2, choix3, choix4, isChoixMultiple, isDisabled, numProtection);

                return sondage;
            }
        }


        // RECUPERATION RESULTAT BDD POUR RESULTAT SONDAGE 
        public static Reponse AfficherQuestionReponse(int idSondage)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                connection.Open();

                SqlCommand afficherQuestionReponse = new SqlCommand(@"SELECT * FROM Sondage,Reponse WHERE IdSondage = @IdSondage and FKIdSondage = @IdSondage", connection);

                afficherQuestionReponse.Parameters.AddWithValue("@IdSondage", idSondage);
                SqlDataReader reader = afficherQuestionReponse.ExecuteReader();

                reader.Read();
                // Table Sondage
                
                int idsondage = (int)reader["IdSondage"]; // plus claire mais dangereux si je rechange nom dans la BDD
                string question = (string)reader["Question"];
                string choix1 = (string)reader["Choix1"];
                string choix2 = (string)reader["Choix2"];
                string choix3 = (string)reader["Choix3"];
                string choix4 = (string)reader["Choix4"];
                //bool isChoixMultiple = (bool)reader["Choix4"];  fonctionne pas 
               // bool isDisabled = (bool)reader.GetBoolean["IsDisabled"]; fonctionne pas
                bool isChoixMultiple = reader.GetBoolean(6);
                bool isDisabled = reader.GetBoolean(7);
                int numProtection = (int)reader["NumProtection"];


                // Table Reponse
                int nombreVoteC1 = (int)reader["NombreVoteC1"];
                int nombreVoteC2 = (int)reader["NombreVoteC2"];
                int nombreVoteC3 = (int)reader["NombreVoteC3"];
                int nombreVoteC4 = (int)reader["NombreVoteC4"];
                int nombreTotalVote = (int)reader["NombreTotalVote"];
                int fKIdSondage = (int)reader["FKIdSondage"];


                Sondage sondage = new Sondage(idsondage, question, choix1, choix2, choix3, choix4, isChoixMultiple, isDisabled, numProtection);
                Reponse vote = new Reponse(sondage,nombreVoteC1, nombreVoteC2, nombreVoteC3, nombreVoteC4, nombreTotalVote, fKIdSondage);

                return vote;
            }
        }
        // désactiver le sondage avec condition si present return true sinon false
        public static bool DesactiverSondage(int idSondage, int numProtection, out Sondage proprieteSondage)
        
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                connection.Open();

                SqlCommand recupererSondage = new SqlCommand(@"SELECT * FROM Sondage WHERE IdSondage = @IdSondage and NumProtection = @numProtection", connection);

                recupererSondage.Parameters.AddWithValue("@IdSondage", idSondage);
                recupererSondage.Parameters.AddWithValue("@numProtection", numProtection);
                SqlDataReader reader = recupererSondage.ExecuteReader();

                proprieteSondage = new Sondage(idSondage, numProtection);

                if (reader.Read())
                {                 
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        // Mise a jour dans la BDD
        public static void MiseAJour(Sondage sondage)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("UPDATE Sondage SET IsDisabled = 1  WHERE IdSondage= @idSondage ", connection);
                command.Parameters.AddWithValue("@idSondage", sondage.IdSondage);
                command.ExecuteNonQuery();
            }
        }
    }
}
