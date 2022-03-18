import 'auteur.dart';
import 'editeur.dart';

class Produit {
  int _idProduit;
  Auteur _auteur;
  Editeur _editeur;
  String _type;
  double _prix;
  int _quantite;
  String _AnneParu;

  Produit(this._idProduit, this._auteur, this._editeur, this._type,
      this._AnneParu, this._prix, this._quantite);
}
