import 'package:corona_karma/widgets/itemStack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileCupboardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) =>
                Stack(children: <Widget>[
                  Positioned(
                      right: 0,
                      child: SvgPicture.asset(
                        "assets/shelfIcons/shelf_beam.svg",
                        height: constraints.maxHeight,
                      )),
                  Positioned(
                      left: 0,
                      child: SvgPicture.asset(
                        "assets/shelfIcons/shelf_beam.svg",
                        height: constraints.maxHeight,
                      )),
                  Container(
                      margin: EdgeInsets.only(
                          top: 20, bottom: 25, left: 5, right: 5),
                      child: ListView(
                        children: <Widget>[
                          CupboardRowWidget(
                              iconName: "toilet_roll", stackSize: 1),
                          CupboardRowWidget(iconName: "cereal", stackSize: 9),
                          CupboardRowWidget(iconName: "bleach", stackSize: 10),
                          CupboardRowWidget(iconName: "pasta", stackSize: 2),
                        ],
                      ))
                ])));
  }
}

class CupboardRowWidget extends StatelessWidget {
  const CupboardRowWidget({
    Key key,
    this.stackSize,
    this.iconName,
  }) : super(key: key);

  final int stackSize;
  final String iconName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 70,
        child: Stack(children: <Widget>[
          Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset("assets/shelfIcons/shelf.svg",
                  width: double.infinity)),
          Align(
              alignment: Alignment.topCenter,
              child: ItemStack(iconName: iconName, stackSize: stackSize))
        ]));
  }
}
