import 'dart:io';

import 'bdd.dart';
import 'editeur.dart';
import 'gestinEditeur.dart';
import 'ihm_1.dart';

class Ihm_1_1 {
  // Affiche la suite du menu quand on choisi la table Editeur
  static void afficherSuiteEditeur() async {
    bool valide = false;
    while (!valide) {
      print("+------------------------------------------------------------------------+\n" +
          "| Sélectionner une Options                                                |\n" +
          "| 1 - Afficher tout les éditeurs                                          |\n" +
          "| 2 - Afficher un éditeur selon un ID                                     |\n" +
          "| 3 - Afficher le nom des Editeurs                                        |\n" +
          "| R - Retour                                                              |\n" +
          "+-------------------------------------------------------------------------+");
      String choix = stdin.readLineSync().toString();
      //Affichage tout les éditeurs
      if (choix == "1") {
        print("Liste de tout les éditeurs :");
        stdout.write("-> ");
        for (Editeur edit in await GestinEditeur.selectAll()) {
          stdout.write("-> ");
          edit.afficheInfo();
        }

        valide = true;
      } //Affiche un éditeur selon un id
      else if (choix == "2") {
        bool ok = false;
        print("\nSaisir un id.");
        while (!ok) {
          try {
            int choice = int.parse(stdin.readLineSync().toString());
            ok = true;
            Editeur edit = await GestinEditeur.selectByID(choice);
            stdout.write("Résultat pour l'ID souhaiter -> ");
            edit.afficheInfo();
          } catch (e) {
            print("saisir un entier.");
          }
        }
        valide = true;
      } else if (choix == "3") {
        valide = true;
      } else if (choix == "R") {
        valide = true;
      } else {
        print("/!\\ vous devez saisir une valeur valide ! /!\\ ");
        choix = stdin.readLineSync().toString();
      }
    }
  }

  // Affiche la suite du menu quand on choisi la table Auteur
  static void afficherSuiteAuteur() {
    bool valide = false;

    while (!valide) {
      print("+------------------------------------------------------------------------+\n" +
          "| Sélectionner une Options                                                   |\n" +
          "| 1 - Afficher tout les Produits d'un Auteur                                 |\n" +
          "| 2 - Afficher tout les informations sur  les Auteurs                        |\n" +
          "| 3 - Afficher le nom des Auteurs                                            |\n" +
          "| R - Retour                                                                 |\n" +
          "+-------------------------------------------------------------------------+");
      String choix = stdin.readLineSync().toString();
      if (choix == "1") {
        valide = true;
      } else if (choix == "2") {
        valide = true;
      } else if (choix == "3") {
        valide = true;
      } else if (choix == "R") {
        valide = true;
      } else {
        print("/!\\ vous devez saisir une valeur valide ! /!\\ ");
        choix = stdin.readLineSync().toString();
      }
    }
  }

  // Affiche la suite du menu quand on choisi la table Produit
  static void afficherSuiteProduit() {
    bool valide = false;

    while (!valide) {
      print("+-------------------------------------------------------------------------+\n" +
          "| Sélectionner une Options                                                   |\n" +
          "| 1 - Afficher tout les Produits                                             |\n" +
          "| 2 - Afficher tout les informations sur Produits                            |\n" +
          "| 3 - Afficher le nom des Produits                                           |\n" +
          "| R - Retour                                                                 |\n" +
          "+-------------------------------------------------------------------------+");
      String choix = stdin.readLineSync().toString();
      if (choix == "1") {
        valide = true;
      } else if (choix == "2") {
        valide = true;
      } else if (choix == "3") {
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
