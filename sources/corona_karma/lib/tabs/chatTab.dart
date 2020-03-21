import 'package:corona_karma/widgets/titleBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/chatPreview.dart';

Widget chatBuilder(context) {
  return CupertinoPageScaffold(
    navigationBar: CupertinoNavigationBar(
        middle: TitleBar(titleText: "Deine Nachrichten")),
    child: SafeArea(
        child: ListView(children: [
      ChatPreview(
          name: "Albert Meier",
          time: DateTime.now().subtract(Duration(minutes: 10)),
          message: "Du: Hey Albert! Ich könnte heute um 14 Uhr deinen Hund mit",
          iconName: "dog"),
      Divider(),
      ChatPreview(
          name: "Susanne Fröhlich",
          time: DateTime.now().subtract(Duration(minutes: 30, hours: 24)),
          message: "Wunderbar! Schreib mir nachher einfach, wie viel du",
          iconName: "groceries"),
      Divider(),
      ChatPreview(
          name: "Jürgen Fritsch",
          time: DateTime.now().subtract(Duration(minutes: 15)),
          message: "Du: Ich wünsche dir gute Besserung! Melde dich wenn",
          iconName: "pills"),
      Divider(),
      ChatPreview(
          name: "Martin Tim Rolf",
          time: DateTime.now().subtract(Duration(minutes: 20)),
          message:
              "Danke dir! Da wird sich meine Tochter sicher drüber freuen.",
          iconName: "postal"),
      Divider(),
      ChatPreview(
          name: "Johanna Semm",
          time: DateTime.now().subtract(Duration(minutes: 20)),
          message:
              "Danke dir! Da wird sich meine Tochter sicher drüber freuen.",
          iconName: "postal"),
      Divider(),
      ChatPreview(
          name: "Gerhard Kunze",
          time: DateTime.now().subtract(Duration(minutes: 20)),
          message:
              "Danke dir! Da wird sich meine Tochter sicher drüber freuen.",
          iconName: "postal"),
      Divider(),
      ChatPreview(
          name: "Beate Linse",
          time: DateTime.now().subtract(Duration(minutes: 20)),
          message:
              "Danke dir! Da wird sich meine Tochter sicher drüber freuen.",
          iconName: "pills"),
    ])),
  );
}
