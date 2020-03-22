import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../styles.dart';

class ChatPreview extends StatelessWidget {
  const ChatPreview(
      {Key key, this.name, this.time, this.message, this.iconName})
      : super(key: key);

  final String name;
  final DateTime time;
  final String message;
  final String iconName;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(19, 15, 19, 10),
        child: Row(children: [
          Container(
              margin: EdgeInsets.only(right: 15),
              child: SvgPicture.asset("assets/chatIcons/$iconName.svg",
                  width: 55, height: 55)),
          Expanded(
              child: Column(
            children: <Widget>[
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(name, style: Styles.messageUserNameText),
                    Text(timeago.format(time, locale: 'de'),
                        style: Styles.messageTimeText)
                  ]),
              Container(
                  margin: EdgeInsets.only(right: 23, top: 4),
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        message,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Styles.messageText,
                      )))
            ],
          ))
        ]));
  }
}
