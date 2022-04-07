import 'package:mysql1/mysql1.dart';

import 'auteur.dart';
import 'bdd.dart';
import 'gestinAuteur.dart';
import 'produit.dart';

class GestinProduit {
  BDD _bdd = BDD();

  //Update le nom d'un produit par rapport à un id
  //Update le prix d'un produit par rapport à un id
  //Update la quantité d'un produit par rapport à un id

  //Affichage de tout les produits
  static Future<List<Produit>> selectAll(ConnectionSettings settings) async {
    List<Produit> produits = [];
    try {
      MySqlConnection conn = await MySqlConnection.connect(settings);
      Results reponse = await conn.query("SELECT * from Produit;");
      for (var row in reponse) {
        produits.add(Produit(
            row[0].toString(),
            row[1].toString(),
            row[2].toString(),
            row[3].toString(),
            row[4].toString(),
            row[5].toString(),
            row[6].toString(),
            row[7].toString()));
      }
      conn.close();
    } catch (e) {
      e.toString();
    }

    return produits;
  }

  //Selection d'un produit par rapport à un auteur
  static Future<List<Produit>> selectWithAuteur(
      ConnectionSettings settings, int id) async {
    List<Produit> lesProduits = [];
    try {
      Auteur auteur = await GestinAuteur.selectByID(settings, id);
      if (!auteur.estVide()) {
        MySqlConnection conn = await MySqlConnection.connect(settings);
        Results reponse = await conn.query(
            "Select * from Produit where auteur='" +
                auteur.getIdAuteur() +
                "';");
        for (var row in reponse) {
          lesProduits.add(Produit(
              row[0].toString(),
              row[1].toString(),
              row[2].toString(),
              row[3].toString(),
              row[4].toString(),
              row[5].toString(),
              row[6].toString(),
              row[7].toString()));
        }

        conn.close();
      }
    } catch (e) {}
    return lesProduits;
  }

  //Affichage par ID
  static Future<Produit> selectByID(ConnectionSettings settings, int id) async {
    Produit nouv = Produit.vide();
    try {
      MySqlConnection conn = await MySqlConnection.connect(settings);

      Results reponse = await conn.query(
          "SELECT * from Produit WHERE idProduit=" + id.toString() + ";");

      nouv = Produit(
          reponse.first[0].toString(),
          reponse.first[1].toString(),
          reponse.first[2].toString(),
          reponse.first[3].toString(),
          reponse.first[4].toString(),
          reponse.first[5].toString(),
          reponse.first[6].toString(),
          reponse.first[7].toString());

      conn.close();
    } catch (e) {
      e.toString();
    }

    return nouv;
  }

  //Ajoute un nouveau Produit
  static Future<void> addNewProduit(
      ConnectionSettings settings,
      String type,
      String prix,
      String quantite,
      String annePAru,
      String editeur,
      String auteur,
      String nomProduit) async {
    try {
      MySqlConnection conn = await MySqlConnection.connect(BDD.getSettings());

      conn.query(
          "insert into Produit(type,prix,quantite,AnnePAru,editeur,auteur,nomProduit) VALUES ('" +
              type +
              "', " +
              prix +
              "," +
              quantite +
              ",'" +
              annePAru +
              "'," +
              editeur +
              "," +
              auteur +
              ",'" +
              nomProduit +
              "');");
      conn.close();
    } catch (e) {
      print(e.toString());
    }
  }

  //Enlève tout les produits
  static Future<void> dellAllProduit(ConnectionSettings settings) async {
    try {
      MySqlConnection conn = await MySqlConnection.connect(settings);
      conn.query("DELETE from Produit;");
      conn.close();
    } catch (e) {
      e.toString();
    }
  }

  //Enlève un Produit
  static Future<List<Produit>> DellProduitByID(
      ConnectionSettings settings, int idProduit) async {
    List<Produit> produits = new List.empty(growable: true);
    try {
      MySqlConnection conn = await MySqlConnection.connect(settings);
      conn.query("DELETE from Produit WHERE idProduit = '" +
          idProduit.toString() +
          "';");
      conn.close();
    } catch (e) {
      e.toString();
    }
    return produits;
  }
}
