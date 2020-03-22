import 'package:corona_karma/models/chat.dart';
import 'package:corona_karma/models/message.dart';
import 'package:corona_karma/models/user.dart';
import 'package:corona_karma/screens/chat/helped.dart';
import 'package:corona_karma/services/message.dart';
import 'package:corona_karma/widgets/helpRequest.dart';
import 'package:corona_karma/widgets/titleBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/chatPreview.dart';

class ChatListWidget extends StatelessWidget {
  Future acceptChat(String chatID) =>
      Firestore.instance.collection('chats').document(chatID).updateData({
        'accepted': true,
      });

  Future declineChat(String chatID) =>
      Firestore.instance.collection('chats').document(chatID).delete();

  String _getPartnerName(User me, Chat chat) {
    return chat.ownerNames
        .elementAt(chat.owners.indexWhere((owner) => owner != me.uid));
  }

  Widget buildHelpRequest(context, Chat chat, User user) {
    return HelpRequestWidget(
        onAccept: () => acceptChat(chat.chatID),
        onDelete: () => declineChat(chat.chatID),
        postTime: chat.timestamp,
        proposalIcon: chat.chatIcon,
        helperName: _getPartnerName(user, chat));
  }

  Widget buildChatPreview(context, Chat chat, User user) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => HelpedChatWidget(
                        chatID: chat.chatID,
                        chatPartnerName: _getPartnerName(user, chat),
                        proposalIcon: chat.chatIcon,
                      )));
        },
        child: StreamProvider<Message>.value(
            value: MessageService(chatID: chat.chatID).lastMessage,
            child: Consumer<Message>(
                builder: (context, message, _) => message == null
                    ? ChatPreview(
                        name: _getPartnerName(user, chat),
                        time: DateTime.now(),
                        message: "",
                        iconName: chat.chatIcon)
                    : ChatPreview(
                        name: _getPartnerName(user, chat),
                        time: message.timestamp,
                        message: message.text,
                        iconName: chat.chatIcon))));
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Consumer<Iterable<Chat>>(
        builder: (context, chats, _) => ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: chats == null ? 0 : chats.length,
            itemBuilder: (context, index) {
              var chat = chats.elementAt(index);
              if (!chat.accepted) {
                return buildHelpRequest(context, chat, user);
              }
              return buildChatPreview(context, chat, user);
            }));
  }
}

Widget chatBuilder(context) {
  return CupertinoPageScaffold(
    navigationBar: CupertinoNavigationBar(
        middle: TitleBar(titleText: "Deine Nachrichten")),
    child: SafeArea(child: ChatListWidget()),
  );
}
