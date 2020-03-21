import 'package:corona_karma/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  const Register(this.toggleView);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register for Karma"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.person), onPressed: () => widget.toggleView())
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
                onChanged: (value) {
                  setState(() => password = value);
                },
                obscureText: true,
                validator: (value) =>
                    value.length < 6 ? 'Enter a password 6+ chars long ' : null,
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text("Register"),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result =
                        await authService.register(email, password);
                    if (result == null) {
                      setState(() => error = "error while create account");
                    }
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
