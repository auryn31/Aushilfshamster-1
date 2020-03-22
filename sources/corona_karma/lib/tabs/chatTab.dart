import 'dart:async';

import 'package:corona_karma/models/chat.dart';
import 'package:corona_karma/models/message.dart';
import 'package:corona_karma/models/user.dart';
import 'package:corona_karma/screens/chat/helped.dart';
import 'package:corona_karma/services/message.dart';
import 'package:corona_karma/widgets/titleBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/chatPreview.dart';

class ChatListWidget extends StatelessWidget {
  String _getPartnerName(User me, Chat chat) {
    return chat.ownerNames
        .elementAt(chat.owners.indexWhere((owner) => owner != me.uid));
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Consumer<Iterable<Chat>>(
        builder: (context, chats, _) => ListView.builder(
            itemCount: chats == null ? 0 : chats.length,
            itemBuilder: (context, index) => GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => HelpedChatWidget(
                                chatID: chats.elementAt(index).chatID,
                                chatPartnerName: _getPartnerName(
                                    user, chats.elementAt(index)),
                                proposalIcon: chats.elementAt(index).chatIcon,
                                proposalText:
                                    "Susanne hat angeboten, für dich Medikamente von der Apotheke abzuholen.",
                              )));
                },
                child: StreamProvider<Message>.value(
                    value: MessageService(chatID: chats.elementAt(index).chatID)
                        .lastMessage,
                    child: Consumer<Message>(
                        builder: (context, message, _) => message == null
                            ? ChatPreview(
                                name: _getPartnerName(
                                    user, chats.elementAt(index)),
                                time: DateTime.now(),
                                message: "",
                                iconName: chats.elementAt(index).chatIcon)
                            : ChatPreview(
                                name: _getPartnerName(
                                    user, chats.elementAt(index)),
                                time: message.timestamp,
                                message: message.text,
                                iconName: chats.elementAt(index).chatIcon))))));
  }
}

Widget chatBuilder(context) {
  return CupertinoPageScaffold(
    navigationBar: CupertinoNavigationBar(
        middle: TitleBar(titleText: "Deine Nachrichten")),
    child: SafeArea(child: ChatListWidget()),
  );
}
