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
  static Future<Produit> selectByID() async {
    Produit produit = Produit.vide();
    return produit;
  }

  //Ajoute un nouveau Produit
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
