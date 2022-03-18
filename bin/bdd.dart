import 'package:mysql1/mysql1.dart';

class BDD {
  final ConnectionSettings _settings = ConnectionSettings(
    host: "localhost",
    port: 3306,
    user: "admin",
    db: "furet",
    password: "admin",
  );
  late MySqlConnection _conn;

  BDD() {
    connect();
  }

  void connect() async {
    try {
      this._conn = await MySqlConnection.connect(this._settings);
      print("Vous êtes bien connecter");
    } catch (e) {
      e.toString();
    }
  }

  void close() {
    this._conn.close();
    print("Vous êtes bien deconnecter");
  }

  //Selectionner table
  void selectionTable(String table) async {
    try {
      connect();
      Results reponse = await this._conn.query("SELECT * FROM " + table);
      for (var row in reponse) {
        for (var field in row) {
          print(field.toString());
        }
      }

      close();
    } catch (e) {
      print(e.toString());
    }
  }
}
