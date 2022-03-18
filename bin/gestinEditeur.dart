import 'package:mysql1/mysql1.dart';

import 'bdd.dart';
import 'editeur.dart';

class GestinEditeur {
  BDD _bdd = BDD();

  GestinEditeur();

  Future<List<Editeur>> selectAll() async {
    List<Editeur> editeurs = new List.empty(growable: true);
    try {
      MySqlConnection conn = await MySqlConnection.connect(_bdd.getSettings());
      Results reponse = await conn.query("SELECT * from Editeur");
      for (var row in reponse) {
        editeurs.add(
            Editeur(row[3].toString(), row[0].toString(), row[1].toString()));
      }
    } catch (e) {
      e.toString();
    }
    return editeurs;
  }
}
