import 'dart:io';
import 'ihm_p.dart';

class Ihm_2 {
  // Affiche les tables pour l'options 2 du ihm_P
  static void afficherChoisirTable() {
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
        valide = true;
      } else if (choix == "2") {
        valide = true;
      } else if (choix == "3") {
        valide = true;
      } else if (choix == "R") {
        valide = true;
        IHM_P.afficheMenu();
      } else {
        print("/!\\ vous devez saisir une valeur valide ! /!\\ ");
        choix = stdin.readLineSync().toString();
      }
    }
  }
}
