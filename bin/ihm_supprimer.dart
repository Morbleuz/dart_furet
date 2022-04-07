import 'dart:io';

import 'package:mysql1/mysql1.dart';

import 'editeur.dart';
import 'gestinAuteur.dart';
import 'gestinEditeur.dart';
import 'gestinProduit.dart';
import 'ihm_editeur.dart';
import 'auteur.dart';
import 'produit.dart';

class IHM_SUPPRIMER {
  static Future<void> afficheSuiteProduit(ConnectionSettings settings) async {
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
            Produit produit = await GestinProduit.selectByID(settings, id);
            if (!produit.estVide()) {
              await GestinProduit.DellProduitByID(settings, id);
              print(
                  "Suppression de l'utilisateur portant l'id " + id.toString());
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
            "/!\\ Vous êtes sur le point de supprimer toutes les données de Editeur mais égalemment de Produit, êtes vous sur ? (y/n) /!\\");
        String sup = stdin.readLineSync().toString();
        if (sup == "y") {
          await GestinProduit.dellAllProduit(settings);
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

  static Future<void> afficherSuiteEditeur(ConnectionSettings settings) async {
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
            Editeur edit = await GestinEditeur.selectByID(settings, id);
            if (!edit.estVide()) {
              await GestinEditeur.dellEditeurByID(settings, id);
              print(
                  "Suppression de l'utilisateur portant l'id " + id.toString());
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
            "/!\\ Vous êtes sur le point de supprimer toutes les données de Editeur mais égalemment de Produit, êtes vous sur ? (y/n) /!\\");
        String sup = stdin.readLineSync().toString();
        if (sup == "y") {
          await GestinEditeur.dellAllEditeur(settings);
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

  static Future<void> afficherSuiteAuteur(ConnectionSettings settings) async {
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
            Auteur edit = await GestinAuteur.selectByID(settings, id);
            if (!edit.estVide()) {
              await GestinAuteur.dellAuteurByID(settings, id);
              print(
                  "Suppression de l'utilisateur portant l'id " + id.toString());
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
            "/!\\ Vous êtes sur le point de supprimer toutes les données de Auteur mais égalemment de Produit, êtes vous sur ? (y/n) /!\\");
        String sup = stdin.readLineSync().toString();
        if (sup == "y") {
          await GestinAuteur.dellAllAuteur(settings);
          print("Suppresion de toutes les données.");
        } else {
          print("Retour");
        }
      } else if (choix == "R") {
        valide = true;
      }
    }
  }
}
