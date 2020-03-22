import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../styles.dart';
import '../utils.dart';

class HelpRequestWidget extends StatelessWidget {
  const HelpRequestWidget(
      {Key key,
      this.proposalIcon,
      this.helperName,
      this.postTime,
      this.onAccept,
      this.onDelete})
      : super(key: key);
  final String proposalIcon;
  final String helperName;
  final DateTime postTime;

  final VoidCallback onAccept;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 41, right: 41, top: 10, bottom: 10),
        child: Column(children: [
          Row(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
            SvgPicture.asset("assets/chatIcons/$proposalIcon.svg",
                width: 80, height: 80),
            Expanded(
                child: Column(children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(helperName),
                  Text(timeago.format(postTime, locale: 'de'),
                      style: Styles.messageTimeText)
                ],
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                      "$helperName ${getHelperTextFromIcon(proposalIcon)}",
                      style: Styles.messageTimeText,
                      maxLines: 3))
            ]))
          ]),
          Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(children: <Widget>[
                Spacer(),
                GestureDetector(
                    onTap: onDelete,
                    child: Container(
                        padding: EdgeInsets.only(
                            left: 30, right: 30, top: 9, bottom: 9),
                        decoration: BoxDecoration(
                            border: Border.all(color: Styles.blue1),
                            borderRadius: BorderRadius.all(Radius.circular(3))),
                        child:
                            Text("Ablehnen", style: Styles.editProfileButton))),
                Spacer(),
                GestureDetector(
                    onTap: onAccept,
                    child: Container(
                        padding: EdgeInsets.only(
                            left: 30, right: 30, top: 9, bottom: 9),
                        decoration: BoxDecoration(
                            border: Border.all(color: Styles.blue4),
                            color: Styles.blue4,
                            borderRadius: BorderRadius.all(Radius.circular(3))),
                        child: Text("Annehmen",
                            style: Styles.editProfileButton
                                .merge(TextStyle(color: Colors.white))))),
                Spacer(),
              ])),
        ]));
  }
}
