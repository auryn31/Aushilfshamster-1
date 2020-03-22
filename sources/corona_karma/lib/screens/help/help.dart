import 'package:corona_karma/models/help.dart';
import 'package:corona_karma/styles.dart';
import 'package:corona_karma/widgets/titleBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  String searchText;

  Help(this.searchText);

  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  List<HelpInformation> informations = [
    HelpInformation("Hund ausführen"),
    HelpInformation("Einkaufen gehen"),
    HelpInformation("Medizin abholen"),
    HelpInformation("Paket abholen"),
    HelpInformation("Gartenarbeit"),
    HelpInformation("Telefonanruf"),
    HelpInformation("Sag und, um was es geht"),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> informationRows = [];

    for (int i = 0; i < informations.length; i++) {
      var row = Container(
        child: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  informations[i].value = !informations[i].value;
                });
              },
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Styles.blue4, width: 1.5),
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                  ),
                  informations[i].value
                      ? Center(
                          child: Icon(CupertinoIcons.check_mark,
                              color: Colors.black),
                        )
                      : Container(),
                ],
              ),
            ),
            Text(informations[i].text)
          ],
        ),
        margin: EdgeInsets.only(bottom: 12, top: 12),
      );
      informationRows.add(row);
    }
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: TitleBar(titleText: "Wobei brauchst du Hilfe"),
      ),
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.all(32),
          child: Column(
            children: <Widget>[
              Flexible(
                  child: new Text(
                      "Gib hier an, wobei du die Hilfe deiner Nachbarn benötigst. Du kannst auch mehrere Aufgaben auswählen.")),
              ...informationRows,
              Container(
                child: Row(
                  children: <Widget>[
                    CupertinoButton(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Styles.blue4,
                            borderRadius: BorderRadius.circular(36),
                          ),
                          height: 36,
                          width: 36,
                          child: Icon(
                            CupertinoIcons.add,
                            color: Colors.white,
                            size: 36,
                          ),
                        ),
                        onPressed: () {}),
                    Text("Notiz hinzufügen")
                  ],
                ),
                margin: EdgeInsets.only(bottom: 12, top: 12),
              ),
              CupertinoButton(
                child: Text("Hilfe anfragen"),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
