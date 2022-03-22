import 'package:mysql1/mysql1.dart';

class BDD {
  static ConnectionSettings _settings = ConnectionSettings(
    host: "localhost",
    port: 3306,
    user: "admin",
    db: "furet",
    password: "admin",
  );

  BDD();

  static ConnectionSettings getSettings() {
    return _settings;
  }
}
