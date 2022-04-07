import 'dart:io';

import 'package:mysql1/mysql1.dart';

import 'bdd.dart';
import 'editeur.dart';

class GestinEditeur {
  BDD _bdd = BDD();

  //Affiche tout la table Editeurs
  static Future<List<Editeur>> selectAll(ConnectionSettings settings) async {
    List<Editeur> editeurs = new List.empty(growable: true);
    try {
      MySqlConnection conn = await MySqlConnection.connect(settings);
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
  static Future<Editeur> selectByID(ConnectionSettings settings, int id) async {
    Editeur nouv = Editeur.vide();
    try {
      MySqlConnection conn = await MySqlConnection.connect(settings);

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

  //Affiche avec un nom
  static Future<List<Editeur>> selectByNom(
      ConnectionSettings settings, String nom) async {
    List<Editeur> editeurs = new List.empty(growable: true);
    try {
      MySqlConnection conn = await MySqlConnection.connect(settings);

      Results reponse = await conn
          .query("SELECT * from Editeur WHERE nomEditeur LIKE '" + nom + "%';");
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

  // Modifie Le contenue dans la table Editeurs
  static Future<Editeur> updateNomByID(
      ConnectionSettings settings, String nom, int id) async {
    Editeur nouv = Editeur.vide();
    try {
      MySqlConnection conn = await MySqlConnection.connect(settings);

      Results reponse = await conn.query("UPDATE Editeur SET nomEditeur='" +
          nom +
          "'WHERE idEditeur='" +
          id.toString() +
          "';");
      nouv = await selectByID(settings, id);
      conn.close();
    } catch (e) {
      e.toString();
    }
    return nouv;
  }

  // Modifie l'adresse selon un id
  static Future<Editeur> updateAdresseByID(
      ConnectionSettings settings, String adresse, int id) async {
    Editeur nouv = Editeur.vide();
    try {
      MySqlConnection conn = await MySqlConnection.connect(settings);

      Results reponse = await conn.query("UPDATE Editeur SET adresse='" +
          adresse +
          "'WHERE idEditeur='" +
          id.toString() +
          "';");
      nouv = await selectByID(settings, id);
      conn.close();
    } catch (e) {
      e.toString();
    }
    return nouv;
  }

  static Future<Editeur> updateNomEtAdresseByID(
      ConnectionSettings settings, String nom, String adresse, int id) async {
    Editeur nouv = Editeur.vide();
    try {
      MySqlConnection conn = await MySqlConnection.connect(settings);

      Results reponse = await conn.query("UPDATE Editeur SET adresse='" +
          adresse +
          "', nomEditeur='" +
          nom +
          "'WHERE idEditeur='" +
          id.toString() +
          "';");
      nouv = await selectByID(settings, id);
      conn.close();
    } catch (e) {
      e.toString();
    }
    return nouv;
  }

  // Ajouter le contenue dans la table Editeurs
  static Future<void> addNewEditeur(
      ConnectionSettings settings, String nom, String adresse) async {
    try {
      MySqlConnection conn = await MySqlConnection.connect(settings);

      conn.query("INSERT INTO Editeur(nomEditeur,adresse) VALUES ('" +
          nom +
          "', '" +
          adresse +
          "');");
      conn.close();
    } catch (e) {
      e.toString();
    }
  }

  // Supprimer le contenue dans la table Editeurs
  static Future<void> dellEditeurByID(
      ConnectionSettings settings, int id) async {
    try {
      MySqlConnection conn = await MySqlConnection.connect(settings);
      Results reponse = await conn
          .query("DELETE FROM Produit WHERE editeur='" + id.toString() + "';");
      await conn.query(
          "DELETE FROM Editeur WHERE idEditeur='" + id.toString() + "';");
      conn.close();
    } catch (e) {
      print(e.toString());
    }
  }

  // Supprimer tous les éditeurs
  static Future<void> dellAllEditeur(ConnectionSettings settings) async {
    try {
      MySqlConnection conn = await MySqlConnection.connect(settings);
      await conn.query("DELETE FROM Produit;");
      Results reponse = await conn.query("DELETE FROM Editeur;");
      conn.close();
    } catch (e) {
      e.toString();
    }
  }
}
