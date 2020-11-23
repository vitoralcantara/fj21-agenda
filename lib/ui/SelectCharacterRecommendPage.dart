import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valorant_self_statistics/model/Game.dart';

class SelectCharacterRecommendPage extends StatefulWidget {
  Game currentGame;

  SelectCharacterRecommendPage(Game currentGame) {
    this.currentGame = currentGame;
  }

  @override
  State<StatefulWidget> createState() =>
      _SelectCharacterRecommendPage(currentGame);
}

class _SelectCharacterRecommendPage
    extends State<SelectCharacterRecommendPage> {
  Game currentGame;
  String valorantMapDropDownValue;
  String selectedCharacter;
  List<String> otherTeamCharacters = ["", "", "", ""];

  _SelectCharacterRecommendPage(Game currentGame) {
    this.currentGame = currentGame;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text("Mapa a ser jogado: " + currentGame.getSelectedMap()),
            Text("Jogador 2 escolhido: " + currentGame.getSelectedCharacter2()),
            Text("Jogador 3 escolhido: " + currentGame.getSelectedCharacter3()),
            Text("Jogador 4 escolhido: " + currentGame.getSelectedCharacter4()),
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
                            'Personagem a escolher',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Saldo',
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
    List<Game> characterProbabilityList = await currentGame.getProbabilities();
    List<DataRow> dataRowList = new List();
    for (Game cp in characterProbabilityList) {
      DataRow dr = DataRow(
        cells: <DataCell>[
          DataCell(Text(cp.selectedCharacter.name)),
          DataCell(Text(cp.wincount.toString())),
          DataCell(Text(cp.losecount.toString())),
          DataCell(Text(cp.getBalance().toString())),
        ],
      );
      dataRowList.add(dr);
    }
    return dataRowList;
  }
}
