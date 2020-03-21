import 'package:corona_karma/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Corona Carma"),
          actions: <Widget>[
            IconButton(
              onPressed: () async {
                await _authService.signOut();
              },
              icon: Icon(Icons.exit_to_app),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
          child: Text("You are logged in"),
        ),
      ),
    );
  }
}
