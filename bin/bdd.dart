import 'package:mysql1/mysql1.dart';

class BDD {
  static final ConnectionSettings _settings = ConnectionSettings(
    host: "localhost",
    port: 3306,
    user: "admin",
    db: "furet",
    password: "admin",
  );

  static ConnectionSettings getSettings() {
    return _settings;
  }

  static Future<bool> testConnection() async {
    bool valide = false;
    try {
      MySqlConnection con = await MySqlConnection.connect(_settings);
      con.close();
      valide = true;
    } catch (e) {
      print(e.toString());
    }
    return valide;
  }
}
