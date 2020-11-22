import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Db {
  static String _dbName = 'db.db';
  static final Future<Database> _database = initDatabase();

  static Future initDatabase() async {
    const initScripts = [
      "CREATE TABLE map(name TEXT PRIMARY KEY)",
      "CREATE TABLE character(name TEXT PRIMARY KEY)",
      "CREATE TABLE game("
          "map TEXT,"
          "selectedcharacter TEXT,"
          "character2 TEXT,"
          "character3 TEXT, "
          "character4 TEXT, "
          "character5 TEXT,"
          "wincount INTEGER,"
          "losecount INTEGER,"
          "PRIMARY KEY(map,selectedcharacter,character2,character3,character4,character5),"
          "FOREIGN KEY(selectedcharacter) REFERENCES character(name),"
          "FOREIGN KEY(character2) REFERENCES character(name),"
          "FOREIGN KEY(character3) REFERENCES character(name)"
          "FOREIGN KEY(character4) REFERENCES character(name)"
          "FOREIGN KEY(character5) REFERENCES character(name)"
          "FOREIGN KEY(map) REFERENCES map(name)",
    ];
    final database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly11
      // constructed for each platform.
      join(await getDatabasesPath(), _dbName),
      onCreate: (Database db, int version) async {
        initScripts.forEach((script) async => await db.execute(script));
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        if (oldVersion == 1) {
          await db.execute(initScripts[1]);
        }
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
    return database;
  }
}
