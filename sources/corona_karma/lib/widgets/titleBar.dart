import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({
    Key key,
    this.titleText,
  }) : super(key: key);

  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 206, 84),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        padding: EdgeInsets.all(4),
        child: Text(titleText, style: Styles.navbarTitle));
  }
}
