import 'package:corona_karma/services/auth.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search), title: Text("Suche")),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search), title: Text("Biete")),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search), title: Text("List")),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search), title: Text("Profil")),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: SafeArea(child: Text("Suche")),
              );
            });
          case 1:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: SafeArea(child: Text("Biete")),
              );
            });
          case 2:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: SafeArea(child: Text("List")),
              );
            });
          case 3:
            return CupertinoTabView(builder: (context) {
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
                child: SafeArea(child: Text("Profil")),
              );
            });
        }
      },
    ));
  }
}
