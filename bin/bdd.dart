import 'package:mysql1/mysql1.dart';

class BDD {
  //Les settings de la base de donnée
  static final ConnectionSettings _settings = ConnectionSettings(
    host: "localhost",
    port: 3306,
    user: "admin",
    db: "furet",
    password: "admin",
  );

  //Getter des settings
  static ConnectionSettings getSettings() {
    return _settings;
  }

  //Test de la connexion qui renvoie vrai ou faux en fonction de la connexion à la base de donnée
  static Future<bool> testConnection(ConnectionSettings settings) async {
    bool valide = false;
    try {
      MySqlConnection con = await MySqlConnection.connect(settings);
      con.close();
      valide = true;
    } catch (e) {
      e.toString();
    }
    return valide;
  }
}
