import 'auteur.dart';
import 'bdd.dart';
import 'package:mysql1/mysql1.dart';

class GestinAuteur {
  BDD _bdd = BDD();

  static Future<List<Auteur>> selectAll() async {
    List<Auteur> auteur = new List.empty(growable: true);
    try {
      MySqlConnection conn = await MySqlConnection.connect(BDD.getSettings());
      Results reponse = await conn.query("SELECT * from Auteur;");
      for (var row in reponse) {
        auteur.add(
            Auteur(row[0].toString(), row[1].toString(), row[2].toString()));
      }
      conn.close();
    } catch (e) {
      e.toString();
    }

    return auteur;
  }

  static Future<Auteur> selectByID(int id) async {
    Auteur nouv = Auteur.vide();
    try {
      MySqlConnection conn = await MySqlConnection.connect(BDD.getSettings());

      Results reponse = await conn
          .query("SELECT * from Auteur WHERE idAuteur=" + id.toString() + ";");

      nouv = Auteur(reponse.first[0].toString(), reponse.first[1].toString(),
          reponse.first[2].toString());

      conn.close();
    } catch (e) {
      e.toString();
    }
    return nouv;
  }

  static Future<List<Auteur>> selectByNom(String nom) async {
    List<Auteur> auteur = new List.empty(growable: true);
    try {
      MySqlConnection conn = await MySqlConnection.connect(BDD.getSettings());

      Results reponse = await conn
          .query("SELECT * from Auteur WHERE nomAuteur LIKE '" + nom + "%';");
      for (var row in reponse) {
        auteur.add(
            Auteur(row[0].toString(), row[1].toString(), row[2].toString()));
      }

      conn.close();
    } catch (e) {
      e.toString();
    }
    return auteur;
  }

  static Future<Auteur> updateNomByID(String nom, int id) async {
    Auteur nouv = Auteur.vide();
    try {
      MySqlConnection conn = await MySqlConnection.connect(BDD.getSettings());

      Results reponse = await conn.query("UPDATE Auteur SET nomAuteur='" +
          nom +
          "'WHERE idAuteur='" +
          id.toString() +
          "';");
      nouv = await selectByID(id);
      conn.close();
    } catch (e) {
      e.toString();
    }
    return nouv;
  }

  static Future<Auteur> updatePrenomById(String prenom, int id) async {
    Auteur nouv = Auteur.vide();
    try {
      MySqlConnection conn = await MySqlConnection.connect(BDD.getSettings());

      Results reponse = await conn.query("UPDATE Auteur SET prenomAuteur='" +
          prenom +
          "'WHERE idAuteur='" +
          id.toString() +
          "';");
      nouv = await selectByID(id);
      conn.close();
    } catch (e) {
      e.toString();
    }
    return nouv;
  }

  static Future<void> addNewAuteur(String nom, String prenom) async {
    try {
      MySqlConnection conn = await MySqlConnection.connect(BDD.getSettings());

      conn.query("INSERT INTO Auteur(nomAuteur,prenomAuteur) VALUES ('" +
          nom +
          "', '" +
          prenom +
          "');");
      conn.close();
    } catch (e) {
      e.toString();
    }
  }

  // Supprimer le contenue dans la table Editeurs
  static Future<void> dellAuteurByID(int id) async {
    try {
      MySqlConnection conn = await MySqlConnection.connect(BDD.getSettings());
      Results reponse = await conn
          .query("DELETE FROM Produit WHERE auteur='" + id.toString() + "';");
      await conn
          .query("DELETE FROM Auteur WHERE idAuteur='" + id.toString() + "';");
      conn.close();
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> dellAllAuteur() async {
    try {
      MySqlConnection conn = await MySqlConnection.connect(BDD.getSettings());
      await conn.query("DELETE FROM Produit;");
      Results reponse = await conn.query("DELETE FROM Auteur;");
      conn.close();
    } catch (e) {
      e.toString();
    }
  }

  static Future<Auteur> updateNomEtPrenomByID(
      String nom, String prenom, int id) async {
    Auteur nouv = Auteur.vide();
    try {
      MySqlConnection conn = await MySqlConnection.connect(BDD.getSettings());

      Results reponse = await conn.query("UPDATE Auteur SET prenomAuteur='" +
          prenom +
          "', nomAuteur='" +
          nom +
          "'WHERE idAuteur='" +
          id.toString() +
          "';");
      nouv = await selectByID(id);
      conn.close();
    } catch (e) {
      e.toString();
    }
    return nouv;
  }
}
