import 'package:corona_karma/tabs/mapTab.dart';
import 'package:corona_karma/tabs/profileTab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../tabs/chatTab.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
              icon: Container(
                  child: SvgPicture.asset("assets/tabIcons/map.svg"),
                  margin: EdgeInsets.only(top: 5)),
              activeIcon: Container(
                  child: SvgPicture.asset("assets/tabIcons/map_active.svg"),
                  margin: EdgeInsets.only(top: 5)),
              title: Text("Karte")),
          BottomNavigationBarItem(
              icon: Container(
                  child: SvgPicture.asset("assets/tabIcons/chat.svg"),
                  margin: EdgeInsets.only(top: 5)),
              activeIcon: Container(
                  child: SvgPicture.asset("assets/tabIcons/chat_active.svg"),
                  margin: EdgeInsets.only(top: 5)),
              title: Text("Chats")),
          BottomNavigationBarItem(
              icon: Container(
                  child: SvgPicture.asset("assets/tabIcons/profile.svg"),
                  margin: EdgeInsets.only(top: 5)),
              activeIcon: Container(
                  child: SvgPicture.asset("assets/tabIcons/profile_active.svg"),
                  margin: EdgeInsets.only(top: 5)),
              title: Text("Profil")),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: buildMaps);
          case 1:
            return CupertinoTabView(builder: chatBuilder);
          case 2:
            return CupertinoTabView(builder: profileBuilder);
          default:
            return CupertinoTabView(builder: buildMaps);
        }
      },
    ));
  }
}
