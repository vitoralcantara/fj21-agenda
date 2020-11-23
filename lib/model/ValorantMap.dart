import 'package:sqflite/sqflite.dart';

class ValorantMap {
  final String name;

  ValorantMap({this.name});

  Map<String, dynamic> toMap() {
    return {'name': name};
  }

  Future<void> insertValorantMapImage(Future<Database> database) async {
    // Get a reference to the database.
    final Database db = await database;

    // Insert the map into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'map',
      this.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
