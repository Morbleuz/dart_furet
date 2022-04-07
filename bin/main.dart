import 'package:mysql1/mysql1.dart';
import 'bdd.dart';
import 'ihm_p.dart';

void main(List<String> arguments) async {
  IHM_P.afficheTitre();
  ConnectionSettings settings = IHM_P.parametreConnexion();
  while (await BDD.testConnection(settings) == false) {
    print("Connexion impossible, ressaisir les données.\n");
    settings = IHM_P.parametreConnexion();
  }
  await IHM_P.afficheMenu(settings);
  IHM_P.afficheFin();
}
