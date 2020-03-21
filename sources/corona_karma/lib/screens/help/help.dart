import 'package:corona_karma/models/help.dart';
import 'package:corona_karma/widgets/titleBar.dart';
import 'package:flutter/cupertino.dart';

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
    HelpInformation("NIX KANNIK"),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> informationRows = [];

    for (int i = 0; i < informations.length; i++) {
      var row = Container(
        child: Row(
          children: <Widget>[
            CupertinoSwitch(
              onChanged: (value) {
                setState(() {
                  informations[i].value = value;
                });
              },
              value: informations[i].value,
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
            ],
          ),
        ),
      ),
    );
  }
}
