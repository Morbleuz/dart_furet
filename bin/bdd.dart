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
}
