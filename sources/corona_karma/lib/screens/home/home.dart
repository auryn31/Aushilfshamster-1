import 'package:corona_karma/services/auth.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Corona Karma"),
          trailing: 
          CupertinoButton(
              onPressed: () async {
                await _authService.signOut();
              },
              child: Icon(CupertinoIcons.padlock),
            ),
        ),
        child: Center(
          child: Text("You are logged in"),
        ),
      ),
    );
  }
}
