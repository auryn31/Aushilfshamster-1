import 'package:corona_karma/screens/maps/maps.dart';
import 'package:corona_karma/services/database.dart';
import 'package:corona_karma/widgets/titleBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Widget buildMaps(context) {
  return StreamProvider<List<PositionData>>.value(
    value: DatabaseService().positions,
    child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: TitleBar(titleText: "Wo kannst du heute helfen?"),
        ),
        child: SafeArea(child: MapSample())),
  );
}
