import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valorant_self_statistics/dao/Database.dart';
import 'package:valorant_self_statistics/model/Character.dart';
import 'package:valorant_self_statistics/model/ValorantMap.dart';

class ChooseTime extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChooseTime();
}

class _ChooseTime extends State<ChooseTime> {
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
            FutureBuilder<List<ValorantMap>>(
                future: ValorantDatabase.getValorantMapList(),
                builder: (context, AsyncSnapshot<List<ValorantMap>> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                    case ConnectionState.active:
                      return CircularProgressIndicator();
                    case ConnectionState.done:
                      return DropdownButton(
                          value: valorantMapDropDownValue,
                          items: snapshot.data.map<DropdownMenuItem<String>>(
                              (ValorantMap value) {
                            return DropdownMenuItem<String>(
                              value: value.name,
                              child: Text(value.name),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState() {
                              valorantMapDropDownValue = newValue;
                            }
                          });
                    default:
                      return null;
                  }
                }),
            FutureBuilder<List<Character>>(
                future: ValorantDatabase.getCharactersList(),
                builder: (context, AsyncSnapshot<List<Character>> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                    case ConnectionState.active:
                      return CircularProgressIndicator();
                    case ConnectionState.done:
                      return DropdownButton(
                          value: otherTeamCharacters[0],
                          items: snapshot.data
                              .map<DropdownMenuItem<String>>((Character value) {
                            return DropdownMenuItem<String>(
                              value: value.name,
                              child: Text(value.name),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState() {
                              otherTeamCharacters[0] = newValue;
                            }
                          });
                    default:
                      return null;
                  }
                }),
            FutureBuilder<List<Character>>(
                future: ValorantDatabase.getCharactersList(),
                builder: (context, AsyncSnapshot<List<Character>> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                    case ConnectionState.active:
                      return CircularProgressIndicator();
                    case ConnectionState.done:
                      return DropdownButton(
                          value: otherTeamCharacters[1],
                          items: snapshot.data
                              .map<DropdownMenuItem<String>>((Character value) {
                            return DropdownMenuItem<String>(
                              value: value.name,
                              child: Text(value.name),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState() {
                              otherTeamCharacters[1] = newValue;
                            }
                          });
                    default:
                      return null;
                  }
                }),
            FutureBuilder<List<Character>>(
                future: ValorantDatabase.getCharactersList(),
                builder: (context, AsyncSnapshot<List<Character>> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                    case ConnectionState.active:
                      return CircularProgressIndicator();
                    case ConnectionState.done:
                      return DropdownButton(
                          value: otherTeamCharacters[2],
                          items: snapshot.data
                              .map<DropdownMenuItem<String>>((Character value) {
                            return DropdownMenuItem<String>(
                              value: value.name,
                              child: Text(value.name),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState() {
                              otherTeamCharacters[2] = newValue;
                            }
                          });
                    default:
                      return null;
                  }
                }),
            FutureBuilder<List<Character>>(
                future: ValorantDatabase.getCharactersList(),
                builder: (context, AsyncSnapshot<List<Character>> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                    case ConnectionState.active:
                      return CircularProgressIndicator();
                    case ConnectionState.done:
                      return DropdownButton(
                          value: otherTeamCharacters[3],
                          items: snapshot.data
                              .map<DropdownMenuItem<String>>((Character value) {
                            return DropdownMenuItem<String>(
                              value: value.name,
                              child: Text(value.name),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState() {
                              otherTeamCharacters[3] = newValue;
                            }
                          });
                    default:
                      return null;
                  }
                }),
            TextButton(onPressed: (){

            }, child: Text("Ver resultado"))
          ],
        ),
      ),
    );
  }
}
