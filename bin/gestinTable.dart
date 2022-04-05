import 'package:mysql1/mysql1.dart';

import 'bdd.dart';

class GestinTable {
  BDD _bdd = BDD();

  static Future<void> supprimeTouteLesTables() async {
    try {
      MySqlConnection conn = await MySqlConnection.connect(BDD.getSettings());
      conn.query("DROP TABLE IF EXISTS Produit;");
      conn.query("DROP TABLE IF EXISTS Auteur;");
      conn.query("DROP TABLE IF EXISTS Editeur;");
      conn.close();
    } catch (e) {
      e.toString();
    }
  }

  //Supprime une table
  static Future<void> supprimeUneTable(String nomTable) async {
    try {
      MySqlConnection conn = await MySqlConnection.connect(BDD.getSettings());
      conn.query("DROP TABLE IF EXIST " + nomTable + ";");
      conn.close();
    } catch (e) {
      e.toString();
    }
  }
}
