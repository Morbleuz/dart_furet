import 'dart:io';
import 'bdd.dart';
import 'ihm_1.dart';
import 'ihm_2.dart';

class IHM_P {
  //Affichage du menu
  static void vueDuMenu() {
    print("+----------------------------------------+\n" +
        "| 1 - Consulter une table                |\n" +
        "| 2 - Modifier le contenu d'une table    |\n" +
        "| 3 - Inséer une donée                   |\n" +
        "| 4 - Supprimer une ou plusieurs données |\n" +
        "| 5 - Tester la connexion à la BDD       |\n" +
        "| Q - Quitter le programme               |\n" +
        "+----------------------------------------+");
  }

  static void afficheMenu() async {
    bool valide = false;
    while (!valide) {
      vueDuMenu();
      String choix = stdin.readLineSync().toString();
      if (choix == "1") {
        valide = true;
        IHM_1.afficheMenu();
      } else if (choix == "2") {
        valide = true;
        Ihm_2.afficherChoisirTable();
      } else if (choix == "3") {
        valide = true;
      } else if (choix == "4") {
        valide = true;
      } else if (choix == "5") {
        valide = true;
        if (!await BDD.testConnection()) {
          print("Connexion impossible");
        } else {
          print("Connexion réussie !");
        }
      } else if (choix == "Q") {
        valide = true;
      } else {
        print("/!\\ vous devez saisir une valeur valide ! /!\\ ");
        choix = stdin.readLineSync().toString();
      }
    }
  }
}
