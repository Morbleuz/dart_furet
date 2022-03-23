import 'dart:io';

import 'bdd.dart';
import 'editeur.dart';
import 'gestinEditeur.dart';
import 'ihm_1.dart';

class Ihm_1_1 {
  // Affiche la suite du menu quand on choisi la table Editeur
  static void afficherSuiteEditeur() {
    print("+------------------------------------------------------------------------+\n" +
        "| Sélectionner une Options                                                  |\n" +
        "| 1 - Afficher tout les Produits d'un Editeurs                            |\n" +
        "| 2 - Afficher tout les informations sur  les Editeurs                    |\n" +
        "| 3 - Afficher le nom des Editeurs                                        |\n" +
        "| R - Retour                                                              |\n" +
        "+-------------------------------------------------------------------------+");
    bool valide = false;
    String choix = stdin.readLineSync().toString();
    while (!valide) {
      if (choix == "1") {
        GestinEditeur.selectAll();
        valide = true;
      } else if (choix == "2") {
        valide = true;
      } else if (choix == "3") {
        valide = true;
      } else if (choix == "R") {
        IHM_1.afficheMenu1();
      } else {
        print("/!\\ vous devez saisir une valeur valide ! /!\\ ");
        choix = stdin.readLineSync().toString();
      }
    }
  }

  // Affiche la suite du menu quand on choisi la table Auteur
  static void afficherSuiteAuteur() {
    print("+------------------------------------------------------------------------+\n" +
        "| Sélectionner une Options                                                   |\n" +
        "| 1 - Afficher tout les Produits d'un Auteur                                 |\n" +
        "| 2 - Afficher tout les informations sur  les Auteurs                        |\n" +
        "| 3 - Afficher le nom des Auteurs                                            |\n" +
        "| R - Retour                                                                 |\n" +
        "+-------------------------------------------------------------------------+");
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
        IHM_1.afficheMenu1();
      } else {
        print("/!\\ vous devez saisir une valeur valide ! /!\\ ");
        choix = stdin.readLineSync().toString();
      }
    }
  }

  // Affiche la suite du menu quand on choisi la table Produit
  static void afficherSuiteProduit() {
    print("+-------------------------------------------------------------------------+\n" +
        "| Sélectionner une Options                                                   |\n" +
        "| 1 - Afficher tout les Produits                                             |\n" +
        "| 2 - Afficher tout les informations sur Produits                            |\n" +
        "| 3 - Afficher le nom des Produits                                           |\n" +
        "| R - Retour                                                                 |\n" +
        "+-------------------------------------------------------------------------+");
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
        IHM_1.afficheMenu1();
      } else {
        print("/!\\ vous devez saisir une valeur valide ! /!\\ ");
        choix = stdin.readLineSync().toString();
      }
    }
  }
}
