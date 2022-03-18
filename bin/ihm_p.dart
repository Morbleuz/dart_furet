import 'dart:io';

import 'bdd.dart';

class IHM_P {
  //Affichage du menu
  static void afficheMenu() {
    print("+----------------------------------------+\n" +
        "| 1 - Consulter une table                |\n" +
        "| 2 - Modifier le contenu d'une table    |\n" +
        "| 3 - Inséer une donée                   |\n" +
        "| 4 - Supprimer une ou plusieurs données |\n" +
        "| Q - Quitter le programme               |\n" +
        "+----------------------------------------+");
    String choix = stdin.readLineSync().toString();
    bool valide = false;
    while (!valide) {
      if (choix == "1") {
        valide = true;
      } else if (choix == "2") {
        valide = true;
      } else if (choix == "3") {
        valide = true;
      } else if (choix == "4") {
        valide = true;
      } else if (choix == "Q") {
        valide = true;
      } else {
        print("/!\\ vous devez saisir une valeur valide ! /!\\ ");
        choix = stdin.readLineSync().toString();
      }
    }
  }

  static void selectMenu() {}
}
