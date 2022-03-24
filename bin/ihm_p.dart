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
        "| 3 - Insérer une donée                  |\n" +
        "| 4 - Supprimer une ou plusieurs données |\n" +
        "| 5 - Tester la connexion à la BDD       |\n" +
        "| Q - Quitter le programme               |\n" +
        "+----------------------------------------+");
  }

  //Affichage du menu principale
  static Future<void> afficheMenu() async {
    bool valide = false;
    while (!valide) {
      vueDuMenu();
      String choix = stdin.readLineSync().toString();
      if (choix == "1") {
        await IHM_1.afficheMenu();
      } else if (choix == "2") {
        await IHM_2.afficherMenu();
      } else if (choix == "3") {
      } else if (choix == "4") {
      } else if (choix == "5") {
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
