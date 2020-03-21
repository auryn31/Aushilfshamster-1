import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

abstract class Styles {
  static const TextStyle messageTimeText = TextStyle(
      fontSize: 15,
      color: Color.fromARGB(153, 60, 60, 67),
      fontFamily: "IBM Plex Sans");

  static const TextStyle messageUserNameText = TextStyle(
      fontSize: 15,
      color: Color.fromARGB(255, 62, 62, 62),
      fontFamily: "IBM Plex Sans",
      fontWeight: FontWeight.w500);

  static const TextStyle messageText = TextStyle(
    fontSize: 15,
    color: Color.fromARGB(255, 62, 62, 62),
    fontFamily: "IBM Plex Sans",
  );

  static const TextStyle navbarTitle = TextStyle(
      fontSize: 21,
      color: Color.fromARGB(255, 0, 0, 0),
      fontFamily: "IBM Plex Sans",
      fontWeight: FontWeight.w600);

  static const TextStyle editProfileButton = TextStyle(
      fontSize: 15,
      color: Color.fromARGB(255, 23, 126, 232),
      fontFamily: "IBM Plex Sans");

  static const Color blue1 = Color(0xFF80d8ff);
  static const Color blue2 = Color(0xFF40c4ff);
  static const Color blue3 = Color(0xFF00b0ff);
  static const Color blue4 = Color(0xFF177EE8);

  static const Color yellow1 = Color(0xFFffe57f);
  static const Color yellow2 = Color(0xFFffd740);
  static const Color yellow3 = Color(0xFFffc400);
  static const Color yellow4 = Color(0xFFffab00);
}
