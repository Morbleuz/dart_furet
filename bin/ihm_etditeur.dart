import 'editeur.dart';

//Création d'une class spéciale pour la vue de l'éditeur

class IHM_EDITEUR {
  //Affichage de toutes les informations d'un éditeur
  static void afficheInfo(Editeur editeur) {
    print(editeur.getId() +
        ", " +
        editeur.getAdresse() +
        ", " +
        editeur.getNom());
  }

  //Affichage du nom d'un éditeur
  static void afficheNom(Editeur editeur) {
    print(editeur.getNom());
  }

  //Affichage de l'addresse de l'auteur
  static void afficheAdresse(Editeur editeur) {
    print(editeur.getAdresse());
  }
}
