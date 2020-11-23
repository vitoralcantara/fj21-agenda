import 'package:sqflite/sqflite.dart';
import 'package:valorant_self_statistics/dao/Database.dart';
import 'package:valorant_self_statistics/model/Character.dart';

import 'ValorantMap.dart';

class Game {
  final ValorantMap vMap;
  final Character selectedCharacter;
  List<Character> otherTeamCharacters = [
    new Character(),
    new Character(),
    new Character(),
    new Character()
  ];

  final int wincount;
  final int losecount;
  final int mvpcount;

  Game(
      {this.wincount,
      this.losecount,
      this.vMap,
      this.selectedCharacter,
      this.otherTeamCharacters,
      this.mvpcount});

  int getBalance() {
    return wincount + mvpcount - losecount;
  }

  Map<String, dynamic> toMap() {
    otherTeamCharacters.sort((a, b) {
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });

    return {
      'map': vMap.name,
      'selectedcharacter': selectedCharacter.name,
      'character2': otherTeamCharacters[0].name,
      'character3': otherTeamCharacters[1].name,
      'character4': otherTeamCharacters[2].name,
      'character5': otherTeamCharacters[3].name,
      'wincount': wincount,
      'losecount': losecount,
      'mvpcount': getBalance()
    };
  }

  Future<void> insertMapImage(Future<Database> database, Game game) async {
    // Get a reference to the database.
    final Database db = await database;

    // Insert the map into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'game',
      this.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  String getSelectedMap() {
    return vMap.name;
  }

  String getSelectedCharacter2() {
    return otherTeamCharacters[0].name;
  }

  String getSelectedCharacter3() {
    return otherTeamCharacters[1].name;
  }

  String getSelectedCharacter4() {
    return otherTeamCharacters[2].name;
  }

  Future<List<Game>> getProbabilities() async {
    otherTeamCharacters.sort((a, b) {
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });
    List<Game> games = await ValorantDatabase.getGames(this);
    return games;
  }
}
