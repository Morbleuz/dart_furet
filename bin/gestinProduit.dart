import 'package:mysql1/mysql1.dart';

import 'bdd.dart';
import 'produit.dart';

class GestinProduit {
  BDD _bdd = BDD();

  //Affichage de tout les produits
  static Future<List<Produit>> selectAll() async {
    List<Produit> produits = new List.empty(growable: true);
    try {
      MySqlConnection conn = await MySqlConnection.connect(BDD.getSettings());
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

  //Affichage par ID
  static Future<Produit> selectByID(int id) async {
    Produit nouv = Produit.vide();
    try {
      MySqlConnection conn = await MySqlConnection.connect(BDD.getSettings());

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
  static Future<void> addNewProduit(String type, String prix, String quantite,
      String annePAru, String editeur, String auteur, String nomProduit) async {
    try {
      MySqlConnection conn = await MySqlConnection.connect(BDD.getSettings());

      conn.query(
          "insert into Produit(type,prix,quantite,AnnePAru,editeur,auteur,nomProduit) VALUES ('" +
              type +
              "', " +
              prix +
              "," +
              quantite +
              "," +
              annePAru +
              "," +
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

  //Enlève un Produit
  static Future<List<Produit>> DellProduitByID(int idProduit) async {
    List<Produit> produits = new List.empty(growable: true);
    try {
      MySqlConnection conn = await MySqlConnection.connect(BDD.getSettings());
      Results reponse = await conn.query(
          "DELETE from Produit WHERE id = " + idProduit.toString() + ";");
      conn.close();
    } catch (e) {
      e.toString();
    }
    return produits;
  }
}
