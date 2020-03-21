import 'package:corona_karma/models/user.dart';
import 'package:corona_karma/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  const SignIn(this.toggleView);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In for Karma"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.person_add),
              onPressed: () => widget.toggleView())
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.person), labelText: "Email"),
                onChanged: (value) => setState(() => email = value),
                validator: (value) => value.isEmpty ? 'Enter an email' : null,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.lock), labelText: "Password"),
                onChanged: (value) => setState(() => password = value),
                validator: (value) => value.isEmpty ? 'Enter a passwort' : null,
                obscureText: true,
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text("Sign in"),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    authService.signIn(email, password);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
