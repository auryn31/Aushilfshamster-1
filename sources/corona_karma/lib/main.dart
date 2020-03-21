import 'package:corona_karma/models/user.dart';
import 'package:corona_karma/screens/wrapper.dart';
import 'package:corona_karma/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: Wrapper(),
      ),
    );
  }
}
