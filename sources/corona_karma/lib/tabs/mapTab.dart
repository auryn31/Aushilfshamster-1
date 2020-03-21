import 'package:corona_karma/screens/maps/maps.dart';
import 'package:corona_karma/widgets/titleBar.dart';
import 'package:flutter/cupertino.dart';

Widget buildMaps(context) {
  return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: TitleBar(titleText: "Wo kannst du heute helfen?"),
      ),
      child: SafeArea(child: MapSample()));
}
