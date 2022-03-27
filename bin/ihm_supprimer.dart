import 'dart:io';

import 'editeur.dart';
import 'gestinEditeur.dart';
import 'ihm_editeur.dart';

class IHM_SUPPRIMER {
  static Future<void> afficherSuiteEditeur() async {
    bool valide = false;
    while (!valide) {
      print("+------------------------------------------------------------------------+\n" +
          "| Sélectionner une Options                                                |\n" +
          "| 1 - Supprimer avec un ID                                                |\n" +
          "| 2 - Supprimer l'ensemble des données                                    |\n" +
          "| R - Retour                                                              |\n" +
          "+-------------------------------------------------------------------------+");
      String choix = stdin.readLineSync().toString();
      if (choix == "1") {
        bool ok = false;
        print("\nSaisir un id.");
        while (!ok) {
          try {
            int id = int.parse(stdin.readLineSync().toString());
            ok = true;
            Editeur edit = await GestinEditeur.selectByID(id);
            if (!edit.estVide()) {
              print(
                  "Suppression de l'utilisateur portant l'id " + id.toString());
              GestinEditeur.dellEditeurByID(id);
            } else {
              print(
                  "L'utilisateur que vous avez souhaiter supprimer n'exsite pas.");
            }
          } catch (e) {
            print("saisir un entier.");
          }
        }
      } else if (choix == "2") {
        print(
            "/!\\ Vous êtes sur le point de supprimer toutes les données, êtes vous sur ? (y/n) /!\\");
        String sup = stdin.readLineSync().toString();
        if (sup == "y") {
          await GestinEditeur.dellAllEditeur();
          print("Suppresion de toutes les données.");
        } else {
          print("Retour");
        }
      } else if (choix == "R") {
        valide = true;
      } else {
        print("/!\\ vous devez saisir une valeur valide ! /!\\ ");
      }
    }
  }
}
