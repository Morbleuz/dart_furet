import 'dart:io';

import 'package:mysql1/mysql1.dart';

import 'auteur.dart';
import 'bdd.dart';
import 'editeur.dart';
import 'gestinAuteur.dart';
import 'gestinEditeur.dart';
import 'gestinProduit.dart';
import 'ihm_1.dart';
import 'ihm_auteur.dart';
import 'ihm_editeur.dart';
import 'ihm_produit.dart';
import 'produit.dart';

class IHM_CONSULTER {
  // Affiche la suite du menu quand on choisi la table Editeur
  static Future<void> afficherSuiteEditeur(ConnectionSettings settings) async {
    bool valide = false;
    while (!valide) {
      print("+------------------------------------------------------------------------+\n" +
          "| Sélectionner une Options                                                |\n" +
          "| 1 - Afficher tout les éditeurs                                          |\n" +
          "| 2 - Afficher un éditeur selon un ID                                     |\n" +
          "| 3 - Afficher le nom de tout les Editeurs                                |\n" +
          "| 4 - Afficher les adresses de tout les Editeurs                          |\n" +
          "| 5 - Afficher les éditeurs selon un nom                                  |\n" +
          "| R - Retour                                                              |\n" +
          "+-------------------------------------------------------------------------+");
      String choix = stdin.readLineSync().toString();
      //Affichage tout les éditeurs
      if (choix == "1") {
        List<Editeur> editeurs = await GestinEditeur.selectAll(settings);
        if (!editeurs.isEmpty) {
          print("\nListe de tout les éditeurs :");
          for (Editeur edit in editeurs) {
            stdout.write("-> ");
            IHM_EDITEUR.afficheInfo(edit);
          }
        } else {
          print("La table Editeur est vide.");
        }

        print("\n");
      }
      //Affiche un éditeur selon un id
      else if (choix == "2") {
        bool ok = false;
        print("\nSaisir un id.");
        while (!ok) {
          try {
            int choice = int.parse(stdin.readLineSync().toString());
            ok = true;
            Editeur edit = await GestinEditeur.selectByID(settings, choice);
            if (edit.estVide()) {
              print("L'éditeur n'existe pas");
            } else {
              stdout.write("\nRésultat pour l'ID souhaiter -> ");
              IHM_EDITEUR.afficheInfo(edit);
            }
          } catch (e) {
            print("saisir un entier.");
          }
        }
        print("\n");
      }
      //Affiche le nom de tous les éditeurs
      else if (choix == "3") {
        print("\nListe de tout les noms des éditeurs :");

        List<Editeur> editeurs = await GestinEditeur.selectAll(settings);
        for (Editeur edit in editeurs) {
          stdout.write("-> ");
          IHM_EDITEUR.afficheNom(edit);
        }
        print("\n");
      }
      //Affichage de l'adresse de tout les Editeurs
      else if (choix == "4") {
        print("\nListe de tout les éditeurs selon une adresse:");

        List<Editeur> editeurs = await GestinEditeur.selectAll(settings);
        for (Editeur edit in editeurs) {
          stdout.write("-> ");
          IHM_EDITEUR.afficheAdresse(edit);
        }
        print("\n");
      } else if (choix == "5") {
        print("Entrez un nom");
        String nom = stdin.readLineSync().toString();
        List<Editeur> editeurs = await GestinEditeur.selectByNom(settings, nom);
        if (!editeurs.isEmpty) {
          print("\nListe de tout les éditeurs :");
          for (Editeur edit in editeurs) {
            stdout.write("-> ");
            IHM_EDITEUR.afficheInfo(edit);
          }
        } else {
          print("\nAucun résultat pour le nom '" + nom + "'");
        }

        print("\n");
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

  // Affiche la suite du menu quand on choisi la table Auteur
  static Future<void> afficherSuiteAuteur(ConnectionSettings settings) async {
    bool valide = false;

    while (!valide) {
      print("+------------------------------------------------------------------------+\n" +
          "| Sélectionner une Options                                                   |\n" +
          "| 1 - Afficher tout les Produits d'un Auteur                                 |\n" +
          "| 2 - Afficher toutes les informations sur  les Auteurs                      |\n" +
          "| 3 - Afficher le nom des Auteurs                                            |\n" +
          "| R - Retour                                                                 |\n" +
          "+-------------------------------------------------------------------------+");
      String choix = stdin.readLineSync().toString();
      if (choix == "1") {
        bool ok = false;
        print("\nSaisir l'ID de l'auteur voulu.");
        while (!ok) {
          try {
            int choice = int.parse(stdin.readLineSync().toString());
            ok = true;
            Auteur auteur = await GestinAuteur.selectByID(settings, choice);
            if (auteur.estVide()) {
              print("L'auteur n'existe pas");
            } else {
              stdout.write("\n Pour l'auteur suivant -> ");
              IHM_AUTEUR.afficheInfoAuteur(auteur);

              List<Produit> lesproduits =
                  await GestinProduit.selectWithAuteur(settings, choice);
              if (!lesproduits.isEmpty) {
                print("\n Voici la liste des produits :");
                for (Produit produit in lesproduits) {
                  stdout.write(" ->");
                  IHM_PRODUIT.afficheInfo(produit);
                }
              } else {
                print("Aucun produits pour l'auteur voulu");
              }
            }
          } catch (e) {
            print("saisir un entier.");
          }
        }
        print("\n");
      } else if (choix == "2") {
        List<Auteur> newAuteur = await GestinAuteur.selectAll(settings);
        for (Auteur auteur in newAuteur) {
          stdout.write("-> ");
          IHM_AUTEUR.afficheInfoAuteur(auteur);
        }
      } else if (choix == "3") {
        List<Auteur> newAuteur = await GestinAuteur.selectAll(settings);
        for (Auteur auteur in newAuteur) {
          stdout.write("-> ");
          IHM_AUTEUR.afficheNom(auteur);
        }
      } else if (choix == "R") {
        valide = true;
      } else {
        print("/!\\ vous devez saisir une valeur valide ! /!\\ ");
        choix = stdin.readLineSync().toString();
      }
    }
  }

  // Affiche la suite du menu quand on choisi la table Produit
  static Future<void> afficherSuiteProduit(ConnectionSettings settings) async {
    bool valide = false;

    while (!valide) {
      print("+-------------------------------------------------------------------------+\n" +
          "| Sélectionner une Options                                                   |\n" +
          "| 1 - Afficher tout les Produits                                             |\n" +
          "| 2 - Afficher tout les informations sur Produits avec un ID                 |\n" +
          "| 3 - Afficher le nom des Produits                                           |\n" +
          "| R - Retour                                                                 |\n" +
          "+-------------------------------------------------------------------------+");
      String choix = stdin.readLineSync().toString();
      if (choix == "1") {
        List<Produit> produits = await GestinProduit.selectAll(settings);
        if (!produits.isEmpty) {
          print("\nListe de tout les Produits :");
          for (Produit edit in produits) {
            stdout.write("-> ");
            IHM_PRODUIT.afficheInfo(edit);
          }
          print("\n");
        } else {
          print("La table Produit est vide.");
        }
      } else if (choix == "2") {
        bool ok = false;
        print("\nSaisir un id.");
        while (!ok) {
          try {
            int choice = int.parse(stdin.readLineSync().toString());
            ok = true;
            Produit produit = await GestinProduit.selectByID(settings, choice);
            if (produit.estVide()) {
              print("Le produit n'existe pas");
            } else {
              stdout.write("\nRésultat pour l'ID souhaiter -> ");
              IHM_PRODUIT.afficheInfo(produit);
            }
          } catch (e) {
            print("saisir un entier.");
          }
        }
        print("\n");
      } else if (choix == "3") {
        List<Produit> produits = await GestinProduit.selectAll(settings);
        if (!produits.isEmpty) {
          print("\nListe de tout les noms des Produits :");
          for (Produit edit in produits) {
            stdout.write("-> ");
            IHM_PRODUIT.afficheNom(edit);
          }
          print("\n");
        } else {
          print("La table Produit est vide.");
        }
      } else if (choix == "R") {
        valide = true;
      } else {
        print("/!\\ vous devez saisir une valeur valide ! /!\\ ");
        choix = stdin.readLineSync().toString();
      }
    }
  }
}
