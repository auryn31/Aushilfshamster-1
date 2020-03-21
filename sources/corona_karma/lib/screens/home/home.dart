import 'package:corona_karma/services/auth.dart';
import 'package:flutter/cupertino.dart';

import '../../widgets/chatPreview.dart';
import '../../widgets/itemStack.dart';

class Home extends StatelessWidget {
  final AuthService _authService = AuthService();

  Widget _chatBuilder(context) {
    return CupertinoPageScaffold(
      child: SafeArea(
          child: Column(children: [
        ChatPreview(
            name: "Albert Meier",
            time: DateTime.now().subtract(Duration(minutes: 10)),
            message:
                "Du: Hey Albert! Ich könnte heute um 14 Uhr deinen Hund mit",
            iconName: "dog"),
        ChatPreview(
            name: "Susanne Fröhlich",
            time: DateTime.now().subtract(Duration(minutes: 30, hours: 24)),
            message: "Wunderbar! Schreib mir nachher einfach, wie viel du",
            iconName: "groceries"),
        ChatPreview(
            name: "Jürgen Fritsch",
            time: DateTime.now().subtract(Duration(minutes: 15)),
            message: "Du: Ich wünsche dir gute Besserung! Melde dich wenn",
            iconName: "pills"),
        ChatPreview(
            name: "Martin Tim Rolf",
            time: DateTime.now().subtract(Duration(minutes: 20)),
            message:
                "Danke dir! Da wird sich meine Tochter sicher drüber freuen.",
            iconName: "postal"),
      ])),
    );
  }

  Widget _profileBuilder(context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Profil"),
          trailing: CupertinoButton(
            onPressed: () async {
              await _authService.signOut();
            },
            child: Icon(CupertinoIcons.padlock),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                  child: ItemStack(
                      stackSize: 10,
                      stackIcon: AssetImage('assets/bleach.png'))),
              Expanded(
                  child: ItemStack(
                      stackSize: 20, stackIcon: AssetImage('assets/can.png'))),
              Expanded(
                  child: ItemStack(
                      stackSize: 30, stackIcon: AssetImage('assets/corn.png'))),
              Expanded(
                  child: ItemStack(
                      stackSize: 40,
                      stackIcon: AssetImage('assets/spaghetti.png'))),
              Expanded(
                  child: ItemStack(
                      stackSize: 50,
                      stackIcon: AssetImage('assets/toilet_paper.png')))
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search), title: Text("Karte")),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search), title: Text("Chats")),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search), title: Text("Profil")),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: SafeArea(child: Text("Karte")),
              );
            });
          case 1:
            return CupertinoTabView(builder: _chatBuilder);
          case 2:
            return CupertinoTabView(builder: _profileBuilder);
        }
      },
    ));
  }
}
