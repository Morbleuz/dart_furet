import 'package:mysql1/mysql1.dart';

import 'bdd.dart';

class GestinTable {
  BDD _bdd = BDD();

  static Future<void> ajouterLesTables(ConnectionSettings settings) async {
    try {
      MySqlConnection conn = await MySqlConnection.connect(settings);
      await conn.query(
          "CREATE TABLE if not exists `Auteur` (`idAuteur` int(11) NOT NULL AUTO_INCREMENT,`nomAuteur` varchar(30) NOT NULL,`prenomAuteur` varchar(40) NOT NULL,PRIMARY KEY (`idAuteur`)) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4;");
      await conn.query(
          "CREATE TABLE if not exists `Editeur` (`idEditeur` int(11) NOT NULL AUTO_INCREMENT,`adresse` varchar(255) NOT NULL,`nomEditeur` varchar(40) NOT NULL,PRIMARY KEY (`idEditeur`)) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4;");
      await conn.query(
          "CREATE TABLE if not exists `Produit` (`idProduit` int(11) NOT NULL AUTO_INCREMENT,`type` varchar(40) NOT NULL,`prix` float NOT NULL,`quantite` int(4) NOT NULL,`AnnePAru` year(4) NOT NULL,`editeur` int(11) NOT NULL,`auteur` int(11) NOT NULL,`nomProduit` varchar(60) NOT NULL,PRIMARY KEY (`idProduit`),KEY `editeur` (`editeur`),KEY `auteur` (`auteur`),CONSTRAINT `auteur` FOREIGN KEY (`auteur`) REFERENCES `Auteur` (`idAuteur`),CONSTRAINT `editeur` FOREIGN KEY (`editeur`) REFERENCES `Editeur` (`idEditeur`)) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4;");

      conn.close();
    } catch (e) {
      e.toString();
    }
  }

  static Future<void> supprimeTouteLesTables(
      ConnectionSettings settings) async {
    try {
      MySqlConnection conn = await MySqlConnection.connect(settings);
      await conn.query("DROP TABLE IF EXISTS Produit;");
      await conn.query("DROP TABLE IF EXISTS Auteur;");
      await conn.query("DROP TABLE IF EXISTS Editeur;");
      conn.close();
    } catch (e) {
      e.toString();
    }
  }

  //Supprime une table
  static Future<void> supprimeUneTable(
      ConnectionSettings settings, String nomTable) async {
    try {
      MySqlConnection conn = await MySqlConnection.connect(settings);
      conn.query("DROP TABLE IF EXIST " + nomTable + ";");
      conn.close();
    } catch (e) {
      e.toString();
    }
  }
}
