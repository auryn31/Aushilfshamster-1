import 'package:corona_karma/services/auth.dart';
import 'package:corona_karma/tabs/profileTab.dart';
import 'package:corona_karma/widgets/titleBar.dart';
import 'package:flutter/cupertino.dart';

import '../../tabs/chatTab.dart';

class Home extends StatelessWidget {
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
                navigationBar: CupertinoNavigationBar(
                  middle: TitleBar(titleText: "Wo kannst du heute helfen?"),
                ),
                child: SafeArea(child: Text("Karte")),
              );
            });
          case 1:
            return CupertinoTabView(builder: chatBuilder);
          case 2:
            return CupertinoTabView(builder: profileBuilder);
        }
      },
    ));
  }
}
