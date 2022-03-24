import 'dart:io';

import 'ihm_1_1.dart';
import 'ihm_p.dart';

class IHM_1 {
  // Affiche les tables pour l'options 1 du ihm_P
  static Future<void> afficheMenu() async {
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
        await IHM_1_1.afficherSuiteEditeur();
      } else if (choix == "2") {
        IHM_1_1.afficherSuiteAuteur();
      } else if (choix == "3") {
        IHM_1_1.afficherSuiteProduit();
      } else if (choix == "R") {
        valide = true;
      } else {
        print("/!\\ vous devez saisir une valeur valide ! /!\\ ");
        choix = stdin.readLineSync().toString();
      }
    }
  }
}
