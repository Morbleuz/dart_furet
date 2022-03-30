import 'auteur.dart';
import 'editeur.dart';

class Produit {
  String _idProduit = "";
  String _nomProduit = "";
  String _auteur = "";
  String _editeur = "";
  String _type = "";
  String _prix = "";
  String _quantite = "";
  String _AnneParu = "";

  Produit(this._idProduit, this._auteur, this._editeur, this._type,
      this._AnneParu, this._prix, this._quantite, this._nomProduit);
  Produit.vide();

  bool estVide() {
    bool vide = false;
    if (this._AnneParu == "" &&
        this._auteur == "" &&
        this._editeur == "" &&
        this._prix == "" &&
        this._idProduit == "" &&
        this._quantite == "" &&
        this._type == "" &&
        this._nomProduit == "") {
      vide = true;
    }
    return vide;
  }

  String getId() {
    return this._idProduit;
  }

  String getAuteur() {
    return this._auteur;
  }

  String getEditeur() {
    return this._editeur;
  }

  String getType() {
    return this._type;
  }

  String getPrix() {
    return this._type;
  }

  String getQuantite() {
    return this._quantite;
  }

  String getAnneParu() {
    return this._AnneParu;
  }

  String getNomProduit() {
    return this._nomProduit;
  }
}
