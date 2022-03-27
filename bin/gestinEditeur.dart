import 'package:mysql1/mysql1.dart';

import 'bdd.dart';
import 'editeur.dart';

class GestinEditeur {
  BDD _bdd = BDD();

  //Affiche tout la table Editeurs
  static Future<List<Editeur>> selectAll() async {
    List<Editeur> editeurs = new List.empty(growable: true);
    try {
      MySqlConnection conn = await MySqlConnection.connect(BDD.getSettings());
      Results reponse = await conn.query("SELECT * from Editeur;");
      for (var row in reponse) {
        editeurs.add(
            Editeur(row[0].toString(), row[1].toString(), row[2].toString()));
      }
      conn.close();
    } catch (e) {
      e.toString();
    }

    return editeurs;
  }

  //Affiche un éditeur avec un ID
  static Future<Editeur> selectByID(int id) async {
    Editeur nouv = Editeur.vide();
    try {
      MySqlConnection conn = await MySqlConnection.connect(BDD.getSettings());

      Results reponse = await conn.query(
          "SELECT * from Editeur WHERE idEditeur=" + id.toString() + ";");

      nouv = Editeur(reponse.first[0].toString(), reponse.first[1].toString(),
          reponse.first[2].toString());

      conn.close();
    } catch (e) {
      e.toString();
    }

    return nouv;
  }

  // Modifie Le contenue dans la table Editeurs
  static Future<Editeur> updateNomByID(String nom, int id) async {
    Editeur nouv = Editeur.vide();
    try {
      MySqlConnection conn = await MySqlConnection.connect(BDD.getSettings());

      Results reponse = await conn.query("UPDATE Editeur SET nomEditeur='" +
          nom +
          "'WHERE idEditeur='" +
          id.toString() +
          "';");
      nouv = await selectByID(id);
      conn.close();
    } catch (e) {
      e.toString();
    }
    return nouv;
  }

  // Modifie l'adresse selon un id
  static Future<Editeur> updateAdresseByID(String adresse, int id) async {
    Editeur nouv = Editeur.vide();
    try {
      MySqlConnection conn = await MySqlConnection.connect(BDD.getSettings());

      Results reponse = await conn.query("UPDATE Editeur SET adresse='" +
          adresse +
          "'WHERE idEditeur='" +
          id.toString() +
          "';");
      nouv = await selectByID(id);
      conn.close();
    } catch (e) {
      e.toString();
    }
    return nouv;
  }

  static Future<Editeur> updateNomEtAdresseByID(
      String nom, String adresse, int id) async {
    Editeur nouv = Editeur.vide();
    try {
      MySqlConnection conn = await MySqlConnection.connect(BDD.getSettings());

      Results reponse = await conn.query("UPDATE Editeur SET adresse='" +
          adresse +
          "', nomEditeur='" +
          nom +
          "'WHERE idEditeur='" +
          id.toString() +
          "';");
      nouv = await selectByID(id);
      conn.close();
    } catch (e) {
      e.toString();
    }
    return nouv;
  }

  // Ajouter le contenue dans la table Editeurs
  static Future<void> addNewEditeur(String nom, String adresse) async {}
  // Supprimer le contenue dans la table Editeurs
  static Future<void> dellEditeurByID(int id) async {
    try {
      MySqlConnection conn = await MySqlConnection.connect(BDD.getSettings());

      Results reponse = await conn.query(
          "DELETE FROM Editeur where idEditeur='" + id.toString() + "';");
      conn.close();
    } catch (e) {
      e.toString();
    }
  }

  // Supprimer tous les éditeurs
  static Future<void> dellAllEditeur() async {
    try {
      MySqlConnection conn = await MySqlConnection.connect(BDD.getSettings());
      Results reponse = await conn.query("DELETE FROM Editeur;");
      conn.close();
    } catch (e) {
      e.toString();
    }
  }
}
