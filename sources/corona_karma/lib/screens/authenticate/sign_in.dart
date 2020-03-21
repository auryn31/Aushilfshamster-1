import 'package:corona_karma/services/auth.dart';
import 'package:flutter/cupertino.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  const SignIn(this.toggleView);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService authService = AuthService();

  String email = "";
  String password = "";
  String error = "";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          middle: Text("Sign In for Karma"),
          trailing: CupertinoButton(
              child: Icon(CupertinoIcons.person_add),
              onPressed: () => widget.toggleView())),
      child: loading
          ? Container(
              child: new Center(
                child: new CupertinoActivityIndicator(),
              ),
            )
          : Container(
              padding: EdgeInsets.fromLTRB(16, 82, 16, 0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  CupertinoTextField(
                    placeholder: "Email",
                    onChanged: (value) => setState(() => email = value),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CupertinoTextField(
                    placeholder: "Password",
                    onChanged: (value) => setState(() => password = value),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CupertinoButton(
                    child: Text("Sign in"),
                    onPressed: () async {
                      setState(() => loading = true);
                      dynamic result =
                          await authService.signIn(email, password);
                      setState(() => loading = false);
                      if (result == null) {
                        setState(() => error = "ERROR while login");
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    error,
                    style: TextStyle(
                        color: CupertinoColors.destructiveRed, fontSize: 20),
                  )
                ],
              ),
            ),
    );
  }
}
