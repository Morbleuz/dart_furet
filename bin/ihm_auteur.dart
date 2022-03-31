import 'auteur.dart';

class IHM_AUTEUR {
  static void afficheInfoAuteur(Auteur auteur) {
    print(auteur.getIdAuteur() +
        ", " +
        auteur.getNomAuteur() +
        ", " +
        auteur.getPrenomAuteur());
  }

  static void afficheNom(Auteur auteur) {
    print(auteur.getNomAuteur());
  }

  //Affichage de l'addresse de l'auteur
  static void affichePrenom(Auteur auteur) {
    print(auteur.getPrenomAuteur());
  }
}
