import 'package:flutter/cupertino.dart';

import '../styles.dart';

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget({
    Key key,
    this.messageText,
    this.sent,
  }) : super(key: key);

  final String messageText;
  final bool sent;

  Widget build(BuildContext context) {
    var inset;

    if (sent) {
      inset = EdgeInsets.only(right: 100);
    } else {
      inset = EdgeInsets.only(left: 100);
    }

    return Container(
        margin: EdgeInsets.only(top: 15).add(inset),
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
            border: Border.all(color: Styles.grey2),
            color: Styles.grey2,
            borderRadius: BorderRadius.all(Radius.circular(3))),
        child: Text(messageText));
  }
}
