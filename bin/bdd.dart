import 'package:mysql1/mysql1.dart';

class BDD {
  final ConnectionSettings _settings = ConnectionSettings(
    host: "localhost",
    port: 3306,
    user: "admin",
    db: "furet",
    password: "admin",
  );

  BDD();

  ConnectionSettings getSettings() {
    return this._settings;
  }
}
