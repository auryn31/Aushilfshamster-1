import 'package:flutter/cupertino.dart';

class ItemStack extends StatelessWidget {
  const ItemStack({
    Key key,
    this.stackSize,
    this.stackIcon,
  }) : super(key: key);

  final int stackSize;
  final ImageProvider<dynamic> stackIcon;

  @override
  Widget build(BuildContext context) {
    var list = List<Widget>(stackSize);

    for (var i = 0; i < list.length; i++) {
      list[i] = Positioned(
        left: i * 5.0,
        child: Image(image: stackIcon, width: 50, height: 50),
      );
    }

    return Stack(children: list);
  }
}
