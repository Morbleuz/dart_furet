import 'produit.dart';

class IHM_PRODUIT {
  static void afficheInfo(Produit produit) {
    print(produit.getId() +
        ", " +
        produit.getType() +
        ", " +
        produit.getPrix() +
        ", " +
        produit.getQuantite() +
        ", " +
        produit.getAnneParu() +
        ", " +
        produit.getAuteur() +
        ", " +
        produit.getEditeur());
  }

  static void afficheType(Produit produit) {
    print(produit.getType());
  }

  static void affichePrix(Produit produit) {
    print(produit.getPrix());
  }

  static void afficheQuantite(Produit produit) {
    print(produit.getQuantite());
  }

  static void afficheAnneParu(Produit produit) {
    print(produit.getAnneParu());
  }

  static void afficheAuteur(Produit produit) {
    print(produit.getAuteur());
  }

  static void afficheNom(Produit produit) {
    print(produit.getNomProduit());
  }
}
