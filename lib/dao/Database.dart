import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:valorant_self_statistics/model/Character.dart';
import 'package:valorant_self_statistics/model/Game.dart';
import 'package:valorant_self_statistics/model/Rank.dart';
import 'package:valorant_self_statistics/model/ValorantMap.dart';

class ValorantDatabase {
  static String _dbName = 'db.db';
  static final Future<Database> _database = initDatabase();

  static Future<Database> initDatabase() async {
    const initScripts = [
      "CREATE TABLE maps(name TEXT PRIMARY KEY)",
      "CREATE TABLE characters(name TEXT PRIMARY KEY)",
      "CREATE TABLE ranks(name TEXT PRIMARY KEY)",
      "CREATE TABLE games("
          "map TEXT,"
          "selectedcharacter TEXT,"
          "character2 TEXT,"
          "character3 TEXT, "
          "character4 TEXT, "
          "character5 TEXT,"
          "rankid INTEGER,"
          "wincount INTEGER,"
          "losecount INTEGER,"
          "balance INTEGER,"
          "mvpteamcount INTEGER,"
          "mvpgamecount INTEGER,"
          "ffcount INTEGER,"
          "PRIMARY KEY(map,selectedcharacter,character2,character3,character4,character5),"
          "FOREIGN KEY(selectedcharacter) REFERENCES character(name),"
          "FOREIGN KEY(character2) REFERENCES character(name),"
          "FOREIGN KEY(character3) REFERENCES character(name)"
          "FOREIGN KEY(character4) REFERENCES character(name)"
          "FOREIGN KEY(character5) REFERENCES character(name)"
          "FOREIGN KEY(map) REFERENCES map(name)"
          "FOREIGN KEY(rank) REFERENCES ranks(rank)"
    ];
    final database = openDatabase(
        // Set the path to the database. Note: Using the `join` function from the
        // `path` package is best practice to ensure the path is correctly11
        // constructed for each platform.
        join(await getDatabasesPath(), _dbName),
        onCreate: (Database db, int version) async {
      initScripts.forEach((script) async => await db.execute(script));
    },

        // Set the version. This executes the onCreate function and provides a
        // path to perform database upgrades and downgrades.
        version: 1);
    return database;
  }

  static Future<List<ValorantMap>> getValorantMapList() async {
    Database db = await _database;
    final List<Map<String, dynamic>> valorantMapsMap = await db.query("maps");
    return List.generate(valorantMapsMap.length, (i) {
      return ValorantMap(name: valorantMapsMap[i]["name"]);
    });
  }

  static Future<List<Character>> getCharactersList() async {
    Database db = await _database;
    final List<Map<String, dynamic>> characterMap =
        await db.query("characters");
    return List.generate(characterMap.length, (i) {
      return Character(name: characterMap[i]["name"]);
    });
  }

  static void populateDatabaseIfEmpty() {
    ValorantMap(name: "Icebox").insertValorantMapImage(_database);
    ValorantMap(name: "Bind").insertValorantMapImage(_database);
    ValorantMap(name: "Haven").insertValorantMapImage(_database);
    ValorantMap(name: "Split").insertValorantMapImage(_database);
    ValorantMap(name: "Ascent").insertValorantMapImage(_database);

    Character(name: "Breach").insertCharacter(_database);
    Character(name: "Brimstone").insertCharacter(_database);
    Character(name: "Cypher").insertCharacter(_database);
    Character(name: "Jett").insertCharacter(_database);
    Character(name: "Omen").insertCharacter(_database);
    Character(name: "Phoenix").insertCharacter(_database);
    Character(name: "Raze").insertCharacter(_database);
    Character(name: "Reyna").insertCharacter(_database);
    Character(name: "Sage").insertCharacter(_database);
    Character(name: "Sova").insertCharacter(_database);
    Character(name: "Viper").insertCharacter(_database);
    Character(name: "Skye").insertCharacter(_database);

    Rank(name: "Ferro 1").insertRank(_database);
    Rank(name: "Ferro 2").insertRank(_database);
    Rank(name: "Ferro 3").insertRank(_database);
    Rank(name: "Bronze 1").insertRank(_database);
    Rank(name: "Bronze 2").insertRank(_database);
    Rank(name: "Bronze 3").insertRank(_database);
    Rank(name: "Prata 1").insertRank(_database);
    Rank(name: "Prata 2").insertRank(_database);
    Rank(name: "Prata 3").insertRank(_database);
    Rank(name: "Ouro 1").insertRank(_database);
    Rank(name: "Ouro 2").insertRank(_database);
    Rank(name: "Ouro 3").insertRank(_database);
    Rank(name: "Platina 1").insertRank(_database);
    Rank(name: "Platina 2").insertRank(_database);
    Rank(name: "Platina 3").insertRank(_database);
    Rank(name: "Diamante 1").insertRank(_database);
    Rank(name: "Diamante 2").insertRank(_database);
    Rank(name: "Diamante 3").insertRank(_database);
    Rank(name: "Imortal 1").insertRank(_database);
    Rank(name: "Imortal 2").insertRank(_database);
    Rank(name: "Imortal 3").insertRank(_database);
    Rank(name: "Radiante").insertRank(_database);
  }

  static Future<List<Game>> getGames(Game game) async {
    Database db = await _database;
    final List<Map<String, dynamic>> games = await db.query("games",
        where:
            "map=? AND character2 = ? AND character3 = ? AND character4 = ? AND character5 = ?",
        whereArgs: [
          game.vMap.name,
          game.otherTeamCharacters[0],
          game.otherTeamCharacters[1],
          game.otherTeamCharacters[2],
          game.otherTeamCharacters[3]
        ],
        orderBy: "balance DESC");
    return List.generate(games.length, (i) {
      return Game(
          wincount: games[i]["wincount"],
          losecount: games[i]["losecount"],
          mvpteamcount: games[i]["mvpteamcount"],
          mvpgamecount: games[i]["mvpgamecount"],
          ffcount: games[i]["ffcount"],
          vMap: ValorantMap(name: games[i]["map"]),
          selectedCharacter: Character(name: games[i]["selectedcharacter"]),
          otherTeamCharacters: [
            Character(name: games[i]["character2"]),
            Character(name: games[i]["character3"]),
            Character(name: games[i]["character4"]),
            Character(name: games[i]["character5"])
          ]);
    });
  }

  static getAllGames() {}
}
