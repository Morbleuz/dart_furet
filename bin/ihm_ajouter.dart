import 'dart:io';

import 'auteur.dart';
import 'editeur.dart';
import 'gestinAuteur.dart';
import 'gestinEditeur.dart';
import 'gestinProduit.dart';
import 'ihm_auteur.dart';
import 'ihm_editeur.dart';

class IHM_AJOUTER {
  static Future<void> afficherSuiteEditeur() async {
    bool valide = false;
    while (!valide) {
      print("Entrez le nom de l'éditeur.");
      String nom = stdin.readLineSync().toString();
      print("Entrez l'adresse de l'éditeur.");
      String adresse = stdin.readLineSync().toString();
      try {
        await GestinEditeur.addNewEditeur(nom, adresse);
        print("Ajout de l'utilisateur -> " + nom + ", " + adresse);
      } catch (e) {
        print("Erreur : " + e.toString());
      }

      print("Voulez vous continuer à ajouter des éditeurs ? (y/n)");
      String reponse = stdin.readLineSync().toString();
      if (reponse == "n") {
        valide = true;
      }
    }
  }

  static Future<void> afficheSuiteAuteur() async {
    bool valide = false;
    while (!valide) {
      print("Entrer le nom de l'auteur");
      String nomAuteur = stdin.readLineSync().toString();
      print("Entrer le prenom de l'auteur");
      String prenomAuteur = stdin.readLineSync().toString();
      try {
        await GestinAuteur.addNewAuteur(nomAuteur, prenomAuteur);
        print("Ajout de l'utilisateur -> " + nomAuteur + ", " + prenomAuteur);
      } catch (e) {
        print(e.toString());
      }

      print("Voulez vous continuer à ajouter des Auteurs ? (y/n)");
      String reponse = stdin.readLineSync().toString();
      if (reponse == "n") {
        valide = true;
      }
    }
  }

  static Future<void> afficheSuiteProduit() async {
    bool valide = false;
    while (!valide) {
      print("Entrez le nom du produit.");
      String nomProduit = stdin.readLineSync().toString();
      print("Entrez le type.");
      String type = stdin.readLineSync().toString();
      try {
        print("Entrez le prix");
        double prix = double.parse(stdin.readLineSync().toString());
        try {
          print("Entrez la quantité");
          int quantite = int.parse(stdin.readLineSync().toString());
          bool anneeValide = false;
          while (!anneeValide) {
            try {
              print("Entrez l'année de parution");
              int anneePAru = int.parse(stdin.readLineSync().toString());
              if (anneePAru < 9999 && anneePAru > 0) {
                anneeValide = true;
                bool editvalide = false;
                while (!editvalide) {
                  try {
                    print("Saisir l'id de l'éditeur");
                    int editeur = int.parse(stdin.readLineSync().toString());
                    Editeur edit = await GestinEditeur.selectByID(editeur);
                    if (!edit.estVide()) {
                      editvalide = true;
                      bool auteurValide = false;
                      while (!auteurValide) {
                        try {
                          print("Saisir l'id de l'auteur");
                          int auteur =
                              int.parse(stdin.readLineSync().toString());
                          Auteur auteu = await GestinAuteur.selectByID(auteur);

                          if (!auteu.estVide()) {
                            auteurValide = true;
                            valide = true;
                            try {
                              await GestinProduit.addNewProduit(
                                  type.toString(),
                                  prix.toString(),
                                  quantite.toString(),
                                  anneePAru.toString(),
                                  editeur.toString(),
                                  auteur.toString(),
                                  nomProduit.toString());
                            } catch (e) {
                              print(e.toString());
                            }
                          }
                        } catch (e) {
                          print("Saisir une valeur valide");
                        }
                      }
                    } else {
                      print("L'éditeur n'existe pas, essayez avec un autre");
                    }
                  } catch (e) {
                    print("Saisir une valeur valide");
                  }
                }
              } else {
                print("Saisir une année valide");
              }
            } catch (e) {
              print("Saisir une année valide");
            }
          }
        } catch (e) {
          print("Saisir une valeur valide");
        }
      } catch (e) {
        print("Saisir une valeur valide");
      }
    }
  }
}
