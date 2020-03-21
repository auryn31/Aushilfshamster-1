import 'package:corona_karma/models/user.dart';
import 'package:corona_karma/widgets/userProfile.dart';
import 'package:provider/provider.dart';
import 'package:corona_karma/widgets/titleBar.dart';
import 'package:flutter/cupertino.dart';

Widget profileBuilder(context) {
  final user = Provider.of<User>(context);

  return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: TitleBar(titleText: "Hallo ${user.name}"),
      ),
      child: SafeArea(
          child: UserProfileWidget(skills: [
        "• Einkaufen gehen",
        "• Hund ausführen",
        "• Medikament besorgen",
        "• Post holen/bringen"
      ])));
}
