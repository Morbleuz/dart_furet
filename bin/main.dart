import 'package:mysql1/mysql1.dart';
import 'bdd.dart';
import 'ihm_p.dart';

void main(List<String> arguments) async {
  IHM_P.afficheTitre();
  await IHM_P.afficheMenu();
  IHM_P.afficheFin();
}
