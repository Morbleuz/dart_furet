import 'dart:io';

import 'ihm_1_1.dart';
import 'ihm_p.dart';

class IHM_1 {
  // Affiche les tables pour l'options 1 du ihm_P
  static void afficheMenu() {
    print("+----------------------------------------+\n" +
        "| Sélectionner une table                 |\n" +
        "| 1 - Editeur                            |\n" +
        "| 2 - Auteur                             |\n" +
        "| 3 - Produit                            |\n" +
        "| R - Retour                             |\n" +
        "+----------------------------------------+");
    bool valide = false;
    String choix = stdin.readLineSync().toString();
    while (!valide) {
      if (choix == "1") {
        Ihm_1_1.afficherSuiteEditeur();
        valide = true;
      } else if (choix == "2") {
        Ihm_1_1.afficherSuiteAuteur();
        valide = true;
      } else if (choix == "3") {
        Ihm_1_1.afficherSuiteProduit();
        valide = true;
      } else if (choix == "R") {
        valide = true;
      } else {
        print("/!\\ vous devez saisir une valeur valide ! /!\\ ");
        choix = stdin.readLineSync().toString();
      }
    }
  }
}
