import 'dart:io';

import 'editeur.dart';
import 'gestinEditeur.dart';
import 'ihm_editeur.dart';

class IHM_MODIF {
  //Faire les mofif dans la table editeur
  static Future<void> afficheModifEditeur() async {
    bool valide = false;
    while (!valide) {
      print("+------------------------------------------------------------------------+\n" +
          "| Sélectionner une Options                                                |\n" +
          "| 1 - Modifier le nom avec un ID                                          |\n" +
          "| 2 - Modifier l'adresse avec un ID                                       |\n" +
          "| 3 - Modifer le nom et l'adresse avec un ID                              |\n" +
          "| R - Retour                                                              |\n" +
          "+-------------------------------------------------------------------------+");
      String choix = stdin.readLineSync().toString();
      //Affichage tout les éditeurs
      if (choix == "1") {
        bool ok = false;
        print("\nSaisir un id.");
        while (!ok) {
          try {
            int choice = int.parse(stdin.readLineSync().toString());
            ok = true;
            print("Saisir le nouveau nom");
            String nouvnom = stdin.readLineSync().toString();
            Editeur edit = await GestinEditeur.updateNomByID(nouvnom, choice);
            if (!edit.estVide()) {
              stdout.write(
                  "L'éditeur modifié contient maintenant les valeurs suivante -> ");
              IHM_EDITEUR.afficheInfo(edit);
            } else {
              print(
                  "L'utilisateur que vous avez souhaiter modifié n'exsite pas.");
            }
          } catch (e) {
            print("saisir un entier.");
          }
        }
      }
      //Affiche un éditeur selon un id
      else if (choix == "2") {
        bool ok = false;
        print("\nSaisir un id.");
        while (!ok) {
          try {
            int choice = int.parse(stdin.readLineSync().toString());
            ok = true;
            print("Saisir la nouvelle adresse");
            String nouvnom = stdin.readLineSync().toString();
            Editeur edit =
                await GestinEditeur.updateAdresseByID(nouvnom, choice);
            if (!edit.estVide()) {
              stdout.write(
                  "L'éditeur modifié contient maintenant les valeurs suivante -> ");
              IHM_EDITEUR.afficheInfo(edit);
            } else {
              print(
                  "L'utilisateur que vous avez souhaiter modifié n'exsite pas.");
            }
          } catch (e) {
            print("saisir un entier.");
          }
        }
      } else if (choix == "3") {
        bool ok = false;
        print("\nSaisir un id.");
        while (!ok) {
          try {
            int id = int.parse(stdin.readLineSync().toString());
            ok = true;
            print("Saisir la nouvelle adresse");
            String adresse = stdin.readLineSync().toString();
            print("Saisir le nouveau nom");
            String nom = stdin.readLineSync().toString();
            Editeur edit =
                await GestinEditeur.updateNomEtAdresseByID(nom, adresse, id);
            if (!edit.estVide()) {
              stdout.write(
                  "L'éditeur modifié contient maintenant les valeurs suivante -> ");
              IHM_EDITEUR.afficheInfo(edit);
            } else {
              print(
                  "L'utilisateur que vous avez souhaiter modifié n'exsite pas.");
            }
          } catch (e) {
            print("saisir un entier.");
          }
        }
      }
      //Fin du l'affichage du menu, bool valide = vrai
      else if (choix == "R") {
        valide = true;
      }
      //Aucun des choix n'est possible donc on recommence la boucle while avec la saisie
      else {
        print("/!\\ vous devez saisir une valeur valide ! /!\\ ");
        choix = stdin.readLineSync().toString();
      }
    }
  }
}
