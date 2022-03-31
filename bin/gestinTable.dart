import 'package:mysql1/mysql1.dart';

import 'bdd.dart';

class GestinEditeur {
  BDD _bdd = BDD();

  static Future<void> supprimeTouteLesTables() async {
    try {
      MySqlConnection conn = await MySqlConnection.connect(BDD.getSettings());
      conn.query(
          "DROP TABLE IF EXISTS Produit;DROP TABLE IF EXISTS Auteur;DROP TABLE IF EXISTS Editeur;");
      conn.close();
    } catch (e) {
      e.toString();
    }
  }
}
