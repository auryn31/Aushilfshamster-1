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
    return Stack(children: [
      Align(
          alignment: Alignment(0.0, 0.5),
          child: SizedBox(
            height: 12,
            width: MediaQuery.of(context).size.width / 2.25,
            child: DecoratedBox(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 255, 206, 84))),
          )),
      Center(child: Text(titleText, style: Styles.navbarTitle))
    ]);
  }
}
