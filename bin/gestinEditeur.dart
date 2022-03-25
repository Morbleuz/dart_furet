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
  static Future<void> modifyByID(int id) async {}
  // Ajouter le contenue dans la table Editeurs
  static Future<void> addNewEditeur() async {}
  // Supprimer le contenue dans la table Editeurs
  static Future<void> dellEditeurByID() async {}
  // Supprimer tous les éditeurs
  static Future<void> dellAllEditeur() async {}
}
