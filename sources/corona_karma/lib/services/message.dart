import 'package:corona_karma/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageService {
  MessageService({this.chatID});
  final String chatID;

  final messagesCollections = Firestore.instance.collection('messages');

  Stream<Iterable<Message>> get messages {
    return messagesCollections
        .where("chatID", isEqualTo: chatID)
        .orderBy("timestamp")
        .snapshots()
        .map((QuerySnapshot snapshot) => snapshot.documents.map((doc) =>
            Message(
                text: doc.data["text"],
                sender: doc.data["sender"],
                timestamp: DateTime.fromMicrosecondsSinceEpoch(
                    doc.data["timestamp"]))));
  }

  Future sendMessage(String text, String sender) async {
    return await messagesCollections.add({
      'chatID': chatID,
      'text': text,
      'sender': sender,
      'timestamp': DateTime.now().microsecondsSinceEpoch
    });
  }
}
