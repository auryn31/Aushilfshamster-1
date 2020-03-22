import 'package:corona_karma/models/message.dart';
import 'package:corona_karma/models/user.dart';
import 'package:corona_karma/services/message.dart';
import 'package:corona_karma/widgets/chatMessage.dart';
import 'package:corona_karma/widgets/titleBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../styles.dart';
import '../../utils.dart';

class HelpedChatStatusHeaderWidget extends StatelessWidget {
  const HelpedChatStatusHeaderWidget(
      {Key key,
      this.proposalText,
      this.proposalIcon,
      this.retractTask,
      this.finishedTask})
      : super(key: key);

  final String proposalText;
  final String proposalIcon;

  final VoidCallback retractTask;
  final VoidCallback finishedTask;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 41, right: 41, top: 10, bottom: 10),
        child: Column(children: [
          Row(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
            SvgPicture.asset("assets/chatIcons/$proposalIcon.svg",
                width: 80, height: 80),
            Expanded(
                child: Container(
                    margin: EdgeInsets.only(left: 13),
                    child: Text(proposalText,
                        style: Styles.messageTimeText, maxLines: 3)))
          ]),
          Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(children: <Widget>[
                Spacer(),
                GestureDetector(
                    onTap: retractTask,
                    child: Container(
                        padding: EdgeInsets.all(9),
                        decoration: BoxDecoration(
                            border: Border.all(color: Styles.blue1),
                            borderRadius: BorderRadius.all(Radius.circular(3))),
                        child: Text("Aufgabe zurückziehen",
                            style: Styles.editProfileButton))),
                Spacer(),
                GestureDetector(
                    onTap: finishedTask,
                    child: Container(
                        padding: EdgeInsets.only(
                            left: 30, right: 30, top: 9, bottom: 9),
                        decoration: BoxDecoration(
                            border: Border.all(color: Styles.blue4),
                            color: Styles.blue4,
                            borderRadius: BorderRadius.all(Radius.circular(3))),
                        child: Text("Erledigt",
                            style: Styles.editProfileButton
                                .merge(TextStyle(color: Colors.white))))),
                Spacer(),
              ])),
        ]));
  }
}

class HelpedChatWidget extends StatefulWidget {
  const HelpedChatWidget(
      {Key key, this.chatID, this.chatPartnerName, this.proposalIcon})
      : super(key: key);

  final String chatID;
  final String chatPartnerName;
  final String proposalIcon;

  _HelpedChatState createState() =>
      _HelpedChatState(chatID, chatPartnerName, proposalIcon);
}

class _HelpedChatState extends State<HelpedChatWidget> {
  _HelpedChatState(this._chatID, this._chatPartnerName, this._proposalIcon);

  final String _chatPartnerName;
  final String _proposalIcon;
  final String _chatID;
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  Future finishChat(String chatID) =>
      Firestore.instance.collection('chats').document(chatID).updateData({
        'done': true,
      });

  Future retractChat(String chatID) =>
      Firestore.instance.collection('chats').document(chatID).delete();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final messageService = MessageService(chatID: _chatID);

    return StreamProvider<Iterable<Message>>.value(
        value: messageService.messages,
        child: CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
                middle: TitleBar(titleText: _chatPartnerName)),
            child: SafeArea(
                child: Column(children: [
              HelpedChatStatusHeaderWidget(
                  proposalIcon: _proposalIcon,
                  proposalText:
                      "$_chatPartnerName ${getHelperTextFromIcon(_proposalIcon)}",
                  retractTask: () {
                    retractChat(_chatID);
                    Navigator.pop(context);
                  },
                  finishedTask: () {
                    finishChat(_chatID);
                    Navigator.pop(context);
                  }),
              Divider(),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.all(18),
                      child: Consumer<Iterable<Message>>(
                          builder: (context, messages, _) => ListView.builder(
                              itemCount: messages == null ? 0 : messages.length,
                              itemBuilder: (context, index) =>
                                  ChatMessageWidget(
                                      messageText:
                                          messages.elementAt(index).text,
                                      sent: messages.elementAt(index).sender !=
                                          user.uid))))),
              Container(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: CupertinoTextField(
                    controller: _textController,
                    textInputAction: TextInputAction.send,
                    placeholder: "Schreibe eine Nachricht...",
                    placeholderStyle: Styles.messagePlaceholder,
                    onSubmitted: (String message) {
                      messageService.sendMessage(message, user.uid);
                      _textController.text = "";
                    },
                  ))
            ]))));
  }
}
