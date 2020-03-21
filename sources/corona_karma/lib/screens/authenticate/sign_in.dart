import 'package:corona_karma/models/user.dart';
import 'package:corona_karma/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In for Karma"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical:16.0, horizontal: 30),
        child: RaisedButton(
          child: Text("Sign in anon"),
          onPressed: () async {
            User result = await authService.signInAnon();
            if(result == null) {
              print("Error signing in");
            } else {
              print("signed in");
              print(result);
            }
          })),
    );
  }
}