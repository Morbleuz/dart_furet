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

  void afficheType(Produit produit) {
    print(produit.getType());
  }

  void affichePrix(Produit produit) {
    print(produit.getPrix());
  }

  void afficheQuantite(Produit produit) {
    print(produit.getQuantite());
  }

  void afficheAnneParu(Produit produit) {
    print(produit.getAnneParu());
  }

  void afficheAuteur(Produit produit){}
}
