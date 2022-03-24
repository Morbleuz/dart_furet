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

  //Permet de savoir si l'éditeur est vide
  bool estVide() {
    bool vide = false;
    if (this._idEditeur == "" &&
        this._adresse == "" &&
        this._nomEditeur == "") {
      vide = true;
    }
    return vide;
  }

  //Getter
  String getId() {
    return this._idEditeur;
  }

  String getAdresse() {
    return this._adresse;
  }

  String getNom() {
    return this._nomEditeur;
  }
}
