import 'package:corona_karma/screens/maps/maps.dart';
import 'package:corona_karma/services/auth.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatelessWidget {
  final AuthService _authService = AuthService();

  Widget _buildMaps(context) {
    return MapSample();
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
              icon: Icon(CupertinoIcons.search), title: Text("Biete")),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.collections), title: Text("List")),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person), title: Text("Profil")),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 1:
            return CupertinoTabView(builder: _buildMaps);
          case 0:
            return CupertinoPageScaffold(
                child: SafeArea(child: Text("Chat")),
              );
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
