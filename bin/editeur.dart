class Editeur {
  String _idEditeur = "";
  String _adresse = "";
  String _nomEditeur = "";

  Editeur(this._idEditeur, this._adresse, this._nomEditeur);
  Editeur.vide() {
    this._idEditeur = "";
    this._adresse = "";
    this._nomEditeur = "";
  }
  void afficheInfo() {
    print(this._idEditeur + ", " + this._adresse + ", " + this._nomEditeur);
  }
}
