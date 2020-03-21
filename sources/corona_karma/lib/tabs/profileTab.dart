import 'package:corona_karma/services/auth.dart';
import 'package:corona_karma/widgets/itemStack.dart';
import 'package:corona_karma/widgets/titleBar.dart';
import 'package:flutter/cupertino.dart';

Widget profileBuilder(context) {
  final AuthService _authService = AuthService();

  return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: TitleBar(titleText: "Dein Profil"),
        trailing: CupertinoButton(
          onPressed: () async {
            await _authService.signOut();
          },
          child: Icon(CupertinoIcons.padlock),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
                child: ItemStack(
                    stackSize: 10, stackIcon: AssetImage('assets/bleach.png'))),
            Expanded(
                child: ItemStack(
                    stackSize: 20, stackIcon: AssetImage('assets/can.png'))),
            Expanded(
                child: ItemStack(
                    stackSize: 30, stackIcon: AssetImage('assets/corn.png'))),
            Expanded(
                child: ItemStack(
                    stackSize: 40,
                    stackIcon: AssetImage('assets/spaghetti.png'))),
            Expanded(
                child: ItemStack(
                    stackSize: 50,
                    stackIcon: AssetImage('assets/toilet_paper.png')))
          ],
        ),
      ));
}
