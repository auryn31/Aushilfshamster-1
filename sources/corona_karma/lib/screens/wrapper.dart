import 'package:corona_karma/screens/authenticate/authenticate.dart';
import 'package:corona_karma/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:corona_karma/models/user.dart';
import 'package:flutter/cupertino.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    // return Home or Authenticate
    return user == null ? Authenticate() : Home();
  }
}
