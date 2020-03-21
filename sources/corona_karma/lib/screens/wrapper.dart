import 'package:corona_karma/screens/authenticate/authenticate.dart';
import 'package:corona_karma/screens/home/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // return Home or Authenticate
    return Authenticate();
  }
}