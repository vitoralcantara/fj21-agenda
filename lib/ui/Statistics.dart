import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valorant_self_statistics/dao/Database.dart';
import 'package:valorant_self_statistics/model/Game.dart';

import '../main.dart';

class Statistics extends StatefulWidget {
  Statistics() {}

  @override
  State<StatefulWidget> createState() => _Statistics();
}

class _Statistics extends State<Statistics> {
  String valorantMapDropDownValue;
  String selectedCharacter;
  List<String> otherTeamCharacters = ["", "", "", ""];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text("Todas as combinações registradas:"),
            FutureBuilder<List<DataRow>>(
                future: generateDataRowList(),
                builder: (context, AsyncSnapshot<List<DataRow>> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return CircularProgressIndicator();
                    case ConnectionState.done:
                      return DataTable(columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            'Mapa',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Personagem escolhido',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Personagem 2',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Personagem 3',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Personagem 4',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Personagem 5',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Vitórias',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Derrotas',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Vezes MVP',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Desistências',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ], rows: snapshot.data);
                    default:
                      return null;
                  }
                })
          ],
        ),
      ),
    );
  }

  Future<List<DataRow>> generateDataRowList() async {
    List<Game> allGames = await ValorantDatabase.getAllGames();
    List<DataRow> dataRowList = new List();
    for (Game cp in allGames) {
      DataRow dr = DataRow(
        cells: <DataCell>[
          DataCell(Text(cp.vMap.name)),
          DataCell(Text(cp.selectedCharacter.name)),
          DataCell(Text(cp.otherTeamCharacters[0].name)),
          DataCell(Text(cp.otherTeamCharacters[1].name)),
          DataCell(Text(cp.otherTeamCharacters[2].name)),
          DataCell(Text(cp.otherTeamCharacters[3].name)),
          DataCell(Text(cp.otherTeamCharacters[0].name)),
          DataCell(Text(cp.wincount.toString())),
          DataCell(Text(cp.losecount.toString())),
          DataCell(Text(cp.mvpcount.toString())),
          DataCell(Text(cp.ffcount.toString())),
        ],
      );
      dataRowList.add(dr);
    }
    return dataRowList;
  }
}
