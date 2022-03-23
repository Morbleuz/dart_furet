import 'package:mysql1/mysql1.dart';

import 'bdd.dart';
import 'editeur.dart';

class GestinEditeur {
  BDD _bdd = BDD();

  GestinEditeur();

  //Affiche tout la table Editeurs
  static Future<List<Editeur>> selectAll() async {
    List<Editeur> editeurs = new List.empty(growable: true);
    try {
      MySqlConnection conn = await MySqlConnection.connect(BDD.getSettings());
      Results reponse = await conn.query("SELECT * from Editeur;");
      for (var row in reponse) {
        editeurs.add(
            Editeur(row[3].toString(), row[0].toString(), row[1].toString()));
      }
      conn.close();
    } catch (e) {
      e.toString();
    }

    return editeurs;
  }

  // Affiche tout les noms des Editeurs

  // Affiche tout les Informations Sur l'Editeurs

  // Modifie Le contenue dans la table Editeurs

  // Ajouter le contenue dans la table Editeurs

  // Supprimer le contenue dans la table Editeurs

}
