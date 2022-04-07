import 'dart:io';
import 'package:mysql1/mysql1.dart';

import 'ihm_modif.dart';
import 'ihm_p.dart';

class IHM_2 {
  // Affiche les tables pour l'options 2 du ihm_P
  static Future<void> afficherMenu(ConnectionSettings settings) async {
    bool valide = false;

    while (!valide) {
      print("+----------------------------------------+\n" +
          "| Sélectionner une table                 |\n" +
          "| 1 - Editeur                            |\n" +
          "| 2 - Auteur                             |\n" +
          "| 3 - Produit                            |\n" +
          "| R - Retour                             |\n" +
          "+----------------------------------------+");

      String choix = stdin.readLineSync().toString();
      if (choix == "1") {
        await IHM_MODIF.afficheModifEditeur(settings);
      } else if (choix == "2") {
        await IHM_MODIF.affichemodifAuteur(settings);
      } else if (choix == "3") {
        await IHM_MODIF.affichemodifProduit(settings);
      } else if (choix == "R") {
        valide = true;
      } else {
        print("/!\\ vous devez saisir une valeur valide ! /!\\ ");
        choix = stdin.readLineSync().toString();
      }
    }
  }
}
