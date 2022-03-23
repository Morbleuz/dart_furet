class Auteur {
  int _idAuteur;
  String _nomAuteur;
  String _prenomAuteur;

  Auteur(this._idAuteur, this._nomAuteur, this._prenomAuteur);

  @override
  String toString() {
    // TODO: implement toString
    return this._idAuteur.toString() +
        ", " +
        this._nomAuteur.toString() +
        ", " +
        this._prenomAuteur.toString() +
        "\n";
  }
}
