import 'dart:io';

import 'package:mysql1/mysql1.dart';

import 'editeur.dart';
import 'gestinAuteur.dart';
import 'gestinEditeur.dart';
import 'gestinProduit.dart';
import 'ihm_auteur.dart';
import 'ihm_editeur.dart';
import 'auteur.dart';
import 'ihm_p.dart';
import 'ihm_produit.dart';
import 'produit.dart';

class IHM_MODIF {
  //Faire les mofif dans la table editeur
  static Future<void> afficheModifEditeur(ConnectionSettings settings) async {
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
            Editeur edit =
                await GestinEditeur.updateNomByID(settings, nouvnom, choice);
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
            Editeur edit = await GestinEditeur.updateAdresseByID(
                settings, nouvnom, choice);
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
            Editeur edit = await GestinEditeur.updateNomEtAdresseByID(
                settings, nom, adresse, id);
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
      }
    }
  }

  static Future<void> affichemodifAuteur(ConnectionSettings settings) async {
    bool valide = false;
    while (!valide) {
      print("+------------------------------------------------------------------------+\n" +
          "| Sélectionner une Options                                                |\n" +
          "| 1 - Modifier le nom avec un ID                                          |\n" +
          "| 2 - Modifier le prenom avec un ID                                       |\n" +
          "| 3 - Modifer le nom et prenom avec un ID                              |\n" +
          "| R - Retour                                                              |\n" +
          "+-------------------------------------------------------------------------+");
      String choix = stdin.readLineSync().toString();
      //Affichage tout les Auteurs
      if (choix == "1") {
        bool ok = false;
        print("\nSaisir un id.");
        while (!ok) {
          try {
            int choice = int.parse(stdin.readLineSync().toString());
            ok = true;
            print("Saisir le nouveau nom");
            String nouvnom = stdin.readLineSync().toString();
            Auteur edit =
                await GestinAuteur.updateNomByID(settings, nouvnom, choice);
            if (!edit.estVide()) {
              stdout.write(
                  "L'Auteur modifié contient maintenant les valeurs suivante -> ");
              IHM_AUTEUR.afficheInfoAuteur(edit);
            } else {
              print(
                  "L'utilisateur que vous avez souhaiter modifié n'exsite pas.");
            }
          } catch (e) {
            print("saisir un entier.");
          }
        }
      } else if (choix == "2") {
        bool ok = false;
        print("\nSaisir un id.");
        while (!ok) {
          try {
            int choice = int.parse(stdin.readLineSync().toString());
            ok = true;
            print("Saisir le nouveau prenom");
            String nouvprenom = stdin.readLineSync().toString();
            Auteur edit = await GestinAuteur.updatePrenomById(
                settings, nouvprenom, choice);
            if (!edit.estVide()) {
              stdout.write(
                  "L'Auteur modifié contient maintenant les valeurs suivante -> ");
              IHM_AUTEUR.afficheInfoAuteur(edit);
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
            int choice = int.parse(stdin.readLineSync().toString());
            ok = true;
            print("Saisir le nouveau nom");
            String nouvnom = stdin.readLineSync().toString();
            print("Saisir le nouveau prenom");
            String nouvprenom = stdin.readLineSync().toString();

            Auteur edit = await GestinAuteur.updateNomEtPrenomByID(
                settings, nouvnom, nouvprenom, choice);
            if (!edit.estVide()) {
              stdout.write(
                  "L'Auteur modifié contient maintenant les valeurs suivante -> ");
              IHM_AUTEUR.afficheInfoAuteur(edit);
            } else {
              print(
                  "L'utilisateur que vous avez souhaiter modifié n'exsite pas.");
            }
          } catch (e) {
            print("saisir un entier.");
          }
        }
      } else if (choix == "R") {
        valide = true;
      }
    }
  }

  static Future<void> affichemodifProduit(ConnectionSettings settings) async {
    bool valide = false;
    while (!valide) {
      print("+------------------------------------------------------------------------+\n" +
          "| Sélectionner une Options                                                |\n" +
          "| 1 - Modifier le nom avec un ID                                          |\n" +
          "| 2 - Modifier le prix avec un ID                                         |\n" +
          "| 3 - Modifer la quantite avec un ID                                      |\n" +
          "| R - Retour                                                              |\n" +
          "+-------------------------------------------------------------------------+");
      String choix = stdin.readLineSync().toString();
      //Affichage tout les Auteurs
      if (choix == "1") {
        bool ok = false;
        print("\nSaisir un id.");
        while (!ok) {
          try {
            int choice = IHM_P.saisieInt();
            ok = true;
            print("Saisir le nouveau nom");
            String nouvnom = IHM_P.saisieString();
            Produit edit =
                await GestinProduit.updateNomByID(settings, nouvnom, choice);
            if (!edit.estVide()) {
              stdout.write(
                  "Le produit modifié contient maintenant les valeurs suivante -> ");
              IHM_PRODUIT.afficheInfo(edit);
            } else {
              print("Le produit que vous avez souhaiter modifié n'exsite pas.");
            }
          } catch (e) {
            print("saisir un entier.");
          }
        }
      } else if (choix == "2") {
        bool ok = false;
        print("\nSaisir un id.");
        while (!ok) {
          try {
            int choice = IHM_P.saisieInt();
            ok = true;
            print("Saisir le nouveau prix");
            double nouvprix = IHM_P.saisieDouble();
            Produit edit =
                await GestinProduit.updatePrixByID(settings, nouvprix, choice);
            if (!edit.estVide()) {
              stdout.write(
                  "Le produit modifié contient maintenant les valeurs suivante -> ");
              IHM_PRODUIT.affichePrix(edit);
            } else {
              print("Le produit que vous avez souhaiter modifié n'exsite pas.");
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
            int choice = IHM_P.saisieInt();
            ok = true;
            print("Saisir la nouvelle quantite");
            int nouvquantite = IHM_P.saisieInt();

            Produit edit = await GestinProduit.updateQuantiteByID(
                settings, nouvquantite, choice);
            if (!edit.estVide()) {
              stdout.write(
                  "Le produit modifié contient maintenant les valeurs suivante -> ");
              IHM_PRODUIT.afficheQuantite(edit);
            } else {
              print("Le produit que vous avez souhaiter modifié n'exsite pas.");
            }
          } catch (e) {
            print("saisir un entier.");
          }
        }
      } else if (choix == "R") {
        valide = true;
      }
    }
  }
}
