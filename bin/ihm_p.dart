import 'dart:io';
import 'package:mysql1/mysql1.dart';

import 'bdd.dart';
import 'ihm_1.dart';
import 'ihm_2.dart';
import 'ihm_3.dart';
import 'ihm_4.dart';
import 'ihm_5.dart';

class IHM_P {
  static double saisieDouble() {
    bool valideDouble = false;
    double nombre = 0;
    while (!valideDouble) {
      try {
        nombre = double.parse(stdin.readLineSync().toString());
        valideDouble = true;
      } catch (e) {
        print("Erreur dans la saisie.");
      }
    }
    return nombre;
  }

  static int saisieAnnee() {
    bool valideAnnee = false;
    int annee = 0;
    while (!valideAnnee) {
      try {
        annee = int.parse(stdin.readLineSync().toString());
        if (annee < 9999 && annee > -9999) {
          valideAnnee = true;
        } else {
          print("Rentrer une année entre -9999 et 9999");
        }
      } catch (e) {
        print("Erreur dans la saisie");
      }
    }

    return annee;
  }

  static int saisieInt() {
    bool valideInt = false;
    int nombre = 0;
    while (!valideInt) {
      try {
        nombre = int.parse(stdin.readLineSync().toString());
        valideInt = true;
      } catch (e) {
        print("Erreur dans la saisie.");
      }
    }
    return nombre;
  }

  static String saisieString() {
    bool valideString = false;
    String s = "";
    while (!valideString) {
      try {
        s = stdin.readLineSync().toString();
        valideString = true;
      } catch (e) {
        print(e.toString());
      }
    }
    return s;
  }

  //Prends les paramètres de connexion
  static ConnectionSettings parametreConnexion() {
    print("Entrez le nom de la base de donnée");
    String bdd = saisieString();
    print("Entrez le nom de l'utilisateur");
    String user = saisieString();
    print("Entrez le mot de passe de l'utilisateur");
    String password = saisieMotDePasse();
    ConnectionSettings parametre = ConnectionSettings(
      host: "localhost",
      port: 3306,
      user: user,
      db: bdd,
      password: password,
    );
    return parametre;
  }

  //Affichage du titre
  static void afficheTitre() {
    print("" +
        "  ___              _     ______              _   \n" +
        "|  __ \\           | |   |  ____|            | |  \n" +
        "| |  | | __ _ _ __| |_  | |__ _   _ _ __ ___| |_ \n" +
        "| |  | |/ _` | '__| __| |  __| | | | '__/ _ \\ __|\n" +
        "| |__| | (_| | |  | |_  | |  | |_| | | |  __/ |_ \n" +
        "|_____/ \\__,_|_|   \\__| |_|   \\__,_|_|  \\___|\\__|\n");
  }

  //Affichage de l'écran de fin
  static void afficheFin() {
    print("" +
        " ______                       _                  \n" +
        "|  ____|                     | |                 \n" +
        "| |__ ___ _ __ _ __ ___   ___| |_ _   _ _ __ ___ \n" +
        "|  __/ _ \\ '__| '_ ` _ \\ / _ \\ __| | | | '__/ _ \\\n" +
        "| | |  __/ |  | | | | | |  __/ |_| |_| | | |  __/\n" +
        "|_|  \\___|_|  |_| |_| |_|\\___|\\__|\\__,_|_|  \\___|\n");
  }

  //Saisie d'un mot de pass
  static String saisieMotDePasse() {
    bool saisieValide = false;
    String s = "";
    while (!saisieValide) {
      try {
        stdin.echoMode = false;
        s = stdin.readLineSync().toString();
        saisieValide = true;
        stdin.echoMode = true;
      } catch (e) {
        print("Erreur dans la saisie.");
      }
    }
    return s;
  }

  //Affichage du menu
  static void vueDuMenu() {
    print("+----------------------------------------+\n" +
        "| 1 - Consulter une table                |\n" +
        "| 2 - Modifier le contenu d'une table    |\n" +
        "| 3 - Insérer une donnée                 |\n" +
        "| 4 - Supprimer une ou plusieurs données |\n" +
        "| 5 - Gestion des tables                 |\n" +
        "| 6 - Tester la connexion à la BDD       |\n" +
        "| Q - Quitter le programme               |\n" +
        "+----------------------------------------+");
  }

  //Affichage du menu principale
  static Future<void> afficheMenu(ConnectionSettings settings) async {
    bool valide = false;
    while (!valide) {
      vueDuMenu();
      String choix = stdin.readLineSync().toString();
      if (choix == "1") {
        await IHM_1.afficherMenu(settings);
      } else if (choix == "2") {
        await IHM_2.afficherMenu(settings);
      } else if (choix == "3") {
        await IHM_3.afficherMenu(settings);
      } else if (choix == "4") {
        await IHM_4.afficherMenu(settings);
      } else if (choix == "5") {
        await IHM_5.afficherMenu(settings);
      } else if (choix == "6") {
        if (!await BDD.testConnection(settings)) {
          print("Connexion impossible");
        } else {
          print("Connexion réussie !");
        }
      } else if (choix == "Q") {
        valide = true;
      } else {
        print("/!\\ vous devez saisir une valeur valide ! /!\\ ");
      }
    }
  }
}
