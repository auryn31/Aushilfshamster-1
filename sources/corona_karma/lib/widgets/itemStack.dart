import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemStack extends StatelessWidget {
  const ItemStack({
    Key key,
    this.stackSize,
    this.iconName,
  }) : super(key: key);

  final double stackOffset = 30;
  final int stackSize;
  final String iconName;

  @override
  Widget build(BuildContext context) {
    var list = List<Widget>(stackSize);

    for (var i = 0; i < list.length; i++) {
      list[i] = Positioned(
        left: i * stackOffset,
        child: SvgPicture.asset("assets/shelfIcons/$iconName.svg",
            width: 50, height: 50),
      );
    }

    return SizedBox(
        width: 50 + stackSize * stackOffset - stackOffset,
        height: 50,
        child: Stack(children: list));
  }
}
