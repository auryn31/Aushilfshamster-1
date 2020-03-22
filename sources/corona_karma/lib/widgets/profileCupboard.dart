import 'package:corona_karma/widgets/itemStack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ProfileCupboardWidget extends StatelessWidget {
  List<Widget> cupboardRows(int items) {
    List<Widget> rows = List();

    int rowsToGenerate = (items / 10).round();

    for (var i = 0; i < rowsToGenerate; i++) {
      rows.add(CupboardRowWidget(iconName: "toilet_roll", stackSize: 10));
    }

    rows.add(CupboardRowWidget(iconName: "toilet_roll", stackSize: items % 10));

    return rows;
  }

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
                      child: Consumer<int>(
                          builder: (context, items, _) => items == null
                              ? ListView(children: cupboardRows(0))
                              : ListView(children: cupboardRows(items))))
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
