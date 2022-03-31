class Auteur {
  String _idAuteur = "";
  String _nomAuteur = "";
  String _prenomAuteur = "";

  Auteur(this._idAuteur, this._nomAuteur, this._prenomAuteur);
  //Constructeur pour créer un Auteur vide.
  Auteur.vide();

  //Tout les getters
  //Méthode pour savoir si l'auteur est vide

  String getIdAuteur() {
    return this._idAuteur;
  }

  String getNomAuteur() {
    return this._nomAuteur;
  }

  String getPrenomAuteur() {
    return this._prenomAuteur;
  }

  void setIdAuteur(String IdAuteur) {
    this._idAuteur = IdAuteur;
  }

  void setNomAuteur(String NomAuteur) {
    this._nomAuteur = NomAuteur;
  }

  void setPrenomAuteur(String PrenomAuteur) {
    this._prenomAuteur = PrenomAuteur;
  }
}
