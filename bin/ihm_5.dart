import 'dart:io';

import 'package:mysql1/mysql1.dart';

import 'gestinTable.dart';
import 'ihm_ajouter.dart';
import 'ihm_supprimer.dart';

class IHM_5 {
  static Future<void> afficherMenu(ConnectionSettings settings) async {
    bool valide = false;

    while (!valide) {
      print("+----------------------------------------+\n" +
          "| Sélectionner une option :              |\n" +
          "| 1 - Ajouter l'ensemble des tables      |\n" +
          "| 2 - Supprimer toutes les tables        |\n" +
          "| R - Retour                             |\n" +
          "+----------------------------------------+");

      String choix = stdin.readLineSync().toString();
      if (choix == "1") {
        await IHM_AJOUTER.afficheSuiteTable(settings);
      } else if (choix == "2") {
        await IHM_SUPPRIMER.afficheSuiteTables(settings);
      } else if (choix == "R") {
        valide = true;
      } else {
        print("/!\\ vous devez saisir une valeur valide ! /!\\ ");
        choix = stdin.readLineSync().toString();
      }
    }
  }
}
