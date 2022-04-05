import 'dart:io';

import 'auteur.dart';
import 'editeur.dart';
import 'gestinAuteur.dart';
import 'gestinEditeur.dart';
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
      print("Entrez le prix");
      double prix = double.parse(stdin.readLineSync().toString());
      print("Entrez la quantité");
      int quantite = int.parse(stdin.readLineSync().toString());
      print("Entrez l'année de parution");
      int AnneParu = int.parse(stdin.readLineSync().toString());
      print("Entrez l'id de l'editeur.");
      bool edi = false;

      while (!edi) {
        int editeur = int.parse(stdin.readLineSync().toString());
        Editeur edit = await GestinEditeur.selectByID(editeur);
        if (!edit.estVide()) {
          edi = true;
          print("Entrez l'id de l'auteur.");
          bool au = false;
          while (!au) {
            int auteur = int.parse(stdin.readLineSync().toString());
            /*Auteur aut = await GestinAuteur.selectByID(auteur);
            if (!aut.estvide()) {
              au = true;
            } else {
              print("L'auteur choisit n'existe pas, veuillez choisir un auteur existant.");
            }*/
          }
        } else {
          print("L'éditeur souhaitez n'existe pas");
        }
      }
    }
  }
}
