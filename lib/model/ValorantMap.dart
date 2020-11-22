import 'package:sqflite/sqflite.dart';

class Map {
  final String name;

  Map({this.name});

  Map<String, dynamic> toMap() {
    return {'name': name};
  }

  Future<void> insertMapImage(Future<Database> database, Tax tax) async {
    // Get a reference to the database.
    final Database db = await database;

    // Insert the map into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'tax',
      this.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
